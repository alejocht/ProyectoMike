use Fundas_Mike

create or alter procedure ListarFundas (@SoloActivos bit = 0)
as
begin
	if(@SoloActivos = 1)
	begin
		select * from Fundas WHERE Estado = 1
	end
	else
	begin
		select * from Fundas
	end
end

create or alter procedure ListarFunda (@ID bigint = 0)
as
begin
		select * from Fundas where ID = @ID
end

create or alter procedure AgregarFunda (@NOMBRE varchar(300), @CODIGO varchar(300), @ID_COLOR bigint, @ID_FAMILIA bigint, @ID_MODELO bigint, @STOCK bigint)
as
begin
	begin try
		begin transaction
			insert into Fundas(NOMBRE, CODIGO, ID_COLOR, ID_FAMILIA, ID_MODELO, STOCK) values (@NOMBRE, @CODIGO, @ID_COLOR, @ID_FAMILIA, @ID_MODELO, @STOCK)
		commit transaction
	end try
	begin catch
		rollback transaction
	end catch
end

create or alter procedure ModificarFunda (@ID bigint, @NOMBRE varchar(300), @CODIGO varchar(300), @ID_COLOR bigint, @ID_FAMILIA bigint, @ID_MODELO bigint, @STOCK bigint, @Estado bit)
as
begin
	begin try
		begin transaction
			update Fundas set NOMBRE = @NOMBRE, CODIGO = @CODIGO, ID_COLOR = @ID_COLOR, ID_FAMILIA = @ID_FAMILIA, ID_MODELO = @ID_MODELO, STOCK = @STOCK, Estado = @Estado where ID = @ID
		commit transaction
	end try
	begin catch
		rollback transaction
	end catch
end