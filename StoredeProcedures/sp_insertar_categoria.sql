ALTER procedure sp_insertar_categoria
@p_id int output,
@p_nombre VARCHAR(50),
@p_descripcion VARCHAR(250)
as
begin
			  insert into t01_categoria(
						  f01_nombre, 
						  f01_descripcion) 
					values(
						  @p_nombre, 
						  @p_descripcion)
end
go

