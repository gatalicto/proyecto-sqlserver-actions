USE EmpresaDB;
GO

CREATE TRIGGER trg_AuditarVenta
ON Ventas
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @VentaID INT, @Producto VARCHAR(100), @Cantidad INT;

    DECLARE cur_Ventas CURSOR FOR
    SELECT VentaID, Producto, Cantidad FROM inserted;

    OPEN cur_Ventas;
    FETCH NEXT FROM cur_Ventas INTO @VentaID, @Producto, @Cantidad;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        EXEC sp_RegistrarAuditoriaYActualizarInventario @VentaID, @Producto, @Cantidad;
        FETCH NEXT FROM cur_Ventas INTO @VentaID, @Producto, @Cantidad;
    END

    CLOSE cur_Ventas;
    DEALLOCATE cur_Ventas;
END;
GO
