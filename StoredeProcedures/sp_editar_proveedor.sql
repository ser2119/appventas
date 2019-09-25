alter procedure sp_editar_proveedor
@p_id_proveedor int,
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
	update t05_proveedor set 
	f05_razon_social	 =	@p_razon_social,
	f05_sector_comercial =	@p_sector_comercial,
	f05_tipo_documento	 =	@p_tipo_documento,
	f05_num_documento	 =	@p_num_documento,
	f05_direccion		 =	@p_direccion,
	f05_telefono		 =	@p_telefono,
	f05_email 			 =	@p_email,
	f05_url				 =	@p_url
	where f05_id = @p_id_proveedor
end
go
