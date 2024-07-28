use Fundas_Mike

create or alter procedure ListarColoresDeTelas(@SoloActivos bit = 0)
as
begin
	if(@SoloActivos = 1)
	begin
		select * from ColoresDeTelas WHERE Estado = 1
	end
	else
	begin
		select * from ColoresDeTelas
	end
end

create or alter procedure ListarColorDeTela (@ID bigint = 0)
as
begin
		select * from ColoresDeTelas where ID = @ID
end

create or alter procedure AgregarColorDeTela (@NOMBRE varchar(150))
as
begin
	begin try
		begin transaction
			insert into ColoresDeTelas(NOMBRE) values (@NOMBRE)
		commit transaction
	end try
	begin catch
		rollback transaction
	end catch
end

create or alter procedure ModificarColorDeTela (@ID bigint, @NOMBRE varchar(150), @Estado bit)
as
begin
	begin try
		begin transaction
			update ColoresDeTelas set NOMBRE = @NOMBRE, Estado = @Estado where ID = @ID
		commit transaction
	end try
	begin catch
		rollback transaction
	end catch
end