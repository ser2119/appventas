alter procedure sp_buscar_prov_num_docto
@p_texto_buscar VARCHAR(50)
as
begin

	Select *
	from t05_proveedor
	where f05_id like @p_texto_buscar + '%'

end
go