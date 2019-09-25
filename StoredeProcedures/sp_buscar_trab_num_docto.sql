alter procedure sp_buscar_trab_num_docto
@p_texto_buscar VARCHAR(50)
as
begin

	select *
	from t04_trabajador
	where f04_num_documento like @p_texto_buscar + '%'
	order by f04_num_documento

end
go
