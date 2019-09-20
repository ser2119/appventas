alter procedure sp_buscar_articulo_venta_cod
@p_texto_buscar VARCHAR(50)
as
begin
	select f08_id_ingreso id_ingreso,
		   f01_id,
		   f01_nombre,
		   f08_precio_compra,
		   f08_precio_venta,
		   f08_fecha_vencimiento,
		   f02_nombre,
		   f08_stock_actual,
		   f08_id id_detalle
	from t06_articulo
	inner join t01_categoria on f01_id = f06_id_categoria
	inner join t02_presentacion on f02_id = f06_id_presentacion
	inner join t08_detalle_ingreso on f08_id_articulo = f08_id
	inner join t07_ingreso on f07_id = f08_id_ingreso
	where f06_codigo = @p_texto_buscar
	and f08_stock_actual > 0
	and f07_estado <> 'Anulado'
end
