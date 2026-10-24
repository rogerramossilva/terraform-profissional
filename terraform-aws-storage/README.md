# Terraform AWS Storage Module

## Descrição

Módulo Terraform responsável por criar e gerenciar buckets Amazon S3 seguindo boas práticas de governança, versionamento e reutilização.


Este módulo permite padronizar a criação de buckets AWS utilizando Infrastructure as Code.

---

## Requirements

| Nome | Versão |
|---|---|
| Terraform | >= 1.5.0 |
| AWS Provider | ~> 5.0 |

---

## Providers

| Provider | Versão |
|---|---|
| hashicorp/aws | ~> 5.0 |

---

## Inputs

| Nome | Tipo | Obrigatório | Descrição |
|---|---|---|---|
| bucket_name | string | Sim | Nome do bucket S3 |
| region | string | Não | Região AWS (padrão: us-east-1) |

---

## Outputs

| Nome | Descrição |
|---|---|
| bucket_id | ID do bucket criado |
| bucket_arn | ARN do bucket criado |

---

## Example

```hcl
module "storage" {

  source = "git::https://github.com/empresa/terraform-aws-storage.git?ref=v1.0.0"

  bucket_name = "empresa-storage"

  region = "us-east-1"

}
```

---

## Version

Versão atual:

**v1.0.0**

---

## License

Este projeto utiliza licença MIT.

---

## Support

Responsável:

Equipe Cloud Platform

Contato:

cloud@empresa.com
