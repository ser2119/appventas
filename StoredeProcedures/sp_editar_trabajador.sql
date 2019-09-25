alter procedure sp_editar_trabajador
@p_id_trabajador int,
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
	update t04_trabajador set 
	f04_nombre				=	@p_nombre,
	f04_apellidos			=	@p_apellidos,
	f04_sexo				=	@p_sexo,
	f04_fecha_nacimiento	=	@p_fecha_nacimiento,
	f04_num_documento		=	@p_num_documento,
	f04_direccion			=	@p_direccion,
	f04_telefono			=	@p_telefono,
	f04_email				=	@p_email,
	f04_acceso				=	@p_acceso,
	f04_usuario				=	@p_usuario,
	f04_password			=	@p_password
	where f04_id = @p_id_trabajador
end
go