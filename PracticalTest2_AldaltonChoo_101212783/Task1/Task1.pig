--Aldalton Choo Chien Khin 101212783
data = LOAD 'apple/AppleStore.tsv' AS (appid:chararray, appname:chararray, appsize:int, price:float, totalrating:float, avgrating:float, category:chararray); -- TODO finish the LOAD statement

top_five = LIMIT data 5;

dump top_five;

DESCRIBE data;
