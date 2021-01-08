-- Truncate the table so you can rexecute this file as many times as you want
TRUNCATE geonames.cities;

-- Import the data from S3
INSERT INTO geonames.cities
SELECT
    *
FROM
    s3(
        'http://minio:9000/geonames/cities500.tsv',
        'user',
        'changeme',
        'TabSeparated',
        'geonameid UInt32, name String, asciiname String, alternatenames String, latitude Float32, longitude Float32, feature_class FixedString(1), feature_code LowCardinality(String), country_code FixedString(2), cc2 String, admin1_code String, admin2_code String, admin3_code String, admin4_code String, population Int64, elevation Int32, dem String, timezone String, modification_date Date',
        'none'
    );