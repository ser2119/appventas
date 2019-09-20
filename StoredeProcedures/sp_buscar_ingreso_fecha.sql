alter procedure sp_buscar_ingreso_fecha
@fecha1 varchar(50),
@fecha2 varchar(50)
as
begin

	select f07_id id_ingreso,
		   f07_fecha fecha_ingreso, 
		   f07_tipo_comprobante tipo_comprobante, 
		   f07_serie serie, 
		   f07_correlativo correlativo, 
		   f07_estado estado,
		   (f04_nombre + ' ' +f04_apellidos) nombre_trabajador, 
		   f05_razon_social razon_social, 
		   sum(f08_stock_inicial * f08_precio_compra) total,
		   f07_igv impuesto
	from t08_detalle_ingreso
	inner join t07_ingreso on f07_id = f08_id_ingreso 
	inner join t04_trabajador on f04_id = f07_id_trabajador
	inner join t05_proveedor on f05_id = f07_id_proveedor
	where f07_fecha between @fecha1 and @fecha2
	group by f07_id, 
		     f07_fecha,
			 f07_tipo_comprobante,
			 f07_serie,
			 f07_correlativo,
			 f07_estado,
			 (f04_nombre + ' ' +f04_apellidos),
			 f05_razon_social,
			 f07_igv
	order by f07_fecha

end
go