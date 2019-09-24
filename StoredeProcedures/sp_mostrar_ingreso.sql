alter procedure sp_mostrar_ingreso
as
begin 

select top 100 f07_id,
			   f04_apellidos + ' ' + f04_nombre trabajador,
			   f05_razon_social proveedor,
			   f07_fecha,
			   f07_tipo_comprobante,
			   f07_serie,
			   f07_correlativo,
			   f07_estado,
			   sum(f08_precio_compra * f08_stock_inicial) as Total,
			   f07_igv as Impuesto
from t08_detalle_ingreso d 
inner join t07_ingreso  on f07_id = f08_id_ingreso
inner join t05_proveedor on f05_id = f07_id_proveedor
inner join t04_trabajador on f04_id = f07_id_proveedor
group by f07_id,
		 f04_apellidos + ' ' + f04_nombre,
		 f05_razon_social,
		 f07_fecha,
		 f07_tipo_comprobante,
		 f07_serie,
		 f07_correlativo,
		 f07_estado,
		 f07_igv
order by f07_id desc
end
go