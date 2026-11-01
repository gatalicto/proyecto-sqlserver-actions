USE EmpresaDB;
GO
    
IF OBJECT_ID ('trg_AuditarVenta', 'TR') IS NOT NULL
    DROP TRIGGER trg_AuditarVenta;
GO
    
CREATE TRIGGER trg_AuditarVenta
ON Ventas
AFTER INSERT
AS
BEGIN
    INSERT INTO AuditoriaVentas (VentaID, Mensaje)
    SELECT VentaID, 'Venta registrada masivamente de forma exitosa'
    FROM inserted;
END;
GO
