alter procedure sp_eliminar_presentacion
@p_id int
as
begin
delete from t02_presentacion
where f02_id = @p_id
end
go