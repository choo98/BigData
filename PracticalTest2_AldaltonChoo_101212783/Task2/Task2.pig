--Aldalton Choo Chien Khin 101212783
data = LOAD 'apple/AppleStore.tsv' AS (appid:chararray, appname:chararray, appsize:int, price:float, totalrating:float, avgrating:float, category:chararray); -- TODO finish the LOAD statement

freegame = FILTER data by price == 0.00 AND category == 'Games';

top_six = LIMIT freegame 6;

dump top_six;
