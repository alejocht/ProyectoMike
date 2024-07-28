use Fundas_Mike

create or alter procedure ListarUsuarios (@SoloActivos bit = 0)
as
begin
	if(@SoloActivos = 1)
	begin
		select * from Usuarios WHERE Estado = 1
	end
	else
	begin
		select * from Usuarios
	end
end

create or alter procedure ListarUsuario (@ID bigint = 0)
as
begin
		select * from Usuarios where ID = @ID
end

create or alter procedure AgregarUsuario (@NOMBRE varchar(150), @APELLIDO varchar(150), @USUARIO varchar(100), @CLAVE varchar(100))
as
begin
	begin try
		begin transaction
			insert into Usuarios(NOMBRE, APELLIDO, USUARIO, CLAVE) values (@NOMBRE, @APELLIDO, @USUARIO, @CLAVE)
		commit transaction
	end try
	begin catch
		rollback transaction
	end catch
end

create or alter procedure ModificarUsuario (@ID bigint, @NOMBRE varchar(150), @APELLIDO varchar(150), @USUARIO varchar(100), @CLAVE varchar(100), @Estado bit)
as
begin
	begin try
		begin transaction
			update Usuarios set NOMBRE = @NOMBRE, APELLIDO = @APELLIDO, USUARIO = @USUARIO, CLAVE = @CLAVE, Estado = @Estado where ID = @ID
		commit transaction
	end try
	begin catch
		rollback transaction
	end catch
end