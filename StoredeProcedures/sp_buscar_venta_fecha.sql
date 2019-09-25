alter procedure sp_buscar_venta_fecha
@p_fecha1 VARCHAR(50),
@p_fecha2 VARCHAR(50)
as
begin

	select f09_id id_venta,
		   f04_nombre + ' ' + f04_apellidos trabajador,
		   f03_nombre + ' ' + f03_apellidos cliente,
		   f09_fecha fecha_venta,
		   f09_tipo_comprobante tipo_comprobante,
		   f09_serie serie,
		   f09_correlativo correlativo,
		   sum (f10_precio_venta * f10_cantidad) total,
		   f09_igv
	from t10_detalle_venta
	inner join t09_venta on f09_id = f10_id_venta
	inner join t04_trabajador on f04_id = f09_id_trabajador
	inner join t03_cliente on f03_id = f09_id_cliente
	where f09_fecha between @p_fecha1 and @p_fecha2
	group by f09_id,
		   f04_nombre + ' ' + f04_apellidos,
		   f03_nombre + ' ' + f03_apellidos,
		   f09_fecha,
		   f09_tipo_comprobante,
		   f09_serie,
		   f09_correlativo,
		   f09_igv
	order by f09_fecha
end
go

