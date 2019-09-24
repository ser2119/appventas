alter procedure sp_mostrar_detalle_venta
@p_texto_buscar int
as
begin 

select f10_id_detalle_ingreso,
	   f06_nombre as articulo,
	   f10_cantidad,
	   f10_precio_venta,
	   f10_descuento,
	   ((f10_precio_venta * f10_cantidad) - f10_descuento) as Subtotal
from t10_detalle_venta d 
inner join t08_detalle_ingreso di on f08_id = f10_id_detalle_ingreso
inner join t06_articulo a on f06_id = f08_id_articulo
where f10_id = @p_texto_buscar
end
go