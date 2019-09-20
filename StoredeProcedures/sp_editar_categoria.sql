create procedure sp_editar_categoria
@v_id int,
@v_nombre VARCHAR(50),
@v_descripcion VARCHAR(2)
as
begin
	update  t01_categoria
	set f01_nombre = @v_nombre, 
	f01_descripcion = @v_descripcion 
	where f01_id = @v_id
end
go