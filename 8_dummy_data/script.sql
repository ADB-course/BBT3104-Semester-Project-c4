-- Write your SQL code here

--Table Product insertion.
INSERT INTO `product`(`productID`, `productName`, `productPrice`, `productCategory`, `productQuantity`) VALUES ('101','Dunhill switch','280','Cigarette','5200');
INSERT INTO `product`(`productID`, `productName`, `productPrice`, `productCategory`, `productQuantity`) VALUES ('102','Lucky strike','200','Cigarette','2000');
INSERT INTO `product`(`productID`, `productName`, `productPrice`, `productCategory`, `productQuantity`) VALUES ('201','Velo Mint','160','Nicotine Pouches','1800');
INSERT INTO `product`(`productID`, `productName`, `productPrice`, `productCategory`, `productQuantity`) VALUES ('202','Vuse ePen','2000','Vapour Product','800')

--Table Storage insertion.
INSERT INTO `storage`(`faculty_name`, `productID`, `product_category`, `product_quantity`, `duration`, `facilityLocation`) VALUES ('SAI Warehouse','101','Cigarette','1000','2','Machakos');
INSERT INTO `storage`(`faculty_name`, `productID`, `product_category`, `product_quantity`, `duration`, `facilityLocation`) VALUES ('Sueng Warehouse','202','Vapour Product','50','1','Eldoret');
INSERT INTO `storage`(`faculty_name`, `productID`, `product_category`, `product_quantity`, `duration`, `facilityLocation`) VALUES ('ETA reatail store','201','Nicotine Pouches','200','1','Nairobi');
INSERT INTO `storage`(`faculty_name`, `productID`, `product_category`, `product_quantity`, `duration`, `facilityLocation`) VALUES ('SAI Warehouse','201','Nicotine Pouches','550','4','Machakos');
INSERT INTO `storage`(`faculty_name`, `productID`, `product_category`, `product_quantity`, `duration`, `facilityLocation`) VALUES ('ETA retail store','202','Vapour Product','400','3','Nairobi')