
CREATE TABLE zipcodes
(
    zipcode TEXT PRIMARY KEY,
    county TEXT,
    geometry GEOMETRY(Point)
)

CREATE TABLE nyc_311
(
    id INTEGER PRIMARY KEY,
    zipcode TEXT,
    date TIMESTAMP,
    complaint_type TEXT,
    geometry GEOMETRY(Point)
)

CREATE TABLE nyc_tree
(
    id INTEGER PRIMARY KEY,
    zipcode TEXT,
    species TEXT,
    health TEXT,
    status TEXT,
    geometry GEOMETRY(Point)
)

CREATE TABLE zillow
(
    id INTEGER PRIMARY KEY,
    zipcode TEXT,
    aug_rent FLOAT,
    sep_rent FLOAT
)
