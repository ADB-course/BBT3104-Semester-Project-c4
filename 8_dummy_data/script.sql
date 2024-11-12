-- Write your SQL code here

-- Table Product insertion.
INSERT INTO `product`(`productID`, `productName`, `productPrice`, `productCategory`,
`productQuantity`) VALUES ('101','Dunhill switch','280','Cigarette','5200');
INSERT INTO `product`(`productID`, `productName`, `productPrice`, `productCategory`, 
`productQuantity`) VALUES ('102','Lucky strike','200','Cigarette','2000');
INSERT INTO `product`(`productID`, `productName`, `productPrice`, `productCategory`, 
`productQuantity`) VALUES ('201','Velo Mint','160','Nicotine Pouches','1800');
INSERT INTO `product`(`productID`, `productName`, `productPrice`, `productCategory`, 
`productQuantity`) VALUES ('202','Vuse ePen','2000','Vapour Product','800');

-- Table Storage insertion.
INSERT INTO `storage`(`facility_name`, `productID`, `product_category`, `product_quantity`, 
`duration`, `facilityLocation`) VALUES ('Obsidian Warehouse','101','Cigarette','1000','2','Machakos');
INSERT INTO `storage`(`facility_name`, `productID`, `product_category`, `product_quantity`, 
`duration`, `facilityLocation`) VALUES ('Sueng Warehouse','202','Vapour Product','50','1','Eldoret');
INSERT INTO `storage`(`facility_name`, `productID`, `product_category`, `product_quantity`, 
`duration`, `facilityLocation`) VALUES ('ETA retail store','201','Nicotine Pouches','200','1','Nairobi');
INSERT INTO `storage`(`facility_name`, `productID`, `product_category`, `product_quantity`, 
`duration`, `facilityLocation`) VALUES ('Obsidian Warehouse','201','Nicotine Pouches','550','4','Kisumu');
INSERT INTO `storage`(`facility_name`, `productID`, `product_category`, `product_quantity`, 
`duration`, `facilityLocation`) VALUES ('ETA retail store','202','Vapour Product','400','3','Mombasa');

-- Table Order insertion.
INSERT INTO `orders`(`order_id`, `productID`, `order_date`, `order_status`) 
VALUES ('300','202','10-11-23','complete');
INSERT INTO `orders`(`order_id`, `productID`, `order_date`, `order_status`) 
VALUES ('301','101','10-11-23','complete');
INSERT INTO `orders`(`order_id`, `productID`, `order_date`, `order_status`) 
VALUES ('303','202','11-11-23','pending');
INSERT INTO `orders`(`order_id`, `productID`, `order_date`, `order_status`) 
VALUES ('304','201','11-11-23','cancelled');
INSERT INTO `orders`(`order_id`, `productID`, `order_date`, `order_status`) 
VALUES ('305','102','11-11-23','cancelled');

-- Table traditional_tobacco_product insertion.
INSERT INTO `traditional_tobacco_product`(`productID`, `tar_content`) VALUES ('101','10');
INSERT INTO `traditional_tobacco_product`(`productID`, `tar_content`) VALUES ('102','12');
INSERT INTO `traditional_tobacco_product`(`productID`, `tar_content`) VALUES ('201','6');
INSERT INTO `traditional_tobacco_product`(`productID`, `tar_content`) VALUES ('202','6');

-- Table Regulations insertion.
INSERT INTO `regulations`(`regulation_id`, `regulation_name`, `compliant_status` ) VALUES 
('573', 'General Data Protection Regulation', 'Non-Compliant');
INSERT INTO `regulations`(`regulation_id`, `regulation_name`, `compliant_status` ) VALUES
('425', 'International Organization for Standardization Standard 9001:2015', 'Compliant');
INSERT INTO `regulations`(`regulation_id`, `regulation_name`, `compliant_status` ) VALUES
('674', 'Health Insurance Portability and Accountability Act', 'Partially-Compliant ');
INSERT INTO `regulations`(`regulation_id`, `regulation_name`, `compliant_status` ) VALUES
('788', 'Health Warnings on Cigarette Packets', 'Complaint');

-- Table smokeless_product insertion.
INSERT INTO `smokeless_product`(`productID`, `nicotine_content`) VALUES ('201','6');
INSERT INTO `smokeless_product`(`productID`, `nicotine_content`) VALUES ('202','6');

-- Table payment insertion.
INSERT INTO payment(payment_code, payment_date, payment_amount, order_id) 
VALUES ('EXTMVR34','10-11-23','20000','300');
INSERT INTO payment(payment_code, payment_date, payment_amount, order_id) 
VALUES ('72QMLJHG','10-11-23','98000','301');

-- Table order_product insertion.
INSERT INTO order_product(order_id, productID, quantity) 
VALUES ('300','202','10');
INSERT INTO order_product(order_id, productID, quantity) 
VALUES ('301','101','20');

-- Table product_regulation insertion.
INSERT INTO product_regulation(productID, regulation_id, compliance_status, last_checked_date) 
VALUES ('101','573','Non-Compliant','10-11-23');
INSERT INTO product_regulation(productID, regulation_id, compliance_status, last_checked_date) 
VALUES ('102','425', 'Compliant', '10-11-23');
INSERT INTO product_regulation(productID, regulation_id, compliance_status, last_checked_date) 
VALUES ('201','674', 'Partially-Compliant','10-11-23');
INSERT INTO product_regulation(productID, regulation_id, compliance_status, last_checked_date) 
VALUES ('202','788', 'Compliant', '10-11-23');