alter procedure sp_buscar_prov_razon_social
@v_texto_buscar VARCHAR(50)
as
begin

	Select *
	from t05_proveedor
	where f05_razon_social like @v_texto_buscar + '%'
	order by f05_razon_social

end
go