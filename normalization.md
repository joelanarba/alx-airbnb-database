# Airbnb Database Normalization

## Objective
This document explains how the Airbnb database design satisfies normalization rules up to the Third Normal Form (3NF). The goal of normalization is to reduce redundancy, ensure data integrity, and improve database efficiency.

---

## 1. First Normal Form (1NF)
- Each table has a primary key.
- All attributes contain atomic (indivisible) values.
- There are no repeating groups or multi-valued columns.

All tables (User, Property, Booking, Payment, Review, Message) meet this requirement.

---

## 2. Second Normal Form (2NF)
- The database is already in 1NF.
- Every non-key attribute is fully dependent on the entire primary key.
- No partial dependency exists since all tables use single-column primary keys.

All tables meet this condition.

---

## 3. Third Normal Form (3NF)
- The database is already in 2NF.
- There are no transitive dependencies.
- Every non-key attribute depends only on the primary key.

Each table's attributes depend solely on its primary key.

---

## Example Normalization Process

### Booking Table

1. **Unnormalized form (UNF):**
   Booking table might have looked like this before normalization:
```
   booking_id | property_name | user_email | start_date | end_date | total_price
```
   
   Problem: property_name and user_email repeat data from other tables.

2. **After applying 1NF–3NF:**
   - Split data into:
     - `Booking(booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at)`
     - `Property(property_id, name, ...)`
     - `User(user_id, email, ...)`
   - Use foreign keys for relationships.
   
   Result: No redundancy, data integrity preserved.

---

## 4. Conclusion
The final Airbnb database design is fully normalized up to **Third Normal Form (3NF)**.  
All redundancies have been removed, and data integrity is maintained through primary and foreign key relationships.