# Complex SQL Joins — Airbnb Database

This project demonstrates the use of SQL joins to retrieve data across multiple related tables in the Airbnb schema.

### Types of Joins Implemented

1. **INNER JOIN**
   - Retrieves bookings along with the user who made each booking.

2. **LEFT JOIN**
   - Retrieves all properties and their reviews, including properties that have no reviews.

3. **FULL OUTER JOIN**
   - Retrieves all users and bookings, even when a user has not made a booking or a booking is missing a user reference.

### Usage

To run the script:
```bash
mysql -u root -p airbnb_db < joins_queries.sql
