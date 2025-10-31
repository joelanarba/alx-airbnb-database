-- 1. INNER JOIN
-- Retrieve all bookings and the respective users who made those bookings
SELECT 
    bookings.id AS booking_id,
    users.name AS user_name,
    users.email,
    bookings.property_id,
    bookings.start_date,
    bookings.end_date,
    bookings.total_price
FROM bookings
INNER JOIN users ON bookings.user_id = users.id;

-- 2. LEFT JOIN
-- Retrieve all properties and their reviews (including properties with no reviews)
SELECT p.id AS property_id, p.name AS property_name, r.comment, r.rating
FROM Property p
LEFT JOIN Review r ON p.id = r.property_id
ORDER BY p.id;
SELECT 
    properties.id AS property_id,
    properties.title,
    properties.location,
    reviews.rating,
    reviews.comment
FROM properties
LEFT JOIN reviews ON properties.id = reviews.property_id;

-- 3. FULL OUTER JOIN
-- Retrieve all users and all bookings (even if some users have no bookings or some bookings have no user)
SELECT 
    users.id AS user_id,
    users.name,
    bookings.id AS booking_id,
    bookings.property_id,
    bookings.start_date,
    bookings.end_date
FROM users
FULL OUTER JOIN bookings ON users.id = bookings.user_id;
