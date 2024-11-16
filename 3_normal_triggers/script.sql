-- Write your SQL code here

--trigger for product  table 
DELIMITER //

CREATE TRIGGER TRG_BEFORE_INSERT_ON_product
BEFORE INSERT ON product
FOR EACH ROW
BEGIN
    IF NEW.productQuantity < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Product quantity cannot be negative.';
    END IF;
END//

DELIMITER ;

-- testing the trigger
INSERT INTO product (productID, productName, productPrice, productCategory, productQuantity)
VALUES (1, 'Cigarette Pack', 10.50, 'Traditional', -5);
--this returns an error message because of trigger validation,Hence the trigger is working


--trigger for smokeless product 
SELECT * FROM `smokeless_product` WHERE 1
DELIMITER //

CREATE TRIGGER TRG_AFTER_INSERT_ON_smokeless_product
AFTER INSERT ON smokeless_product
FOR EACH ROW
BEGIN
    UPDATE product
    SET productCategory = 'Smokeless'
    WHERE productID = NEW.productID;
END//

DELIMITER ;

--trigger for traditional tobacco product 
DELIMITER //

CREATE TRIGGER TRG_AFTER_INSERT_ON_traditional_tobacco_product
AFTER INSERT ON traditional_tobacco_product
FOR EACH ROW
BEGIN
    UPDATE product
    SET productCategory = 'Traditional Tobacco'
    WHERE productID = NEW.productID;
END//

DELIMITER ;
--trigger for orders 
DELIMITER //

CREATE TRIGGER TRG_BEFORE_INSERT_ON_orders
BEFORE INSERT ON orders
FOR EACH ROW
BEGIN
    IF NEW.order_status NOT IN ('Pending', 'Completed', 'Cancelled') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid order status.';
    END IF;
END//

DELIMITER ;
--trigger for storage 
DELIMITER //

CREATE TRIGGER TRG_BEFORE_UPDATE_ON_storage
BEFORE UPDATE ON storage
FOR EACH ROW
BEGIN
    IF NEW.product_quantity < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Product quantity in storage cannot be negative.';
    END IF;
END//

DELIMITER ;
--trigger for product regulation
DELIMITER //

CREATE TRIGGER TRG_AFTER_INSERT_ON_product_regulation
AFTER INSERT ON product_regulation
FOR EACH ROW
BEGIN
    INSERT INTO regulations_log (productID, regulation_id, compliance_status, checked_at)
    VALUES (NEW.productID, NEW.regulation_id, NEW.compliance_status, NOW());
END//

DELIMITER ;

--all this triggers are present after running this query 
SHOW TRIGGERS;
--it shows the list of the triggers in the 6 tables requiring them 
