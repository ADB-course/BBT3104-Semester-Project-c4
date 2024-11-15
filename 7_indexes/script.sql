-- Write your SQL code here

-- Creating indexes for the product table 
CREATE INDEX IDX_product_id ON product(productID);
CREATE INDEX IDX_product_name ON product(productName);
CREATE INDEX IDX_product_category ON product (productCategory);

-- Creating indexes for the storage table
CREATE INDEX IDX_storage_category ON storage (product_category);
CREATE INDEX IDX_storage_quantity ON storage (product_quantity);
CREATE INDEX IDX_storage_facilityLocation ON storage (facilityLocation);
CREATE INDEX IDX_storage_facility_name ON storage (facility_name);
CREATE INDEX IDX_storage_productID ON storage (productID);

-- Creating indexes for the orders table
CREATE INDEX IDX_orders_productID ON orders (productID);
CREATE INDEX IDX_orders_order_date ON orders (order_date);
CREATE INDEX IDX_orders_order_status ON orders (order_status);

-- Creating indexes for the regulations table
CREATE INDEX IDX_regulations_id ON regulations (regulation_id);
CREATE INDEX IDX_regulations_name ON regulations (regulation_name);

-- Creating indexes for the product_regulation table
CREATE INDEX IDX_product_regulation_productID ON product_regulation (productID);
CREATE INDEX IDX_product_regulation_regulation_id ON product_regulation (regulation_id);

-- Creating indexes for the payment table
CREATE INDEX IDX_payment_order_id ON payment (order_id);
CREATE INDEX IDX_payment_payment_date ON payment (payment_date);
CREATE INDEX IDX_payment_payment_amount ON payment (payment_amount);

-- Creating indexes for the order_product table
CREATE INDEX IDX_order_product_order_id ON order_product (order_id);
CREATE INDEX IDX_order_product_productID ON order_product (productID);
