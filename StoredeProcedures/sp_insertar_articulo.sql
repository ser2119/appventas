alter procedure sp_insertar_articulo
@p_idarticulo int output,
@p_codigo varchar(50),
@p_nombre varchar(50),
@p_descripcion varchar(1024),
@p_imagen image,
@p_idcategoria int,
@p_idpresentacion int
as
begin
	insert into t06_articulo(f06_codigo,
						     f06_nombre,
							 f06_descripcion,
							 f06_imagen,
							 f06_id_categoria,
							 f06_id_presentacion)
				values (@p_codigo,
						@p_nombre,
						@p_descripcion,
						@p_imagen,
						@p_idcategoria,
						@p_idpresentacion)
end
go