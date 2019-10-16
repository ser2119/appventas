ALTER procedure sp_editar_categoria
@p_id int,
@p_nombre VARCHAR(50),
@p_descripcion VARCHAR(250)
as
begin
	update  t01_categoria
	set f01_nombre = @p_nombre, 
	f01_descripcion = @p_descripcion 
	where f01_id = @p_id
end
go