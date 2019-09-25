alter procedure sp_mostrar_detalle_ingreso
@p_texto_buscar int
as
begin 

select f08_id,
	   f06_nombre as Articulo,
	   f08_precio_compra,
	   f08_precio_venta,
	   f08_stock_inicial,
	   f08_fecha_produccion,
	   f08_fecha_vencimiento,
	   (f08_stock_inicial * f08_precio_compra) as Subtotal
from t08_detalle_ingreso d 
inner join t06_articulo a on f06_id = f08_id_articulo
where f08_id = @p_texto_buscar
end
go