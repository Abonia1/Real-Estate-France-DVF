SET SESSION sql_mode = '';
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 5.7/Uploads/processed_data.csv' 
INTO TABLE dvf.processed_data 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;
