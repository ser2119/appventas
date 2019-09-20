alter procedure sp_buscar_categoria
@v_texto_buscar VARCHAR(50)
as 
begin
select * from t01_categoria
where f01_nombre like @v_texto_buscar + '%'
end
go