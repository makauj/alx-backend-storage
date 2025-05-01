-- MySQL script that creates a table "users"

CREATE TABLE IF NOT EXISTS users (
    id INT NOT NULL AUTOINCREMENT PRIMARY KEY,
    email STRING(255) NOT NULL UNIQUE,
    name STRING(255),
    country ENUM('US', 'CO', 'TN') NOT NULL DEFAULT 'US'
);
