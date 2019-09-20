alter procedure sp_buscar_cliente_apellidos
@v_texto_buscar varchar(50)
as
begin
	select *
	from t03_cliente 
	where f03_apellidos like @v_texto_buscar + '%'
	order by f03_id
end
go