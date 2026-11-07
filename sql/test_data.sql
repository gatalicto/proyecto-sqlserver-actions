USE EmpresaDB;
GO

-- 1. Surtir inventario inicial
INSERT INTO Inventario (Producto, Existencias) VALUES ('Laptop', 50);
INSERT INTO Inventario (Producto, Existencias) VALUES ('Monitor', 100);
GO

-- 2. Registrar ventas (el trigger detectará esto automáticamente)
INSERT INTO Ventas(Producto, Cantidad) VALUES ('Laptop', 3);
INSERT INTO Ventas(Producto, Cantidad) VALUES ('Monitor', 5);
GO
