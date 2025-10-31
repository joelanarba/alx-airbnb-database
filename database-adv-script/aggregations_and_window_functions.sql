
-- 1) Total bookings by user (COUNT + GROUP BY)
SELECT
    u.user_id,
    u.first_name || ' ' || u.last_name AS user_name,
    COUNT(b.booking_id) AS total_bookings
FROM "User" u
LEFT JOIN Booking b ON u.user_id = b.user_id
GROUP BY u.user_id, u.first_name, u.last_name
ORDER BY total_bookings DESC;

-- 2) Rank properties by total bookings using RANK()
-- We aggregate first, then apply the window function over the aggregated results.
SELECT
    property_id,
    property_name,
    total_bookings,
    RANK() OVER (ORDER BY total_bookings DESC) AS booking_rank
FROM (
    SELECT
        p.property_id,
        p.name AS property_name,
        COUNT(b.booking_id) AS total_bookings
    FROM Property p
    LEFT JOIN Booking b ON p.property_id = b.property_id
    GROUP BY p.property_id, p.name
) AS prop_stats
ORDER BY booking_rank, property_id;

-- 3) Rank properties by total bookings using ROW_NUMBER()
-- Similar approach but using ROW_NUMBER() to give a unique position to each row.
SELECT
    property_id,
    property_name,
    total_bookings,
    ROW_NUMBER() OVER (ORDER BY total_bookings DESC) AS booking_row_number
FROM (
    SELECT
        p.property_id,
        p.name AS property_name,
        COUNT(b.booking_id) AS total_bookings
    FROM Property p
    LEFT JOIN Booking b ON p.property_id = b.property_id
    GROUP BY p.property_id, p.name
) AS prop_stats
ORDER BY booking_row_number;
