lint:
	pre-commit run

generate:
	./scripts/generate_backup_bucket_retention.sh dev
