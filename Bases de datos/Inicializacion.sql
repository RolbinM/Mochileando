USE AplicacionHoteleraWeb


-- Eliminacion de los datos actuales dentro de la base
DELETE FROM Reservacion
DBCC CHECKIDENT(Reservacion,RESEED,0)

DELETE FROM Hospedaje
DBCC CHECKIDENT(Hospedaje,RESEED,0)

DELETE FROM Bitacora
DBCC CHECKIDENT(Bitacora,RESEED,0)

DELETE FROM Cliente
DELETE FROM Hotel
DELETE FROM Administrador

DELETE FROM Usuario
DBCC CHECKIDENT(Usuario,RESEED,0)

DELETE FROM TipoUsuario
DBCC CHECKIDENT(TipoUsuario,RESEED,0)

-- Insercion de los tipos de usuario que se encuentran en la base
INSERT INTO TipoUsuario VALUES ('Administrador')
INSERT INTO TipoUsuario VALUES ('Hotel')
INSERT INTO TipoUsuario VALUES ('Cliente')


-- Insercion de un administrador a la base de datos
EXEC sp_InsertarAdministrador 'Pepe Aguilar', 'pepe', 'pepe'


