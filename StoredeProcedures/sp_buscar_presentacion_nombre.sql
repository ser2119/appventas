alter procedure sp_buscar_presentacion_nombre
@v_texto_buscar VARCHAR(50)
as
begin

	Select *
	from t02_presentacion
	where f02_nombre like @v_texto_buscar + '%'

end
go