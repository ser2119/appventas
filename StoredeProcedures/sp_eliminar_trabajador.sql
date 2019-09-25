alter procedure sp_eliminar_trabajador
@p_id int
as
begin
delete from t04_trabajador
where f04_id = @p_id
end
go