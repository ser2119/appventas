alter procedure sp_mostrar_cliente
as
begin
	select top 200 *
	from t03_cliente
	order by f03_id desc
end
