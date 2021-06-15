CREATE EXTERNAL FILE FORMAT [ParquetFileFormat] WITH 
(
    FORMAT_TYPE = PARQUET,
    DATA_COMPRESSION = 'org.apache.hadoop.io.compress.SnappyCodec'
)
GO

-- DROP EXTERNAL FILE FORMAT [ParquetFileFormat]
-- GO

-- DROP EXTERNAL TABLE ParquetTest
-- GO

CREATE EXTERNAL TABLE ParquetTest WITH (
    LOCATION = 'parquet_test',
    DATA_SOURCE = DeltaLakeDataSource,
    FILE_FORMAT = ParquetFileFormat
) 
AS
SELECT id, a as d, b as e, c as f
FROM OPENROWSET(
    BULK 'delta_test',
    DATA_SOURCE = 'DeltaLakeDataSource',
    FORMAT = 'DELTA'
) 
WITH (
    id INT,
    a INT,
    b VARCHAR(6),
    c FLOAT
) 
AS rows