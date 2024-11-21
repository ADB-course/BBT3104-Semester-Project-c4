-- Write your SQL code here

-- Table Product insertion.
INSERT INTO `PRODUCT`(
    `PRODUCTID`,
    `PRODUCTNAME`,
    `PRODUCTPRICE`,
    `PRODUCTCATEGORY`,
    `PRODUCTQUANTITY`
) VALUES (
    '101',
    'Dunhill switch',
    '280',
    'Cigarette',
    '5200'
);

INSERT INTO `PRODUCT`(
    `PRODUCTID`,
    `PRODUCTNAME`,
    `PRODUCTPRICE`,
    `PRODUCTCATEGORY`,
    `PRODUCTQUANTITY`
) VALUES (
    '102',
    'Lucky strike',
    '200',
    'Cigarette',
    '2000'
);

INSERT INTO `PRODUCT`(
    `PRODUCTID`,
    `PRODUCTNAME`,
    `PRODUCTPRICE`,
    `PRODUCTCATEGORY`,
    `PRODUCTQUANTITY`
) VALUES (
    '201',
    'Velo Mint',
    '160',
    'Nicotine Pouches',
    '1800'
);

INSERT INTO `PRODUCT`(
    `PRODUCTID`,
    `PRODUCTNAME`,
    `PRODUCTPRICE`,
    `PRODUCTCATEGORY`,
    `PRODUCTQUANTITY`
) VALUES (
    '202',
    'Vuse ePen',
    '2000',
    'Vapour Product',
    '800'
);

-- Table Storage insertion.
INSERT INTO `STORAGE`(
    `FACILITY_NAME`,
    `PRODUCTID`,
    `PRODUCT_CATEGORY`,
    `PRODUCT_QUANTITY`,
    `DURATION`,
    `FACILITYLOCATION`
) VALUES (
    'Obsidian Warehouse',
    '101',
    'Cigarette',
    '1000',
    '2',
    'Machakos'
);

INSERT INTO `STORAGE`(
    `FACILITY_NAME`,
    `PRODUCTID`,
    `PRODUCT_CATEGORY`,
    `PRODUCT_QUANTITY`,
    `DURATION`,
    `FACILITYLOCATION`
) VALUES (
    'Sueng Warehouse',
    '202',
    'Vapour Product',
    '50',
    '1',
    'Eldoret'
);

INSERT INTO `STORAGE`(
    `FACILITY_NAME`,
    `PRODUCTID`,
    `PRODUCT_CATEGORY`,
    `PRODUCT_QUANTITY`,
    `DURATION`,
    `FACILITYLOCATION`
) VALUES (
    'ETA retail store',
    '201',
    'Nicotine Pouches',
    '200',
    '1',
    'Nairobi'
);

INSERT INTO `STORAGE`(
    `FACILITY_NAME`,
    `PRODUCTID`,
    `PRODUCT_CATEGORY`,
    `PRODUCT_QUANTITY`,
    `DURATION`,
    `FACILITYLOCATION`
) VALUES (
    'Obsidian Warehouse',
    '201',
    'Nicotine Pouches',
    '550',
    '4',
    'Kisumu'
);

INSERT INTO `STORAGE`(
    `FACILITY_NAME`,
    `PRODUCTID`,
    `PRODUCT_CATEGORY`,
    `PRODUCT_QUANTITY`,
    `DURATION`,
    `FACILITYLOCATION`
) VALUES (
    'ETA retail store',
    '202',
    'Vapour Product',
    '400',
    '3',
    'Mombasa'
);

INSERT INTO `STORAGE`(
    `FACILITY_NAME`,
    `PRODUCTID`,
    `PRODUCT_CATEGORY`,
    `PRODUCT_QUANTITY`,
    `DURATION`,
    `FACILITYLOCATION`
) VALUES (
    'Ricnel Warehouse',
    '103',
    'Nicotine',
    '200',
    '3',
    'Nakuru'
);

-- Table Order insertion.
INSERT INTO `ORDERS`(
    `ORDER_ID`,
    `PRODUCTID`,
    `ORDER_DATE`,
    `ORDER_STATUS`
) VALUES (
    '300',
    '202',
    '10-11-23',
    'complete'
);

INSERT INTO `ORDERS`(
    `ORDER_ID`,
    `PRODUCTID`,
    `ORDER_DATE`,
    `ORDER_STATUS`
) VALUES (
    '301',
    '101',
    '10-11-23',
    'complete'
);

INSERT INTO `ORDERS`(
    `ORDER_ID`,
    `PRODUCTID`,
    `ORDER_DATE`,
    `ORDER_STATUS`
) VALUES (
    '303',
    '202',
    '11-11-23',
    'pending'
);

