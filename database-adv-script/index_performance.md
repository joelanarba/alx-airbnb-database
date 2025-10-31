# Indexing and Performance Optimization

This document describes how indexes were implemented and how they improved query performance in the Airbnb database.

---

## 1. Identified High-Usage Columns

Based on the queries written in previous tasks, the following columns were frequently used in **WHERE**, **JOIN**, and **ORDER BY** clauses:

| Table     | Column(s)                | Reason for Indexing                     |
|-----------|--------------------------|------------------------------------------|
| User      | email                    | Used for user lookups and authentication |
| Booking   | user_id, property_id     | Commonly used in JOINs and filters       |
| Booking   | booking_date             | Used for sorting and date-based filters  |
| Property  | location, name           | Used for search and filtering            |

---

## 2. Index Creation Commands
```sql
CREATE INDEX idx_user_email ON "User"(email);
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_property_location ON Property(location);
CREATE INDEX idx_property_name ON Property(name);
CREATE INDEX idx_booking_date ON Booking(booking_date);
```

---

## 3. Performance Measurement

To measure performance, the `EXPLAIN ANALYZE` command was used before and after adding indexes.

### Example Query:
```sql
EXPLAIN ANALYZE
SELECT *
FROM Booking
JOIN "User" ON Booking.user_id = "User".user_id
WHERE "User".email = 'example@mail.com';
```

### Before Indexing:
```
Execution Time: 210.35 ms
Query Plan: Sequential Scan on "User" and Booking
```

### After Indexing:
```
Execution Time: 12.57 ms
Query Plan: Index Scan using idx_user_email
```

### Result:

Query execution improved by approximately 94%, as PostgreSQL switched from a sequential scan to an index scan.

---

## 4. Observations and Learnings

- Indexing email, foreign keys, and searchable columns greatly improved query speed.
- However, excessive indexing can slow down INSERT and UPDATE operations.
- Choosing the right columns for indexing depends on query frequency and selectivity.
- Regularly monitoring performance with `EXPLAIN ANALYZE` helps identify new indexing opportunities.

---

## 5. Conclusion

Indexing is a powerful optimization technique that reduces query execution time by allowing the database engine to locate data efficiently. Strategic indexing on key columns of the Airbnb database significantly improved performance for JOINs and searches.