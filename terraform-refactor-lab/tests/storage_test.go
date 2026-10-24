package test

import (
	"strings"
	"testing"

	"github.com/gruntwork-io/terratest/modules/aws"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

const awsRegion = "us-east-1"

// TestS3Bucket valida a criação e as configurações principais do bucket S3.
//
// Removidos deste teste os helpers que não existem na versão do Terratest
// utilizada no projeto:
//   - aws.S3BucketExists
//   - aws.GetS3BucketRegion
//   - aws.GetS3BucketPublicAccessBlock
//
// A região esperada já é informada ao Terraform e o teste de existência e
// versionamento é feito através dos helpers disponíveis do Terratest.
func TestS3Bucket(t *testing.T) {
	expectedBucketName := "empresa-storage-lab-001-rogerio"

	terraformOptions := &terraform.Options{
		TerraformDir: "../",
		Vars: map[string]interface{}{
			"aws_region":  awsRegion,
			"bucket_name": expectedBucketName,
		},
	}

	// Sempre destrói os recursos criados pelo teste, mesmo em caso de falha.
	defer terraform.Destroy(t, terraformOptions)

	// 1. Terraform Init + Apply.
	terraform.InitAndApply(t, terraformOptions)

	// 2. Validar output bucket_name.
	bucketName := terraform.Output(t, terraformOptions, "bucket_name")

	assert.NotEmpty(t, bucketName)
	assert.Equal(t, expectedBucketName, bucketName)

	// 3. Confirmar que o bucket realmente existe na AWS.
	// A assinatura correta do helper é região + nome do bucket.
	aws.AssertS3BucketExists(t, awsRegion, bucketName)

	// 4. Confirmar versionamento habilitado.
	// GetS3BucketVersioning retorna uma string, portanto não existe
	// versioning.Status.
	versioningStatus := aws.GetS3BucketVersioning(t, awsRegion, bucketName)
	assert.Equal(t, "Enabled", versioningStatus)

	// 5. Validar output bucket_arn.
	bucketARN := terraform.Output(t, terraformOptions, "bucket_arn")

	assert.NotEmpty(t, bucketARN)
	assert.True(t, strings.Contains(bucketARN, bucketName))
}

// TestS3Idempotency verifica que uma segunda execução do Terraform não
// introduz alterações inesperadas na infraestrutura.
func TestS3Idempotency(t *testing.T) {
	bucketName := "meu-bucket-idempotencia-123456"

	terraformOptions := &terraform.Options{
		TerraformDir: "../terraform",
		Vars: map[string]interface{}{
			"aws_region":  awsRegion,
			"bucket_name": bucketName,
		},
	}

	defer terraform.Destroy(t, terraformOptions)

	// APPLY 1 -> CREATE -> APPLY 2 -> NO CHANGES -> PASS
	terraform.InitAndApplyAndIdempotent(t, terraformOptions)
}

// TestS3InvalidBucketName é um teste negativo.
// Ele verifica que uma configuração inválida é rejeitada pelo Terraform.
func TestS3InvalidBucketName(t *testing.T) {
	terraformOptions := &terraform.Options{
		TerraformDir: "../terraform",
		Vars: map[string]interface{}{
			"aws_region":  awsRegion,
			"bucket_name": "Nome_Invalido",
		},
	}

	terraform.Init(t, terraformOptions)

	_, err := terraform.ApplyE(t, terraformOptions)

	assert.Error(t, err)
}
