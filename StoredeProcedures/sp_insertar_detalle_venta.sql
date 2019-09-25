alter proc sp_insertar_detalle_venta
@p_iddetalle_venta int output,
@p_idventa int,
@p_iddetalle_ingreso int,
@p_cantidad int,
@p_precio_venta money,
@p_descuento money
as
begin
insert into t10_detalle_venta(f10_id_venta,
					          f10_id_detalle_ingreso,
							  f10_cantidad,
							  f10_precio_venta,
							  f10_descuento)
			values (@p_idventa,
					@p_iddetalle_ingreso,
					@p_cantidad,
					@p_precio_venta,
					@p_descuento)
end
go