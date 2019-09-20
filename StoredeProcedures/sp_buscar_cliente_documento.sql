alter procedure sp_buscar_cliente_documento
@v_texto_buscar varchar(50)
as
begin
	select *
	from t03_cliente 
	where f03_num_documento like @v_texto_buscar + '%'
	order by f03_id
end
