alter procedure sp_eliminar_articulo
@p_id_articulo int
as
begin
delete from t06_articulo
where f06_id = @p_id_articulo
end
go