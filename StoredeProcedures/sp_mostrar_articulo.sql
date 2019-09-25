alter procedure sp_mostrar_articulo
as
begin

SELECT top 100 f06_id, 
			   f06_codigo, 
			   f06_nombre,
			   f06_descripcion, 
			   f06_imagen, 
			   f06_id_categoria,
			   f01_nombre AS Categoria, 
			   f02_id, 
			   f02_nombre AS Presentacion
FROM t06_articulo 
INNER JOIN t01_categoria ON f01_id = f06_id_categoria 
INNER JOIN t02_presentacion ON f02_id = f06_id_presentacion
order by f06_id desc
end
go