-- Write your SQL code here

-- Table Product insertion.
INSERT INTO `product`(`productID`, `productName`, `productPrice`, `productCategory`, `productQuantity`) VALUES ('101','Dunhill switch','280','Cigarette','5200');
INSERT INTO `product`(`productID`, `productName`, `productPrice`, `productCategory`, `productQuantity`) VALUES ('102','Lucky strike','200','Cigarette','2000');
INSERT INTO `product`(`productID`, `productName`, `productPrice`, `productCategory`, `productQuantity`) VALUES ('201','Velo Mint','160','Nicotine Pouches','1800');
INSERT INTO `product`(`productID`, `productName`, `productPrice`, `productCategory`, `productQuantity`) VALUES ('202','Vuse ePen','2000','Vapour Product','800');

-- Table Storage insertion.
INSERT INTO `storage`(`facility_name`, `productID`, `product_category`, `product_quantity`, `duration`, `facilityLocation`) VALUES ('Obsidian Warehouse','101','Cigarette','1000','2','Machakos');
INSERT INTO `storage`(`facility_name`, `productID`, `product_category`, `product_quantity`, `duration`, `facilityLocation`) VALUES ('Sueng Warehouse','202','Vapour Product','50','1','Eldoret');
INSERT INTO `storage`(`facility_name`, `productID`, `product_category`, `product_quantity`, `duration`, `facilityLocation`) VALUES ('ETA retail store','201','Nicotine Pouches','200','1','Nairobi');
INSERT INTO `storage`(`facility_name`, `productID`, `product_category`, `product_quantity`, `duration`, `facilityLocation`) VALUES ('Obsidian Warehouse','201','Nicotine Pouches','550','4','Kisumu');
INSERT INTO `storage`(`facility_name`, `productID`, `product_category`, `product_quantity`, `duration`, `facilityLocation`) VALUES ('ETA retail store','202','Vapour Product','400','3','Mombasa');

-- Table Order insertion.
INSERT INTO `orders`(`order_id`, `productID`, `order_date`, `order_status`) VALUES ('300','202','10-11-23','complete');
INSERT INTO `orders`(`order_id`, `productID`, `order_date`, `order_status`) VALUES ('301','101','10-11-23','complete');
INSERT INTO `orders`(`order_id`, `productID`, `order_date`, `order_status`) VALUES ('303','202','11-11-23','pending');
INSERT INTO `orders`(`order_id`, `productID`, `order_date`, `order_status`) VALUES ('304','201','11-11-23','cancelled');
INSERT INTO `orders`(`order_id`, `productID`, `order_date`, `order_status`) VALUES ('305','102','11-11-23','cancelled');

-- Table traditional_tobacco_product insertion.
INSERT INTO `traditional_tobacco_product`(`productID`, `tar_content`) VALUES ('101','10');
INSERT INTO `traditional_tobacco_product`(`productID`, `tar_content`) VALUES ('102','12');
INSERT INTO `traditional_tobacco_product`(`productID`, `tar_content`) VALUES ('201','6');
INSERT INTO `traditional_tobacco_product`(`productID`, `tar_content`) VALUES ('202','6');