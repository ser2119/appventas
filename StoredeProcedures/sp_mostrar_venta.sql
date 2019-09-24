alter procedure sp_mostrar_venta
as
begin 

select top 10 f09_id,
			  (f04_apellidos+' '+f04_nombre) trabajador, 
			  (f03_apellidos+' '+f03_nombre) cliente,
			  f09_fecha,
			  f09_tipo_comprobante, 
			  f09_serie,
			  f09_correlativo,
			  f09_igv Impuesto,
			  sum((f10_cantidad*f10_precio_venta)-f10_descuento) as Total
from t10_detalle_venta  
inner join t09_venta  on f09_id = f10_id_venta
inner join t03_cliente  on f03_id = f09_id_cliente
inner join t04_trabajador on f04_id = f09_id_trabajador
group by f09_id,
		(f04_apellidos+' '+f04_nombre), 
		(f03_apellidos+' '+f03_nombre),
		f09_fecha,
		f09_tipo_comprobante,
		f09_serie,
		f09_correlativo,
		f09_igv
order by f09_id desc
end
go