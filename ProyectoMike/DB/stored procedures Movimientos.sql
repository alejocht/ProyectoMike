use Fundas_Mike

create or alter procedure ListarMovimientos
as
begin
		select * from Movimientos
end

create or alter procedure ListarMovimiento (@ID bigint = 0)
as
begin
		select * from Movimientos where ID = @ID
end

create or alter procedure AgregarMovimiento (@ID_USUARIO bigint, @FECHA date, @ID_FUNDA bigint, @ID_BOLSA bigint, @ID_FILA bigint, @CANTIDAD bigint)
as
begin
	begin try
		begin transaction
			declare @STOCK_GENERAL bigint
			select @STOCK_GENERAL = STOCK from Fundas where ID = @ID_FUNDA
			declare @STOCK_EN_FILA bigint
			select @STOCK_EN_FILA = CANTIDAD from Fundas_X_Fila where ID_FILA = @ID_FILA and ID_FUNDA = @ID_FUNDA

			if((@STOCK_GENERAL is null or @STOCK_GENERAL = 0) and @CANTIDAD < 0)
			begin
				raiserror('cantidad de stock general no permite negativos',16,0)
				return
			end
			if((@STOCK_EN_FILA is null or @STOCK_EN_FILA = 0) and @CANTIDAD < 0)
			begin
				raiserror('cantidad de stock en fila no permite negativos',16,0)
				return
			end

			insert into Movimientos(ID_USUARIO, FECHA, ID_FUNDA, ID_BOLSA, ID_FILA, CANTIDAD) values (@ID_USUARIO , @FECHA, @ID_FUNDA, @ID_BOLSA, @ID_FILA, @CANTIDAD)

			declare @NUEVO_STOCK_EN_FILA bigint
			select @NUEVO_STOCK_EN_FILA = CANTIDAD from Fundas_X_Fila where ID_FILA = @ID_FILA and ID_FUNDA = @ID_FUNDA
			set @NUEVO_STOCK_EN_FILA = @NUEVO_STOCK_EN_FILA + @CANTIDAD

			declare @NUEVO_STOCK bigint
			select @NUEVO_STOCK = STOCK from Fundas where ID = @ID_FUNDA
			set @NUEVO_STOCK = @NUEVO_STOCK + @CANTIDAD

			update Fundas set STOCK = @NUEVO_STOCK where ID = @ID_FUNDA
			update Fundas_X_Fila set CANTIDAD = @NUEVO_STOCK_EN_FILA where ID_FUNDA = @ID_FUNDA
		commit transaction
	end try
	begin catch
		rollback transaction
	end catch
end

create or alter procedure ModificarMovimiento (@ID bigint, @ID_USUARIO bigint, @FECHA date, @ID_FUNDA bigint, @ID_BOLSA bigint, @ID_FILA bigint, @CANTIDAD bigint)
as
begin
	begin try
		begin transaction
			declare @STOCK_GENERAL bigint
			select @STOCK_GENERAL = STOCK from Fundas where ID = @ID_FUNDA
			declare @STOCK_EN_FILA bigint
			select @STOCK_EN_FILA = CANTIDAD from Fundas_X_Fila where ID_FILA = @ID_FILA and ID_FUNDA = @ID_FUNDA

			if((@STOCK_GENERAL is null or @STOCK_GENERAL = 0) and @CANTIDAD < 0)
			begin
				raiserror('cantidad de stock general no permite negativos',16,0)
				return
			end
			if((@STOCK_EN_FILA is null or @STOCK_EN_FILA = 0) and @CANTIDAD < 0)
			begin
				raiserror('cantidad de stock en fila no permite negativos',16,0)
				return
			end

			update Movimientos set ID_USUARIO = @ID_USUARIO, FECHA = @FECHA, ID_FUNDA = @ID_FUNDA, ID_BOLSA = @ID_BOLSA, ID_FILA = @ID_FILA, CANTIDAD = @CANTIDAD where ID = @ID

			declare @NUEVO_STOCK_EN_FILA bigint
			select @NUEVO_STOCK_EN_FILA = CANTIDAD from Fundas_X_Fila where ID_FILA = @ID_FILA and ID_FUNDA = @ID_FUNDA
			set @NUEVO_STOCK_EN_FILA = @NUEVO_STOCK_EN_FILA + @CANTIDAD

			declare @NUEVO_STOCK bigint
			select @NUEVO_STOCK = STOCK from Fundas where ID = @ID_FUNDA
			set @NUEVO_STOCK = @NUEVO_STOCK + @CANTIDAD

			update Fundas set STOCK = @NUEVO_STOCK where ID = @ID_FUNDA
			update Fundas_X_Fila set CANTIDAD = @NUEVO_STOCK_EN_FILA where ID_FUNDA = @ID_FUNDA
			
		commit transaction
	end try
	begin catch
		rollback transaction
	end catch
end