--Aldalton Choo Chien Khin 101212783
data = LOAD 'apple/AppleStore.tsv' AS (appid:chararray, appname:chararray, appsize:int, price:float, totalrating:float, avgrating:float, category:chararray); -- TODO finish the LOAD statement

grouped_data = GROUP data by avgrating;

totalratings = FOREACH grouped_data GENERATE group,COUNT(data.appname) as TotalApps;

ordered = ORDER totalratings by group ASC;

dump ordered;
