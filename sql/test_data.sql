USE EmpresaDB;
GO

INSERT INTO Inventario (Producto, Existencias) VALUES ('Laptop', 50);
INSERT INTO Inventario (Producto, Existencias) VALUES ('Monitor', 100);
GO

INSERT INTO Ventas(Producto, Cantidad) VALUES ('Laptop', 3);
INSERT INTO Ventas(Producto, Cantidad) VALUES ('Monitor', 5);
GO
