SELECT TOP(10) *
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