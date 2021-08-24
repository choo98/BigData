-- Aldalton Choo Chien Khin 101212783

data = LOAD '/dualcore/customers/part*' AS (cust_id:int,
             fname:chararray, lname:chararray,
             address:chararray, city:chararray, 
             state:chararray, zipcode:int);

grouped_data = GROUP data by state;

count_data = FOREACH grouped_data GENERATE group, COUNT(data.cust_id) as NumOfCust;

dump count_data;


