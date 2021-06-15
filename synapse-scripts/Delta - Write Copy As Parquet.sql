CREATE EXTERNAL FILE FORMAT [ParquetFileFormat] WITH 
(
    FORMAT_TYPE = PARQUET,
    DATA_COMPRESSION = 'org.apache.hadoop.io.compress.SnappyCodec'
)

CREATE EXTERNAL TABLE ParquetTest WITH (
    LOCATION = 'parquet_test',
    DATA_SOURCE = DeltaLakeDataSource,
    FILE_FORMAT = ParquetFileFormat
) 
AS
SELECT *
FROM OPENROWSET(
    BULK 'delta_test',
    DATA_SOURCE = 'DeltaLakeDataSource',
    FORMAT = 'DELTA'
) 
WITH (
    id INT,
    d INT,
    b VARCHAR(6),
    c FLOAT
) 
AS rows