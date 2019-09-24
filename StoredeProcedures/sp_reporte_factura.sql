alter procedure sp_reporte_factura
@p_id_venta int
as
begin

select *  
from t10_detalle_venta  
inner join t08_detalle_ingreso di on f08_id = f10_id_detalle_ingreso
inner join t06_articulo a on f06_id = f08_id_articulo
inner join t09_venta on f09_id = f10_id_venta
inner join t03_cliente  on f03_id = f09_id_cliente
inner join t04_trabajador on f04_id = f09_id_trabajador
where f09_id = @p_id_venta
end
go