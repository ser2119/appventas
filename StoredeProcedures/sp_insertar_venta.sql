alter procedure sp_insertar_venta
@p_idventa int = null output,
@p_idcliente int,
@p_idtrabajador int,
@p_fecha date,
@p_tipo_comprobante varchar(20),
@p_serie varchar(4),
@p_correlativo varchar(7),
@p_igv decimal(4,2)
as
insert into t09_venta(f09_id_cliente,
				      f09_id_trabajador,
				      f09_fecha,
				      f09_tipo_comprobante,
				      f09_serie,
				      f09_correlativo,
				      f09_igv)
			values (@p_idcliente,
			        @p_idtrabajador,
					@p_fecha,
					@p_tipo_comprobante,
					@p_serie,
					@p_correlativo,
					@p_igv)
--Obtenemos el código autogenerado
set @p_idventa=@@IDENTITY
GO