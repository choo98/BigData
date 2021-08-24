-- Aldalton Choo Chien Khin 101212783

data = LOAD '/dualcore/customers/part*' AS (cust_id:int,
             fname:chararray, lname:chararray,
             address:chararray, city:chararray, 
             state:chararray, zipcode:int);

fnameandlname = FOREACH data GENERATE fname,lname;

ordered_data = ORDER fnameandlname by lname DESC;

dump ordered_data;


