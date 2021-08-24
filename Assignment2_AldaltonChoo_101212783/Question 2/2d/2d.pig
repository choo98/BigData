-- Aldalton Choo Chien Khin 101212783

data = LOAD '/dualcore/products/part*' AS (prod_id:int,
             brand:chararray, name:chararray,
             price:int, cost:int, 
             shipping_wt:int);

grouped_data = GROUP data by brand;

brand_once = FOREACH grouped_data {

totalbrand = ORDER data by brand DESC;

onebrand = LIMIT totalbrand 1;

GENERATE flatten(onebrand);

}

final_brandonce = FOREACH brand_once GENERATE brand;

STORE final_brandonce INTO '/dualcore/products_brand';


