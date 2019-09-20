alter procedure sp_mostrar_presentacion
as
begin
	select top 200 *
	from t02_presentacion
	order by f02_id desc
end
