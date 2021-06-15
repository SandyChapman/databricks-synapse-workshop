SELECT TOP(10) *
FROM OPENROWSET(
    BULK 'delta_test_partitioned_stream',
    DATA_SOURCE = 'DeltaLakeDataSource',
    FORMAT = 'DELTA'
) 
WITH (
    timestamp VARCHAR(100),
    value INT,
    partition INT
)
AS rows
ORDER BY timestamp DESC