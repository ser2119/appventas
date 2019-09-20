alter procedure sp_anular_ingreso
@p_id int
as
begin
	update	t07_ingreso
	set	f07_estado = 'Anulado'
	where	f07_id = @p_id
end
go