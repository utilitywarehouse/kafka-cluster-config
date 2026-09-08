lint: hooks-pre-commit-run

hooks-install:
	-rm .git/hooks/pre-commit
	(cd .git/hooks/ && ln -s ../../scripts/pre-commit pre-commit)

hooks-uninstall:
	rm -f .git/hooks/pre-commit

hooks-pre-commit-run:
	@GIT_CMD="git diff --name-only --cached --diff-filter=d origin/main" \
	./scripts/pre-commit

generate:
	./scripts/generate_backup_bucket_retention.sh dev
	./scripts/generate_backup_bucket_retention.sh prod
