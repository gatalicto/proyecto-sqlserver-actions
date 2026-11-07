USE EmpresaDB;
GO

CREATE PROCEDURE sp_RegistrarAuditoria
    @VentaID INT,
    @Producto VARCHAR(100),
    @Cantidad INT
AS
BEGIN
    SET NOCOUNT ON;
    
    -- 1. Registrar Auditoría
    INSERT INTO AuditoriaVentas (VentaID, Mensaje)
    VALUES (@VentaID, 'Venta registrada y descontada del inventario');

    -- 2. Actualizar Inventario
    UPDATE Inventario
    SET Existencias = Existencias - @Cantidad
    WHERE Producto = @Producto;
END;
GO
