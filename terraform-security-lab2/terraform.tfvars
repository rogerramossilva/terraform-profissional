############################################
# AMBIENTE
############################################

environment = "dev"

############################################
# BUCKET PRINCIPAL DE DADOS
############################################

bucket_name = "empresa-dados-lab-123456789012"

############################################
# BUCKET DE LOGS
############################################

log_bucket_name = "empresa-logs-lab-123456789012"

############################################
# ROLE IAM PARA REPLICAÇÃO
############################################

replication_role_arn = "arn:aws:iam::123456789012:role/s3-replication-role"

############################################
# BUCKET DE DESTINO DA REPLICAÇÃO
############################################

destination_bucket_arn = "arn:aws:s3:::empresa-dados-replica-123456789012"
