use Fundas_Mike

create or alter procedure ListarFilasEnBolsas
as
begin
		select * from FilasEnBolsas
end

create or alter procedure ListarFilasEnBolsa (@ID_BOLSA bigint = 0)
as
begin
		select * from FilasEnBolsas where ID_BOLSA = @ID_BOLSA
end

create or alter procedure AgregarFilaEnBolsa (@ID_BOLSA bigint,@NOMBRE varchar(150))
as
begin
	begin try
		begin transaction
			insert into FilasEnBolsas(ID_BOLSA, NOMBRE) values (@ID_BOLSA , @NOMBRE)
		commit transaction
	end try
	begin catch
		rollback transaction
	end catch
end

create or alter procedure ModificarFilaEnBolsa (@ID bigint, @ID_BOLSA bigint, @NOMBRE varchar(150))
as
begin
	begin try
		begin transaction
			update FilasEnBolsas set NOMBRE = @NOMBRE, ID_BOLSA = @ID_BOLSA where ID = @ID
		commit transaction
	end try
	begin catch
		rollback transaction
	end catch
end