alter procedure sp_eliminar_cliente
@p_id int
as
begin
delete from t03_cliente
where f03_id = @p_id
end