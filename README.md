# Demo ClickHouse S3 function to import/export data to S3 

Simple demo to show how to import/export data from/to S3 or compatible storage services.

Since we aim to have a complete self contained demo, rather than using AWS S3, or any compatible service, we will use MinIO for this demo.


## Requirements

- `docker-compose`
- `make` (if you want to use it to easily run it, otherwise you can always run the commands by hand)

## Run it

The `Makefile` is self documented. Type `make help` to get its content:

```txt
up                             Starts all the containers required run the demo
download-cities                Downloads TSV file of cities with more than 500 inhabitants and puts it in minio
import-cities-from-s3          Imports TSV file of cities into ClickHouse
query-cities-per-country       Run simple query to confirm all data has been correctly imported
export-results-to-s3           Export the results of a query to an S3 bucket
read-exported-file             Read the exported file
down                           Shuts down all the containers and removes their volume
```

Execute the commands in this order to run the demo.
