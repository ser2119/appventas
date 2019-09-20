create procedure sp_mostrar_categorias
as
begin 
select top 200 * from  t01_categoria 
order by f01_id desc
end