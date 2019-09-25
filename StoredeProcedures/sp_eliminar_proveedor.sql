alter procedure sp_eliminar_proveedor
@p_id int
as
begin
delete from t05_proveedor
where f05_id = @p_id
end
go