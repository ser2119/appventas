alter procedure sp_editar_articulo
@p_id int,
@p_codigo VARCHAR(50),
@p_nombre VARCHAR(50),
@p_descripcion VARCHAR(1024),
@p_image image,
@p_id_categoria int,
@p_id_presentacion int

as
begin
update t06_articulo
set f06_codigo = @p_codigo,
	f06_descripcion = @p_descripcion,
	f06_id_categoria = @p_id_categoria,
	f06_id_presentacion = @p_id_presentacion,
	f06_imagen = @p_image,
	f06_nombre = @p_nombre
where f06_id = @p_id
end