INSERT INTO `ORDERS`(
    `ORDER_ID`,
    `PRODUCTID`,
    `ORDER_DATE`,
    `ORDER_STATUS`
) VALUES (
    '304',
    '201',
    '11-11-23',
    'cancelled'
);

INSERT INTO `ORDERS`(
    `ORDER_ID`,
    `PRODUCTID`,
    `ORDER_DATE`,
    `ORDER_STATUS`
) VALUES (
    '305',
    '102',
    '11-11-23',
    'cancelled'
);

-- Table traditional_tobacco_product insertion.
INSERT INTO `TRADITIONAL_TOBACCO_PRODUCT`(
    `PRODUCTID`,
    `TAR_CONTENT`
) VALUES (
    '101',
    '10'
);

INSERT INTO `TRADITIONAL_TOBACCO_PRODUCT`(
    `PRODUCTID`,
    `TAR_CONTENT`
) VALUES (
    '102',
    '12'
);

INSERT INTO `TRADITIONAL_TOBACCO_PRODUCT`(
    `PRODUCTID`,
    `TAR_CONTENT`
) VALUES (
    '201',
    '6'
);

INSERT INTO `TRADITIONAL_TOBACCO_PRODUCT`(
    `PRODUCTID`,
    `TAR_CONTENT`
) VALUES (
    '202',
    '6'
);

-- Table Regulations insertion.
INSERT INTO `REGULATIONS`(
    `REGULATION_ID`,
    `REGULATION_NAME`,
    `COMPLIANT_STATUS`
) VALUES (
    '573',
    'General Data Protection Regulation',
    'Non-Compliant'
);

INSERT INTO `REGULATIONS`(
    `REGULATION_ID`,
    `REGULATION_NAME`,
    `COMPLIANT_STATUS`
) VALUES (
    '425',
    'International Organization for Standardization Standard 9001:2015',
    'Compliant'
);

INSERT INTO `REGULATIONS`(
    `REGULATION_ID`,
    `REGULATION_NAME`,
    `COMPLIANT_STATUS`
) VALUES (
    '674',
    'Health Insurance Portability and Accountability Act',
    'Partially-Compliant '
);

INSERT INTO `REGULATIONS`(
    `REGULATION_ID`,
    `REGULATION_NAME`,
    `COMPLIANT_STATUS`
) VALUES (
    '788',
    'Health Warnings on Cigarette Packets',
    'Complaint'
);

-- Table smokeless_product insertion.
INSERT INTO `SMOKELESS_PRODUCT`(
    `PRODUCTID`,
    `NICOTINE_CONTENT`
) VALUES (
    '201',
    '6'
);

INSERT INTO `SMOKELESS_PRODUCT`(
    `PRODUCTID`,
    `NICOTINE_CONTENT`
) VALUES (
    '202',
    '6'
);

-- Table payment insertion.
INSERT INTO PAYMENT(
    PAYMENT_CODE,
    PAYMENT_DATE,
    PAYMENT_AMOUNT,
    ORDER_ID
) VALUES (
    'EXTMVR34',
    '10-11-23',
    '20000',
    '300'
);

INSERT INTO PAYMENT(
    PAYMENT_CODE,
    PAYMENT_DATE,
    PAYMENT_AMOUNT,
    ORDER_ID
) VALUES (
    '72QMLJHG',
    '10-11-23',
    '98000',
    '301'
);

-- Table order_product insertion.
INSERT INTO ORDER_PRODUCT(
    ORDER_ID,
    PRODUCTID,
    QUANTITY
) VALUES (
    '300',
    '202',
    '10'
);

INSERT INTO ORDER_PRODUCT(
    ORDER_ID,
    PRODUCTID,
    QUANTITY
) VALUES (
    '301',
    '101',
    '20'
);

-- Table product_regulation insertion.
INSERT INTO PRODUCT_REGULATION(
    PRODUCTID,
    REGULATION_ID,
    COMPLIANCE_STATUS,
    LAST_CHECKED_DATE
) VALUES (
    '101',
    '573',
    'Non-Compliant',
    '10-11-23'
);

INSERT INTO PRODUCT_REGULATION(
    PRODUCTID,
    REGULATION_ID,
    COMPLIANCE_STATUS,
    LAST_CHECKED_DATE
) VALUES (
    '102',
    '425',
    'Compliant',
    '10-11-23'
);

INSERT INTO PRODUCT_REGULATION(
    PRODUCTID,
    REGULATION_ID,
    COMPLIANCE_STATUS,
    LAST_CHECKED_DATE
) VALUES (
    '201',
    '674',
    'Partially-Compliant',
    '10-11-23'
);

INSERT INTO PRODUCT_REGULATION(
    PRODUCTID,
    REGULATION_ID,
    COMPLIANCE_STATUS,
    LAST_CHECKED_DATE
) VALUES (
    '202',
    '788',
    'Compliant',
    '10-11-23'
);