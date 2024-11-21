-- Write your SQL code here
DELIMITER

/

/

CREATE PROCEDURE SP_INSERT_PRODUCT(
    IN P_PRODUCTID INT,
    IN P_PRODUCTNAME VARCHAR(255),
    IN P_PRODUCTPRICE DECIMAL(10, 2),
    IN P_PRODUCTCATEGORY VARCHAR(255),
    IN P_PRODUCTQUANTITY INT
)
BEGIN
    INSERT INTO PRODUCT(
        PRODUCTID,
        PRODUCTNAME,
        PRODUCTPRICE,
        PRODUCTCATEGORY,
        PRODUCTQUANTITY
    ) VALUES (
        P_PRODUCTID,
        P_PRODUCTNAME,
        P_PRODUCTPRICE,
        P_PRODUCTCATEGORY,
        P_PRODUCTQUANTITY
    );
END // DELIMITER;
 

-- testing the stored PROCEDURE
CALL SP_INSERT_PRODUCT(301, 'Marlaboro', 250, 'Cigarette', 500 );
 
-- Table Storage insertion.
DELIMITER // CREATE PROCEDURE SP_INSERT_STORAGE( IN P_STORAGEID INT, IN P_STORAGELOCATION VARCHAR(255), IN P_STORAGECAPACITY INT );
BEGIN
    INSERT INTO STORAGE(
        STORAGEID,
        STORAGELOCATION,
        STORAGECAPACITY
    ) VALUES (
        P_STORAGEID,
        P_STORAGELOCATION,
        P_STORAGECAPACITY
    );
END /
/

DELIMITER;

-- testing the stored PROCEDURE
CALL SP_INSERT_STORAGE(101, 'Warehouse', 10000 );

-- Table orders insertion,

DELIMITER

/

/

CREATE PROCEDURE SP_INSERT_ORDERS(
    IN P_ORDERID INT,
    IN P_PRODUCTID INT,
    IN P_ORDERDATE DATE,
    IN P_ORDERSTATUS VARCHAR(255)
)
BEGIN
    INSERT INTO ORDERS(
        ORDERID,
        PRODUCTID,
        ORDERDATE,
        ORDERSTATUS
    ) VALUES (
        P_ORDERID,
        P_PRODUCTID,
        P_ORDERDATE,
        P_ORDERSTATUS
    );
END /
/

DELIMITER;

-- testing the stored PROCEDURE

CALL SP_INSERT_ORDERS(101, 301, '2021-10-10', 'Pending' );

CREATE PROCEDURE UPDATEPRODUCTQUANTITY(
    IN P_PRODUCTID INT,
    IN P_QUANTITY INT
)
BEGIN
    UPDATE PRODUCT
    SET
        PRODUCTQUANTITY = PRODUCTQUANTITY + P_QUANTITY
    WHERE
        PRODUCTID = P_PRODUCTID;
END // DELIMITER;
 

-- testing the stored PROCEDURE
CALL UPDATEPRODUCTQUANTITY(301, 100 );

-- table product_regulation procedure
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