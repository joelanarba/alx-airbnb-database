
-- Index creation for Airbnb Database to optimize performance

-- 1) User table optimization
CREATE INDEX idx_user_email ON "User"(email);

-- 2) Booking table optimization
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);

-- 3) Property table optimization
CREATE INDEX idx_property_location ON Property(location);
CREATE INDEX idx_property_name ON Property(name);

-- 4) Optional index for booking date
CREATE INDEX idx_booking_date ON Booking(booking_date);



-- Example 1: Check booking-user join performance
EXPLAIN ANALYZE
SELECT *
FROM Booking
JOIN "User" ON Booking.user_id = "User".user_id
WHERE "User".email = 'example@mail.com';

-- Example 2: Check property search by location
EXPLAIN ANALYZE
SELECT *
FROM Property
WHERE location = 'Accra';

-- Example 3: Check booking history filtered by date
EXPLAIN ANALYZE
SELECT *
FROM Booking
WHERE booking_date BETWEEN '2025-01-01' AND '2025-12-31';
