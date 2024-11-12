-- Write your SQL code here
-- Creating the table Product
CREATE TABLE product(
    productID INT(8) NOT NULL,
    productName VARCHAR(255) NOT NULL,
    productPrice DECIMAL(10, 2) NOT NULL,
    productCategory VARCHAR(255) NOT NULL,
    productQuantity INT DEFAULT 0,
    PRIMARY KEY(productID)
);

-- Creating SmokelessProduct table (subtype table to product)
CREATE TABLE smokeless_product(
    productID INT NOT NULL,
    nicotine_content DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY(productID),
    FOREIGN KEY (productID) REFERENCES product(productID)
);

-- Creating TraditionalTobaccoProduct table (subtype table to product)
CREATE TABLE traditional_tobacco_product(
    productID INT NOT NULL,
    tar_content DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY(productID),
    FOREIGN KEY (productID) REFERENCES product(productID)
);

-- Creating the storage table
CREATE TABLE storage(
    faculty_name VARCHAR(255) NOT NULL,
    productID INT NOT NULL,
    product_category VARCHAR(255) NOT NULL,
    product_quantity INT NOT NULL,
    duration INT NOT NULL,
    PRIMARY KEY(faculty_name),
    FOREIGN KEY (productID) REFERENCES product(productID)
);

-- Creating the orders table
CREATE TABLE orders(
    order_id INT NOT NULL,
    productID INT NOT NULL,
    order_date DATE NOT NULL,
    order_status VARCHAR(255) NOT NULL,
    PRIMARY KEY(order_id),
    FOREIGN KEY (productID) REFERENCES product(productID)
);

-- Creating the regulations table
CREATE TABLE regulations(
    regulation_id INT NOT NULL,
    regulation_name VARCHAR(255) NOT NULL,
    compliant_status VARCHAR(255) NOT NULL,
    PRIMARY KEY(regulation_id)
);

-- Creating a junction table for many-to-many relationship between products and regulations
CREATE TABLE product_regulation(
    productID INT NOT NULL,
    regulation_id INT NOT NULL,
    compliance_status VARCHAR(255) NOT NULL,
    last_checked_date DATE NOT NULL,
    PRIMARY KEY(productID, regulation_id),
    FOREIGN KEY (productID) REFERENCES product(productID),
    FOREIGN KEY (regulation_id) REFERENCES regulations(regulation_id)
);

-- Creating the payment table
CREATE TABLE payment(
    payment_code INT NOT NULL,
    payment_date DATE NOT NULL,
    payment_amount DECIMAL(10, 2) NOT NULL,
    order_id INT NOT NULL,
    PRIMARY KEY(payment_code)
);

-- Creating a  junction table between orders and product table
CREATE TABLE order_product(
    order_id INT NOT NULL,
    productID INT NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY(order_id, productID),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (productID) REFERENCES product(productID)
);