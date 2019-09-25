alter procedure sp_eliminar_venta
@p_id int
as
begin
delete from t09_venta
where f09_id = @p_id
end
go