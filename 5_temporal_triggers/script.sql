-- Write your SQL code here
 --Scheduled Event: Regular Inventory Check
 
CREATE EVENT check_inventory_discrepancies  
ON SCHEDULE EVERY 1 DAY  
STARTS CURRENT_TIMESTAMP + INTERVAL 1 HOUR  
ON COMPLETION PRESERVE  
DO  
BEGIN  
    UPDATE storage AS s  
    JOIN product AS p ON s.productID = p.productID  
    SET s.product_quantity = p.productQuantity  
    WHERE s.product_quantity > p.productQuantity;  

END;
--purpose:Ensure product_quantity in the storage table is consistent with the product table.
-- Any discrepancies (e.g., storage.product_quantity exceeding product.productQuantity) will be corrected.


--Scheduled Event: Auto-Categorize Products

CREATE EVENT auto_categorize_products
ON SCHEDULE EVERY 1 WEEK
STARTS CURRENT_TIMESTAMP
ON COMPLETION PRESERVE
DO
BEGIN
    UPDATE product
    SET productCategory = 'Miscellaneous'
    WHERE productID NOT IN (SELECT productID FROM smokeless_product)
      AND productID NOT IN (SELECT productID FROM traditional_tobacco_product);
      
END ;


--Purpose: Categorize uncategorized products as Miscellaneous if they have no entries in smokeless_product or traditional_tobacco_product.

--Scheduled Event: Payment Expiry Check
DELIMITER //
CREATE EVENT delete_old_payments
ON SCHEDULE EVERY 1 MONTH
STARTS CURRENT_TIMESTAMP
ON COMPLETION PRESERVE
DO
BEGIN
    DELETE FROM payment
    WHERE payment_date < (CURRENT_DATE - INTERVAL 1 YEAR);
END //
DELIMITER ;
--Purpose Remove payments older than a specific time frame (e.g., 1 year) to maintain a clean database.

--Scheduled event:Regulation compliance check 
DELIMITER //

CREATE EVENT mark_non_compliant_products
ON SCHEDULE EVERY 1 DAY
STARTS CURRENT_TIMESTAMP
ON COMPLETION PRESERVE
DO
BEGIN
    UPDATE product_regulation
    SET compliance_status = 'Non-Compliant'
    WHERE regulation_id IN (
        SELECT regulation_id
        FROM regulations
        WHERE compliant_status != 'Compliant'
    );
END//

DELIMITER ;
--Purpose: Mark any products with non-compliant regulations for review by updating their compliance status.

--Scheduled event:low stock alert 
DELIMITER //

CREATE EVENT log_low_stock
ON SCHEDULE EVERY 1 HOUR
STARTS CURRENT_TIMESTAMP
ON COMPLETION PRESERVE
DO
BEGIN
    SELECT productID, productName, productQuantity
    FROM product
    WHERE productQuantity < 10;
END//

DELIMITER ;

--Purpose: Notify about low stock (products with productQuantity < 10).
--to show the events that have been cretaed 
SHOW EVENTS FROM british_american_tobacco;
--all events are working
