# Advanced SQL — Airbnb Database

This directory contains SQL scripts demonstrating advanced querying techniques for the Airbnb database.  
It includes joins, subqueries, and more — each illustrating how data can be efficiently retrieved and analyzed across related tables.

---

## Task 0: Complex Joins

**File:** `joins_queries.sql`

### Objective
Use SQL joins to retrieve and combine related data from multiple tables.

### Joins Implemented

1. **INNER JOIN**  
   Retrieves bookings with the corresponding users who made them.
```sql
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
```

2. **LEFT JOIN**  
   Retrieves all properties and their reviews, including properties without reviews.
```sql
   SELECT 
       properties.id AS property_id,
       properties.title,
       properties.location,
       reviews.rating,
       reviews.comment
   FROM properties
   LEFT JOIN reviews ON properties.id = reviews.property_id;
```

3. **FULL OUTER JOIN (MySQL simulated using UNION)**  
   Retrieves all users and all bookings, even if there's no link between them.
```sql
   SELECT 
       users.id AS user_id,
       users.name,
       bookings.id AS booking_id,
       bookings.start_date
   FROM users
   LEFT JOIN bookings ON users.id = bookings.user_id
   UNION
   SELECT 
       users.id AS user_id,
       users.name,
       bookings.id AS booking_id,
       bookings.start_date
   FROM users
   RIGHT JOIN bookings ON users.id = bookings.user_id;
```

---

## Task 1: Subqueries

**File:** `subqueries.sql`

### Objective
Practice using both correlated and non-correlated subqueries for complex data analysis.

### 1. Non-Correlated Subquery
Find properties with an average rating greater than 4.0.
```sql
SELECT 
    id AS property_id,
    title,
    location
FROM properties
WHERE id IN (
    SELECT property_id
    FROM reviews
    GROUP BY property_id
    HAVING AVG(rating) > 4.0
);
```

**Explanation:**  
The inner query independently finds properties whose average rating exceeds 4.0, and the outer query retrieves their details.

### 2. Correlated Subquery
Find users who have made more than 3 bookings.
```sql
SELECT 
    u.id AS user_id,
    u.name,
    u.email
FROM users u
WHERE (
    SELECT COUNT(*)
    FROM bookings b
    WHERE b.user_id = u.id
) > 3;
```

**Explanation:**  
The inner query references the outer query's current user (u.id) to count bookings per user. Only users with more than three bookings are returned.

---

## How to Run

Make sure your database schema and sample data are already set up, then run:
```bash
mysql -u root -p airbnb_db < joins_queries.sql
mysql -u root -p airbnb_db < subqueries.sql
```

---

## Directory Structure
```
alx-airbnb-database/
└── database-adv-script/
    ├── joins_queries.sql
    ├── subqueries.sql
    └── README.md
```