-- This will extract the result of a query as a CSV and upload it to S3

INSERT INTO FUNCTION s3(
    'http://minio:9000/geonames/closer_to_coordinates.csv', 
    'user', 
    'changeme', 
    'CSVWithNames', 
    'geonameid UInt32, name String, country_code LowCardinality(String), distance Float32', 'none')
WITH 
    55.652743 AS current_latitude,
    12.085123 AS current_longitude
SELECT 
    geonameid,
    name,
    country_code,
    greatCircleDistance(current_longitude, current_latitude, longitude, latitude) AS distance
FROM geonames.cities
ORDER BY distance ASC
LIMIT 10;