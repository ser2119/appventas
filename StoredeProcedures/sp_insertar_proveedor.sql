alter procedure sp_insertar_proveedor
@p_idproveedor int output,
@p_razon_social varchar(150),
@p_sector_comercial varchar(50),
@p_tipo_documento varchar(20),
@p_num_documento varchar(11),
@p_direccion varchar(100),
@p_telefono varchar(10),
@p_email varchar(50),
@p_url varchar(100)
as
begin
insert into t05_proveedor(f05_razon_social,
					      f05_sector_comercial,
						  f05_tipo_documento,
						  f05_num_documento,
						  f05_direccion,
						  f05_telefono,
						  f05_email,
						  f05_url)
			values (@p_razon_social,
					@p_sector_comercial,
					@p_tipo_documento,
				    @p_num_documento,
					@p_direccion,
					@p_telefono,
					@p_email,
					@p_url)
end
GO

