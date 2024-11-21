-- Write your SQL code here
CREATE VIEW bat_product_regulation AS
SELECT 
    p.productID,
    p.product_name,
    r.regulation_name,
    pr.compliance_status,
    pr.last_checked_date
FROM 
    product_regulation pr
JOIN 
    product p ON pr.productID = p.productID
JOIN 
    regulations r ON pr.regulation_id = r.regulation_id
WHERE 
    p.company_name = 'British American Tobacco';

-- View to get products and their last compliance check status for British American Tobacco
CREATE VIEW bat_product_compliance_status AS
SELECT 
    p.productID,
    p.product_name,
    pr.compliance_status,
    pr.last_checked_date
FROM 
    product_regulation pr
JOIN 
    product p ON pr.productID = p.productID
WHERE 
    p.company_name = 'British American Tobacco';

-- View to get all regulation details for British American Tobacco's products
CREATE VIEW bat_regulations_for_products AS
SELECT 
    r.regulation_name,
    r.description,
    COUNT(pr.productID) AS product_count
FROM 
    product_regulation pr
JOIN 
    regulations r ON pr.regulation_id = r.regulation_id
JOIN 
    product p ON pr.productID = p.productID
WHERE 
    p.company_name = 'British American Tobacco'
GROUP BY 
    r.regulation_name, r.description;