USE EmpresaDB;
GO

CREATE PROCEDURE sp_RegistrarAuditoriaYActualizarInventario
    @VentaID INT,
    @Producto VARCHAR(100),
    @Cantidad INT
AS
BEGIN
    SET NOCOUNT ON;
    
    INSERT INTO AuditoriaVentas (VentaID, Mensaje)
    VALUES (@VentaID, 'Venta registrada y descontada del inventario');

    UPDATE Inventario
    SET Existencias = Existencias - @Cantidad
    WHERE Producto = @Producto;
END;
GO
