-- Users
INSERT INTO users (id, name, email, password, created_at)
VALUES
(1, 'Joel Maybach', 'joel@example.com', 'hashed_password1', NOW()),
(2, 'Stephanie K.', 'steph@example.com', 'hashed_password2', NOW()),
(3, 'Adam Nassif', 'adam@example.com', 'hashed_password3', NOW());

-- Properties
INSERT INTO properties (id, owner_id, title, description, price_per_night, location, created_at)
VALUES
(1, 1, 'Seaside Apartment', 'Cozy apartment by the beach', 80.00, 'Cape Coast', NOW()),
(2, 2, 'City Studio', 'Modern studio in downtown Kumasi', 60.00, 'Kumasi', NOW()),
(3, 1, 'Mountain Cabin', 'Peaceful cabin with a great view', 100.00, 'Aburi', NOW());

-- Bookings
INSERT INTO bookings (id, user_id, property_id, start_date, end_date, total_price, status)
VALUES
(1, 3, 1, '2025-11-10', '2025-11-13', 240.00, 'confirmed'),
(2, 2, 3, '2025-12-01', '2025-12-05', 400.00, 'pending');

-- Payments
INSERT INTO payments (id, booking_id, amount, payment_date, status)
VALUES
(1, 1, 240.00, NOW(), 'completed'),
(2, 2, 400.00, NOW(), 'pending');
