alter procedure sp_stock_articulos
as
begin 

SELECT f06_id, 
	   f06_nombre,
	   f01_nombre categoria,
	   sum(f08_stock_inicial) cantidad_Ingreso,
	   sum(f08_stock_actual) as cantidad_Stock,
	   (sum(f08_stock_inicial) - sum(f08_stock_actual))  cantidad_Venta
FROM t06_articulo 
inner join t01_categoria ON f01_id = f06_id_categoria 
inner join t08_detalle_ingreso ON f08_id_articulo = f06_id 
inner join t07_ingreso ON f07_id = f08_id_ingreso
where f07_estado <>'ANULADO'
group by f06_id, 
		 f06_nombre,
		 f01_nombre
end
go