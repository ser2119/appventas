alter procedure sp_eliminar_categoria
@p_id int
as
begin
	delete  t01_categoria
	where f01_id = @p_id
end
go