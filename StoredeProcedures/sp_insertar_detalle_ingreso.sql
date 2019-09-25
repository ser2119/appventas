alter procedure sp_insertar_detalle_ingreso
@p_iddetalle_ingreso int output,
@p_idingreso int,
@p_idarticulo int,
@p_precio_compra money,
@p_precio_venta money,
@p_stock_inicial int,
@p_stock_actual int,
@p_fecha_produccion date,
@p_fecha_vencimiento date
as
begin
	insert into t08_detalle_ingreso(f08_id_ingreso,
									f08_id_articulo,
									f08_precio_compra,
									f08_precio_venta,
									f08_stock_inicial,
									f08_stock_actual,
									f08_fecha_produccion,
									f08_fecha_vencimiento)
				values (@p_idingreso,
						@p_idarticulo,
						@p_precio_compra,
						@p_precio_venta,
						@p_stock_inicial,
						@p_stock_actual,
						@p_fecha_produccion,
						@p_fecha_vencimiento)
end
go