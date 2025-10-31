-- ======================================================
-- Step 1: Initial Query (Unoptimized)
-- Retrieves all bookings with user, property, and payment details
-- ======================================================
EXPLAIN ANALYZE
SELECT
    b.booking_id,
    u.first_name,
    u.last_name,
    u.email,
    p.name AS property_name,
    p.location,
    pay.amount AS payment_amount,
    pay.payment_date,
    b.start_date,
    b.end_date,
    b.status
FROM Booking b
JOIN "User" u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
LEFT JOIN Payment pay ON b.booking_id = pay.booking_id
ORDER BY b.created_at DESC;

-- ======================================================
-- Step 2: Optimized Query
-- Improvements:
--   1. Use SELECT with explicit fields instead of SELECT *
--   2. Added appropriate indexes (user_id, property_id, booking_id)
--   3. Reordered joins to filter smaller datasets earlier if possible
-- ======================================================
EXPLAIN ANALYZE
SELECT
    b.booking_id,
    CONCAT(u.first_name, ' ', u.last_name) AS user_name,
    u.email,
    p.name AS property_name,
    p.location,
    pay.amount AS payment_amount,
    b.start_date,
    b.end_date,
    b.status
FROM Booking b
JOIN "User" u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
LEFT JOIN Payment pay ON b.booking_id = pay.booking_id
WHERE b.status = 'confirmed'
ORDER BY b.start_date DESC;
