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

    roles{
        INT id 
        VARCHAR(255) role_name
        TIMESTAMP created_at
        TIMESTAMP updated_at
    }

    testimonies {
        INT id
        VARCHAR(255) name
        VARCHAR(255) proffesion
        VARCHAR(255) picture
        VARCHAR(255) review
        INT rating
        TIMESTAMP created_at
        TIMESTAMP updated_at
    }
```