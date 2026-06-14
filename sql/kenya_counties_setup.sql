-- Author: Magichu Njoroge
-- Description: Kenya Counties Setup Script imported from Mockaroo (1000 records)

    CREATE ROLE magichun WITH LOGIN PASSWORD 'YOUR_PASSWORD_HERE';
    ALTER ROLE magichun WITH CREATEDB;
    CREATE DATABASE magichun WITH OWNER magichun;

    \c magichun;

    CREATE SCHEMA staging;

    CREATE TABLE staging.kenya_counties (
        id INT,
        first_name VARCHAR(100)
        last_name VARCHAR(100),
        email VARCHAR(150),
        gender VARCHAR(20),
        ip_address VARCHAR(20),
        county_name VARCHAR(100),
        population INT,
        area_sq_km DECIMAL(10,2),
        population_desnity DECIMAL(10,2),
        average_age DECIMAL(5,2),
        
    );

    \copy staging.kenya_counties
    FROM '/home/magichun/kenya_counties.csv'
    DELIMITER ',' CSV HEADER;

    SELECT county_name, population_density
    FROM staging.kenya_counties
    ORDER BY population_density DESC
    LIMIT 5;