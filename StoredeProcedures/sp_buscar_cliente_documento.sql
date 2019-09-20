alter procedure sp_buscar_cliente_documento
@p_texto_buscar varchar(50)
as
begin
	select *
	from t03_cliente 
	where f03_num_documento like @p_texto_buscar + '%'
	order by f03_id
end
