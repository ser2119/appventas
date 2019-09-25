alter procedure sp_insertar_cliente
@p_idcliente int output,
@p_nombre varchar(50),
@p_apellidos varchar(40),
@p_sexo varchar(1),
@p_fecha_nacimiento date,
@p_tipo_documento varchar(20),
@p_num_documento varchar(11),
@p_direccion varchar(100),
@p_telefono varchar(10),
@p_email varchar(50)
as 
begin
	insert into t03_cliente(f03_nombre,
							f03_apellidos,
							f03_sexo,
							f03_fecha_nacimiento,
							f03_tipo_documento,
							f03_num_documento,
							f03_direccion,
							f03_telefono,
							f03_email)
				values (@p_nombre,
						@p_apellidos,
						@p_sexo,
						@p_fecha_nacimiento,
						@p_tipo_documento,
						@p_num_documento,
						@p_direccion,
						@p_telefono,
						@p_email)
end
go
