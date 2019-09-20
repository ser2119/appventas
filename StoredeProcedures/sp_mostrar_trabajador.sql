alter procedure sp_mostrar_trabajador
as
begin
	select top 200 *
	from t04_trabajador
	order by f04_id desc
end
