alter procedure sp_anular_ingreso
@v_id int
as
begin
	update	t07_ingreso
	set	f07_estado = 'Anulado'
	where	f07_id = @v_id
end
go