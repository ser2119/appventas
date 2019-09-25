	-- Creacion tablas para Proyecto con C# 
	DROP TABLE t10_detalle_venta;
	DROP TABLE t09_venta;
	DROP TABLE t08_detalle_ingreso;
	DROP TABLE t06_articulo;
	DROP TABLE t07_ingreso;
	DROP TABLE t01_categoria;
	DROP TABLE t02_presentacion;
	DROP TABLE t03_cliente;
	DROP TABLE t04_trabajador;
	DROP TABLE t05_proveedor;
	

	create table t01_categoria(
	f01_id INT PRIMARY KEY IDENTITY(1,1),
	f01_nombre VARCHAR(50) NOT NULL,
	f01_descripcion VARCHAR(256)
	);

	create table t02_presentacion(
	f02_id INT PRIMARY KEY IDENTITY(1,1),
	f02_nombre VARCHAR(50) NOT NULL,
	f02_descripcion VARCHAR(256)
	);

	create table t03_cliente(
	f03_id INT PRIMARY KEY IDENTITY(1,1),
	f03_nombre VARCHAR(20) NOT NULL,
	f03_apellidos VARCHAR(40),
	f03_sexo VARCHAR(1),
	f03_fecha_nacimiento DATE NOT NULL,
	f03_tipo_documento VARCHAR(20) NOT NULL,
	f03_num_documento VARCHAR(8) NOT NULL,
	f03_direccion VARCHAR(100),
	f03_telefono VARCHAR(10),
	f03_email VARCHAR(50)
	);

	create table t04_trabajador(
	f04_id INT PRIMARY KEY IDENTITY(1,1),
	f04_nombre VARCHAR(20) NOT NULL,
	f04_apellidos VARCHAR(40),
	f04_sexo VARCHAR(1) NOT NULL,
	f04_fecha_nacimiento DATE NOT NULL,
	f04_tipo_documento VARCHAR(20) NOT NULL,
	f04_num_documento VARCHAR(8) NOT NULL,
	f04_direccion VARCHAR(100),
	f04_telefono VARCHAR(10),
	f04_email VARCHAR(50) NOT NULL,
	f04_acceso VARCHAR(20) NOT NULL,
	f04_usuario VARCHAR(20) NOT NULL,
	f04_password VARCHAR(20) NOT NULL
	);

	create table t05_proveedor(
	f05_id INT PRIMARY KEY IDENTITY(1,1),
	f05_razon_social VARCHAR(150) NOT NULL,
	f05_sector_comercial VARCHAR(50) NOT NULL,
	f05_tipo_documento VARCHAR(20) NOT NULL,
	f05_num_documento VARCHAR(11) NOT NULL,
	f05_direccion VARCHAR(100),
	f05_telefono VARCHAR(50),
	f05_email VARCHAR(50),
	f05_url VARCHAR(100)
	);

	create table t06_articulo(
	f06_id INT PRIMARY KEY IDENTITY(1,1),
	f06_codigo VARCHAR(50) NOT NULL,
	f06_nombre VARCHAR(50) NOT NULL,
	f06_descripcion VARCHAR(MAX) NOT NULL,
	f06_imagen IMAGE,
	f06_id_categoria INT NOT NULL FOREIGN KEY (f06_id_categoria) REFERENCES t01_categoria(f01_id),
	f06_id_presentacion INT NOT NULL FOREIGN KEY (f06_id_presentacion) REFERENCES t02_presentacion(f02_id)
	);

	create table t07_ingreso(
	f07_id INT PRIMARY KEY IDENTITY(1,1),
	f07_id_trabajador INT NOT NULL FOREIGN KEY (f07_id_trabajador) REFERENCES t04_trabajador(f04_id),
	f07_id_proveedor INT NOT NULL FOREIGN KEY (f07_id_proveedor) REFERENCES t05_proveedor(f05_id),
	f07_fecha DATE NOT NULL,
	f07_tipo_comprobante VARCHAR(20) NOT NULL,
	f07_serie VARCHAR(4) NOT NULL,
	f07_correlativo VARCHAR(7) NOT NULL,
	f07_igv DECIMAL(4,2) NOT NULL,
	f07_estado VARCHAR(50)
	);
	
	create table t08_detalle_ingreso(
	f08_id INT PRIMARY KEY IDENTITY(1,1),
	f08_id_ingreso INT NOT NULL FOREIGN KEY (f08_id_ingreso) REFERENCES t07_ingreso(f07_id),
	f08_id_articulo INT NOT NULL FOREIGN KEY (f08_id_articulo) REFERENCES t06_articulo(f06_id),
	f08_precio_compra MONEY NOT NULL,
	f08_precio_venta MONEY NOT NULL,
	f08_stock_inicial INT NOT NULL,
	f08_stock_actual INT NOT NULL,
	f08_fecha_produccion DATE NOT NULL,
	f08_fecha_vencimiento DATE NOT NULL
	);
	
	create table t09_venta(
	f09_id INT PRIMARY KEY IDENTITY(1,1),
	f09_id_cliente INT NOT NULL FOREIGN KEY (f09_id_cliente) REFERENCES t03_cliente(f03_id),
	f09_id_trabajador INT NOT NULL FOREIGN KEY (f09_id_trabajador) REFERENCES t04_trabajador(f04_id),
	f09_fecha DATE NOT NULL,
	f09_tipo_comprobante VARCHAR(20) NOT NULL,
	f09_serie VARCHAR(4) NOT NULL,
	f09_correlativo VARCHAR(7) NOT NULL,
	f09_igv DECIMAL(4,2)
	);
	
	create table t10_detalle_venta(
	f10_id INT PRIMARY KEY IDENTITY(1,1),
	f10_id_venta INT NOT NULL FOREIGN KEY (f10_id_venta) REFERENCES t09_venta(f09_id),
	f10_id_detalle_ingreso INT NOT NULL FOREIGN KEY (f10_id_detalle_ingreso) REFERENCES t08_detalle_ingreso(f08_id),
	f10_cantidad INT NOT NULL,
	f10_precio_venta MONEY NOT NULL,
	f10_descuento INT NOT NULL
	);