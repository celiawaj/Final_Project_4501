DROP TABLE IF EXISTS zipcodes, complaints, trees, rents;
CREATE TABLE zipcodes
(
    zipcode TEXT PRIMARY KEY,
    county TEXT,
    geometry GEOMETRY(Polygon, 4326)
);
CREATE INDEX zipcodes_geom_idx ON zipcodes USING GIST (geometry);

CREATE TABLE complaints
(
    id INTEGER PRIMARY KEY,
    zipcode TEXT,
    date TIMESTAMP,
    complaint_type TEXT,
    geometry GEOMETRY(Polygon, 4326)
);
CREATE INDEX complaints_geom_idx ON complaints USING GIST (geometry);

CREATE TABLE trees
(
    id INTEGER PRIMARY KEY,
    zipcode TEXT,
    species TEXT,
    health TEXT,
    status TEXT,
    geometry GEOMETRY(Polygon, 4326)
);
CREATE INDEX trees_geom_idx ON trees USING GIST (geometry);

CREATE TABLE rents
(
    id INTEGER PRIMARY KEY,
    zipcode TEXT,
    aug_rent FLOAT,
    sep_rent FLOAT
);
