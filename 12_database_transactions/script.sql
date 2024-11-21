-- Write your SQL code here
-- The regulation_compliance database transaction
DELIMITER $$  

CREATE PROCEDURE manageComplianceTransaction(  
    IN p_regulation_id INT,  
    IN p_productID INT,  
    IN p_last_checked_date DATE,  
    IN p_compliance_status VARCHAR(20)  
)  
BEGIN  
    -- Declare an error handler for any SQL exceptions  
    DECLARE EXIT HANDLER FOR SQLEXCEPTION  
    BEGIN  
        -- We can customize the rollback behavior or logging here  
        ROLLBACK;  
        SELECT 'Error: An exception occurred during the transaction.' AS error_message;  
    END;    

    -- Start the transaction  
    START TRANSACTION;  

    -- Check if the regulation_id exists  
    IF EXISTS (SELECT 1 FROM regulations WHERE regulation_id = p_regulation_id) THEN  
        
        -- Check if the productID exists  
        IF EXISTS (SELECT 1 FROM product WHERE productID = p_productID) THEN  
            
            -- Call the procedure to update compliance information  
            CALL updateCompliance(p_regulation_id, p_productID, p_last_checked_date, p_compliance_status);  
            
            -- Commit the transaction if everything is successful  
            COMMIT;  
            SELECT 'Compliance record updated successfully.' AS message;  
          
        ELSE  
            -- If productID does not exist  
            ROLLBACK;  
            SELECT 'Error: Product not found.' AS error_message;  
        END IF;  

    ELSE  
        -- If regulation_id does not exist  
        ROLLBACK;  
        SELECT 'Error: Regulation not found.' AS error_message;  
    END IF;  

END$$  

DELIMITER ;
-- reference procedure from stored_routines_as_procedures
DELIMITER $$  

CREATE PROCEDURE updateCompliance(  
    IN p_regulation_id INT,  
    IN p_productID INT,  
    IN p_last_checked_date DATE,  
    IN p_compliance_status VARCHAR(20)  
)  
BEGIN  
    -- Declare an error handler for any SQL exceptions  
    DECLARE EXIT HANDLER FOR SQLEXCEPTION  
    BEGIN  
        -- Rollback in case of any error  
        SELECT 'Error: An exception occurred.' AS error_message;  
    END;  

    -- Insert or update compliance information in product_regulation  
    INSERT INTO product_regulation (productID, regulation_id, compliance_status, last_checked_date)  
    VALUES (p_productID, p_regulation_id, p_compliance_status, p_last_checked_date)  
    ON DUPLICATE KEY UPDATE  
        compliance_status = VALUES(compliance_status),  
        last_checked_date = VALUES(last_checked_date);  

    -- If the compliance status is non-compliant  
    IF p_compliance_status = 'non-compliant' THEN  
        -- Notify compliance officer  
        CALL notifyComplianceOfficer(p_productID);  
    ELSE  
        -- Update the product status to compliant  
        UPDATE product_table  
        SET status = 'compliant'  
        WHERE productID = p_productID;  
    END IF;  
END$$  

DELIMITER ;

