alter procedure sp_buscar_articulo_nombre
@p_texto_buscar varchar(50)
as
begin
	select f06_id, f06_descripcion, f06_nombre, f06_descripcion, f06_imagen,
		   f02_id, f02_nombre, f01_id, f01_nombre 
	from t06_articulo 
	inner join t01_categoria on f01_id = f06_id_categoria
	inner join t02_presentacion on f02_id = f06_id_presentacion
	where f06_nombre like @p_texto_buscar + '%'
	order by f06_id
end
go