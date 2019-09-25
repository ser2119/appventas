alter procedure sp_insertar_trabajador
@p_idtrabajador int output,
@p_nombre varchar(20),
@p_apellidos varchar(40),
@p_sexo varchar(1),
@p_fecha_nacimiento date,
@p_num_documento varchar(8),
@p_direccion varchar(100),
@p_telefono varchar(10),
@p_email varchar(50),
@p_acceso varchar(20),
@p_usuario varchar(20),
@p_password varchar(20)
as
begin
insert into t04_trabajador (f04_nombre,
					        f04_apellidos,
						    f04_sexo,
						    f04_fecha_nacimiento,
						    f04_num_documento,
						    f04_direccion,
						    f04_telefono,
						    f04_email,
						    f04_acceso,
						    f04_usuario,
						    f04_password)
		     values (@p_nombre,
					 @p_apellidos,
					 @p_sexo,
					 @p_fecha_nacimiento,
					 @p_num_documento,
					 @p_direccion,
					 @p_telefono,
					 @p_email,
					 @p_acceso,
					 @p_usuario,
					 @p_password)
end
go