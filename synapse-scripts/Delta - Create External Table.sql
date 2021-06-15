CREATE EXTERNAL TABLE DeltaTest (
    id INT,
    a INT,
    b VARCHAR(6),
    c FLOAT
) 
WITH (
    LOCATION = 'delta_test',
    DATA_SOURCE = DeltaLakeDataSource,
    FILE_FORMAT = DeltaLakeFileFormat
);