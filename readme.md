# Coffeeshop ERD
```mermaid
---
title: Coffeeshop Entity Relation Diagram
---
    erDiagram
    users {
    INT id PK 
    VARCHAR(255) avatar
    VARCHAR(255) first_name
    VARCHAR(255) last_name
    VARCHAR(255) email
    VARCHAR(255) phone
    VARCHAR(255) address
    VARCHAR(255) password
    INT role_id FK
    INT cart_id FK
    TIMESTAMP created_at
    TIMESTAMP updated_at
    }
```