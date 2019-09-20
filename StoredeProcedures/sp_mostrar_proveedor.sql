alter procedure sp_mostrar_proveedor
as
begin
	select top 200 *
	from t05_proveedor
	order by f05_id desc
end
