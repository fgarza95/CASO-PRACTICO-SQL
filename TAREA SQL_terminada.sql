/*Contexto
El restaurante "Sabores del Mundo", es conocido por su auténtica cocina y su ambiente
acogedor.
Este restaurante lanzó un nuevo menú a principios de año y ha estado recopilando
información detallada sobre las transacciones de los clientes para identificar áreas de
oportunidad y aprovechar al máximo sus datos para optimizar las ventas.
Objetivo
Identificar cuáles son los productos del menú que han tenido más éxito y cuales son los que
menos han gustado a los clientes.
Pasos a seguir
a) Crear la base de datos con el archivo create_restaurant_db.sql
b) Explorar la tabla “menu_items” para conocer los productos del menú.
*/
SELECT *
FROM menu_items
/*
1.- Realizar consultas para contestar las siguientes preguntas:
● Encontrar el número de artículos en el menú.
*/
SELECT
item_name,
 MAX (price) as Articulo_mayor_precio
from menu_items
group by 1 
order by MAX(price) desc 
limit 1

SELECT
item_name,
 MIN (price) as Articulo_menor_precio
from menu_items
group by 1 
order by min(price) asc 
limit 1
/*
● ¿Cuál es el artículo menos caro y el más caro en el menú?

● ¿Cuántos platos americanos hay en el menú?
*/
SELECT 
CATEGORY,
Count(category)
from menu_items
GROUP BY 1
where category='Italian'
/*

● ¿Cuál es el precio promedio de los platos?
*/
SELECT
AVG (Price)
from menu_items
/*
c) Explorar la tabla “order_details” para conocer los datos que han sido recolectados.
1.- Realizar consultas para contestar las siguientes preguntas:
*/
SELECT*
FROM order_details
/*
● ¿Cuántos pedidos únicos se realizaron en total? 5370*/
SELECT 
Count(distinct order_id)
from order_details
/*● ¿Cuáles son los 5 pedidos que tuvieron el mayor número de artículos?*/
SELECT 
order_id,
Count(distinct item_id)
from order_details
group by 1
order by 2 desc
limit 5
/*● ¿Cuándo se realizó el primer pedido y el último pedido?
Primero: "2023-01-01"	"11:38:36"
Ultimo: "2023-01-01"	"22:12:13"*/
SELECT 
order_date,
order_time
from order_details
order by 1,2 asc
/*● ¿Cuántos pedidos se hicieron entre el '2023-01-01' y el '2023-01-05'?
308*/
SELECT 
COUNT(DISTINCT order_id)
from order_details
where order_date between '2023-01-01' and '2023-01-05'

SELECT 
t2.category,
sum (t2.price) as precio

FROM order_details t1
join menu_items t2
on t1.item_id=t2.menu_item_id
group by 1

SELECT 

sum (t2.price) as precio

FROM order_details t1
join menu_items t2
on t1.item_id=t2.menu_item_id

