-- Create a new partitioned table based on start_date
CREATE TABLE booking_partitioned (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_amount DECIMAL(10,2),
    payment_status VARCHAR(50)
)
PARTITION BY RANGE (YEAR(start_date)) (
    PARTITION p2023 VALUES LESS THAN (2024),
    PARTITION p2024 VALUES LESS THAN (2025),
    PARTITION p2025 VALUES LESS THAN (2026),
    PARTITION pmax VALUES LESS THAN MAXVALUE
);

-- Check query performance before and after partitioning
EXPLAIN ANALYZE
SELECT *
FROM booking_partitioned
WHERE start_date BETWEEN '2024-05-01' AND '2024-05-31';
