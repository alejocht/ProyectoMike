use Fundas_Mike

alter table Bolsas
add Estado bit default 1

alter table Usuarios
add Estado bit default 1

alter table Familias
add Estado bit default 1

alter table Modelos
add Estado bit default 1

alter table Fundas
add Estado bit default 1

alter table ColoresDeTelas
add Estado bit default 1


create or alter procedure ListarBolsas (@SoloActivos bit = 0)
as
begin
	if(@SoloActivos = 1)
	begin
		select * from Bolsas WHERE Estado = 1
	end
	else
	begin
		select * from Bolsas
	end
end

create or alter procedure ListarBolsa (@ID bigint = 0)
as
begin
		select * from Bolsas where ID = @ID
end

create or alter procedure AgregarBolsa (@NOMBRE varchar(150))
as
begin
	begin try
		begin transaction
			insert into Bolsas (NOMBRE) values (@NOMBRE)
		commit transaction
	end try
	begin catch
		rollback transaction
	end catch
end

create or alter procedure ModificarBolsa (@ID bigint, @NOMBRE varchar(150), @Estado bit)
as
begin
	begin try
		begin transaction
			update Bolsas set NOMBRE = @NOMBRE, Estado = @Estado where ID = @ID
		commit transaction
	end try
	begin catch
		rollback transaction
	end catch
end