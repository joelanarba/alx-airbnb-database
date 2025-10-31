
-- 1) User table optimization
-- The email column is frequently used for login and lookups.
CREATE INDEX idx_user_email ON "User"(email);

-- 2) Booking table optimization
-- The user_id and property_id columns are used in JOINs and WHERE filters.
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);

-- 3) Property table optimization
-- The location and name columns may be used for search queries.
CREATE INDEX idx_property_location ON Property(location);
CREATE INDEX idx_property_name ON Property(name);

CREATE INDEX idx_booking_date ON Booking(booking_date);
