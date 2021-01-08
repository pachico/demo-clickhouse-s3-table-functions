CREATE DATABASE IF NOT EXISTS geonames;

use geonames;

CREATE TABLE IF NOT EXISTS cities (
    geonameid UInt32,
    name String,
    asciiname String,
    alternatenames String,
    latitude Float32,
    longitude Float32,
    feature_class FixedString(1),
    feature_code LowCardinality(String),
    country_code FixedString(2),
    cc2 String,
    admin1_code String,
    admin2_code String,
    admin3_code String,
    admin4_code String,
    population Int64,
    elevation Int32,
    dem String,
    timezone String,
    modification_date Date
) ENGINE = Memory();
