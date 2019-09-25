alter procedure sp_login
@p_usuario varchar(20),
@p_password varchar(20)
as
begin
select f04_id,
	   f04_apellidos,
	   f04_nombre,
	   f04_acceso
from t04_trabajador
where f04_usuario = @p_usuario and f04_password = @p_password
end
go