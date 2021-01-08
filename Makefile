.PHONY: help

help:
	@grep -E '^[a-zA-Z1-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

up: ## Starts all the containers required run the demo
	docker-compose up -d

download-cities: ## Downloads TSV file of cities with more than 500 inhabitants and puts it in minio
	docker-compose exec minio bash -c "/opt/resources/scripts/download-cities.sh"

import-cities-from-s3: ## Imports TSV file of cities into ClickHouse
	docker-compose exec clickhouse bash -c "cat /opt/queries/import-from-s3.sql | clickhouse-client -m -n"

query-cities-per-country: ## Run simple query to confirm all data has been correctly imported
	docker-compose exec clickhouse bash -c "clickhouse-client --query=\"SELECT count(*) AS cities, country_code FROM geonames.cities GROUP BY country_code ORDER BY cities DESC LIMIT 10 FORMAT PrettyCompactMonoBlock\""

export-results-to-s3: ## Export the results of a query to an S3 bucket
	docker-compose exec clickhouse bash -c "cat /opt/queries/export-to-s3.sql | clickhouse-client -m -n"

read-exported-file: ## Read the exported file
	docker-compose exec minio bash -c "cat /data/geonames/closer_to_coordinates.csv"

down: ## Shuts down all the containers and removes their volume
	docker-compose down --volumes --remove-orphans
