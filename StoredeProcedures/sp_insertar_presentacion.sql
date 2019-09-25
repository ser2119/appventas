alter procedure sp_insertar_presentacion
@p_idpresentacion int output,
@p_nombre varchar(50),
@p_descripcion varchar(256)
as
begin
insert into t02_presentacion(f02_nombre,
							 f02_descripcion)
			values (@p_nombre,
				    @p_descripcion)
end
go


