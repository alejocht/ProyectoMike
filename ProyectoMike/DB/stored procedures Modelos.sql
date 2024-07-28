use Fundas_Mike

create or alter procedure ListarModelos (@SoloActivos bit = 0)
as
begin
	if(@SoloActivos = 1)
	begin
		select * from Modelos WHERE Estado = 1
	end
	else
	begin
		select * from Modelos
	end
end

create or alter procedure ListarModelo (@ID bigint = 0)
as
begin
		select * from Modelos where ID = @ID
end

create or alter procedure AgregarModelo (@NOMBRE varchar(150))
as
begin
	begin try
		begin transaction
			insert into Modelos(NOMBRE) values (@NOMBRE)
		commit transaction
	end try
	begin catch
		rollback transaction
	end catch
end

create or alter procedure ModificarModelo (@ID bigint, @NOMBRE varchar(150), @Estado bit)
as
begin
	begin try
		begin transaction
			update Modelos set NOMBRE = @NOMBRE, Estado = @Estado where ID = @ID
		commit transaction
	end try
	begin catch
		rollback transaction
	end catch
end