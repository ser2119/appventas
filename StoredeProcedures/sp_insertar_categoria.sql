create procedure sp_insertar_categoria
@p_id int output,
@v_nombre VARCHAR(50),
@v_descripcion VARCHAR(2
)as
begin
			  insert into t01_categoria(
						  f01_nombre, 
						  f01_descripcion) 
					values(
						  @v_nombre, 
						  @v_descripcion)
end
go