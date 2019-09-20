alter procedure sp_editar_presentacion
@p_id int,
@p_nombre VARCHAR(50),
@p_descripcion VARCHAR(256)
as
begin
	update t02_presentacion
	set f02_nombre = @p_nombre,
	f02_descripcion = @p_descripcion
	where f02_id = @p_id
end
