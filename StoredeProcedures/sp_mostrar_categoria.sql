ALTER procedure sp_mostrar_categorias
as
begin 
select top 200 f01_id, f01_nombre, f01_descripcion from  t01_categoria
order by f01_id desc
end