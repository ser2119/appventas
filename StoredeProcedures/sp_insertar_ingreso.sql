alter procedure sp_insertar_ingreso
@p_idingreso int=null output,
@p_idtrabajador int,
@p_idproveedor int,
@p_fecha date,
@p_tipo_comprobante varchar(20),
@p_serie varchar(4),
@p_correlativo varchar(7),
@p_igv decimal(4,2),
@p_estado varchar(7)
as
begin
insert into t07_ingreso(f07_id_trabajador,
				        f07_id_proveedor,
						f07_fecha,
						f07_tipo_comprobante,
						f07_serie,
						f07_correlativo,
						f07_igv,
						f07_estado)
			values (@p_idtrabajador,
					@p_idproveedor,
					@p_fecha,
					@p_tipo_comprobante,
					@p_serie,
					@p_correlativo,
					@p_igv,
					@p_estado)
--Obtener el código autogenerado
SET @p_idingreso=@@IDENTITY
end
go
