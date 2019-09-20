alter procedure sp_buscar_categoria
@p_texto_buscar VARCHAR(50)
as 
begin
select * from t01_categoria
where f01_nombre like @p_texto_buscar + '%'
end
go