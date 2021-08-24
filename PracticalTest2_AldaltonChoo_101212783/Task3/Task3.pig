--Aldalton Choo Chien Khin 101212783
data = LOAD 'apple/AppleStore.tsv' AS (appid:chararray, appname:chararray, appsize:int, price:float, totalrating:float, avgrating:float, category:chararray); -- TODO finish the LOAD statement

grouped_data = GROUP data BY category;

popular = FOREACH grouped_data{ 
totalapps = ORDER data by totalrating DESC;

mostpopularapps = LIMIT totalapps 1;

GENERATE flatten(mostpopularapps); --if i dont flatten here it would give me an error saying category does not exist in the schema so i need to ungroup it using flatten so that category will be included when generating; 
}

most_popular = FOREACH popular GENERATE category, appname, totalrating;
STORE most_popular into 'AldaltonChoo_PopularApps';
