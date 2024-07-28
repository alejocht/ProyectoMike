use Fundas_Mike

create or alter procedure ListarFamilias (@SoloActivos bit = 0)
as
begin
	if(@SoloActivos = 1)
	begin
		select * from Familias WHERE Estado = 1
	end
	else
	begin
		select * from Familias
	end
end

create or alter procedure ListarFamilia (@ID bigint = 0)
as
begin
		select * from Familias where ID = @ID
end

create or alter procedure AgregarFamilia (@NOMBRE varchar(150))
as
begin
	begin try
		begin transaction
			insert into Familias(NOMBRE) values (@NOMBRE)
		commit transaction
	end try
	begin catch
		rollback transaction
	end catch
end

create or alter procedure ModificarFamilia (@ID bigint, @NOMBRE varchar(150), @Estado bit)
as
begin
	begin try
		begin transaction
			update Familias set NOMBRE = @NOMBRE, Estado = @Estado where ID = @ID
		commit transaction
	end try
	begin catch
		rollback transaction
	end catch
end