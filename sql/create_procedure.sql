USE EmpresaDB;
GO

CREATE PROCEDURE sp_RegistrarAuditoria
    @VentaID INT
AS
BEGIN
    INSERT INTO AuditoriaVentas(VentaID, Mensaje)
    VALUES(@VentaID, 'Venta registrada automáticamente');
END;
GO
