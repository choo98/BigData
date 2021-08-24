-- Aldalton Choo Chien Khin 101212783

data = LOAD '/dualcore/customers/part*' AS (cust_id:int,
             fname:chararray, lname:chararray,
             address:chararray, city:chararray, 
             state:chararray, zipcode:int);

filterdata = FILTER data by city == 'Zap';

concatdata = FOREACH filterdata GENERATE CONCAT (CONCAT(fname,' '),lname);


dump concatdata;


