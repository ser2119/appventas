alter procedure sp_buscar_trab_apellidos
@p_texto_buscar VARCHAR(50)
as
begin

	Select *
	from t04_trabajador
	where f04_apellidos like @p_texto_buscar + '%'
	order by f04_apellidos

end
go