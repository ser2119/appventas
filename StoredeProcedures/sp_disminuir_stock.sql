alter procedure sp_disminuir_stock
@p_id int,
@p_cantidad int

as

begin

update t08_detalle_ingreso
set f08_stock_actual = f08_stock_actual - @p_cantidad
where f08_id = @p_id
 
end