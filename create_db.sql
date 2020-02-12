DROP DATABASE IF EXISTS kulina;
CREATE DATABASE IF NOT EXISTS kulina;
USE kulina;

DROP TABLE IF EXISTS ku_user_status;
CREATE TABLE ku_user_status(
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    name VARCHAR(10) NOT NULL,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL
) AUTO_INCREMENT = 1;

DROP TABLE IF EXISTS ku_user;
CREATE TABLE ku_user(
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    user_name VARCHAR(20),
    email VARCHAR(30) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    password_hash VARCHAR(50) NOT NULL,
    salt VARCHAR(50) NOT NULL,
    photo LONGBLOB NOT NULL,
    status INT,
    FOREIGN KEY(status) REFERENCES ku_user_status(id),
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL
) AUTO_INCREMENT = 1;

DROP TABLE IF EXISTS ku_user_location_type;
CREATE TABLE ku_user_location_type(
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    name VARCHAR(10) NOT NULL,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL
) AUTO_INCREMENT = 1;

DROP TABLE IF EXISTS ku_user_location_status;
CREATE TABLE ku_user_location_status(
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    name VARCHAR(10) NOT NULL,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL
) AUTO_INCREMENT = 1;

DROP TABLE IF EXISTS ku_user_location;
CREATE TABLE ku_user_location(
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    type INT,
    FOREIGN KEY (type) REFERENCES ku_user_location_type(id),
    status INT,
    FOREIGN KEY(status) REFERENCES ku_user_location_status(id),
    user_id INT,
    FOREIGN KEY(user_id) REFERENCES ku_user(id),
    location POINT NOT NULL,
    address VARCHAR(100),
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL
) AUTO_INCREMENT = 1;

DROP TABLE IF EXISTS ku_order_status;
CREATE TABLE ku_order_status(
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL
) AUTO_INCREMENT = 1;

DROP TABLE IF EXISTS ku_order;
CREATE TABLE ku_order(
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES ku_user(id),
    status INT,
    FOREIGN KEY (status) REFERENCES ku_order_status(id),
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL
) AUTO_INCREMENT = 1;

DROP TABLE IF EXISTS ku_product_status;
CREATE TABLE ku_product_status(
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    name VARCHAR(10) NOT NULL,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL
) AUTO_INCREMENT = 1;

DROP TABLE IF EXISTS ku_product;
CREATE TABLE ku_product(
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    name VARCHAR(80) NOT NULL,
    effective_date DATE NOT NULL,    
    effective_until DATE NOT NULL,
    photo LONGBLOB NOT NULL,
    price DECIMAL(10,1) NOT NULL,
    status INT,
    FOREIGN KEY (status) REFERENCES ku_product_status(id),
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL
) AUTO_INCREMENT = 1;

DROP TABLE IF EXISTS ku_category;
CREATE TABLE ku_category(
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL
) AUTO_INCREMENT = 1;

DROP TABLE IF EXISTS ku_order_detail_status;
CREATE TABLE ku_order_detail_status(
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    name VARCHAR(10) NOT NULL,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL
) AUTO_INCREMENT = 1;

DROP TABLE IF EXISTS ku_product_category;
CREATE TABLE ku_product_category(
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    product_id INT,
    FOREIGN KEY(product_id) REFERENCES ku_product(id),
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES ku_category(id),
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL
) AUTO_INCREMENT = 1;

DROP TABLE IF EXISTS ku_order_detail;
CREATE TABLE ku_order_detail(
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    user_location_id INT,
    FOREIGN KEY (user_location_id) REFERENCES ku_user_location(id),
    order_id INT,
    FOREIGN KEY (order_id) REFERENCES ku_order(id),
    product_id INT,
    FOREIGN KEY(product_id) REFERENCES ku_product(id), 
    quantity INT NOT NULL,
    delivery_date DATE NOT NULL,
    status INT,
    FOREIGN KEY (status) REFERENCES ku_order_detail_status(id),
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL
) AUTO_INCREMENT = 1;