create procedure sp_eliminar_categoria
@v_id int
as
begin
	delete  t01_categoria
	where f01_id = @v_id
end
go