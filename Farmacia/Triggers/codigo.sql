CREATE FUNCTION calcular_importe() RETURNS trigger AS $calcular_importe$
    DECLARE
    	precio_	INTEGER;

    BEGIN
	-- Comprobar precio
	SELECT precio INTO precio_ FROM medicamento WHERE codigo_med=NEW.codigo_med;
	NEW.importe = NEW.cantidad * precio_;
		
        RETURN NEW;
    END;
$calcular_importe$ LANGUAGE plpgsql;

CREATE TRIGGER calcular_importe BEFORE INSERT ON cliente_conv_compra
FOR EACH ROW EXECUTE PROCEDURE calcular_importe();

CREATE TRIGGER calcular_importe BEFORE INSERT ON cliente_cred_compra
FOR EACH ROW EXECUTE PROCEDURE calcular_importe();

___________________________________________________________

CREATE OR REPLACE FUNCTION actualizar_unidades_vendidas() RETURNS trigger AS $actualizar_unidades_vendidas$
    BEGIN
	UPDATE medicamento
		-- Actualiazar unidades vendidas
		SET ud_vendidas = ud_vendidas + NEW.cantidad
		WHERE codigo_med = NEW.codigo_med;
	UPDATE medicamento
		-- Actualiazar unidades vendidas
		SET ud_stock = ud_stock - NEW.cantidad
		WHERE codigo_med = NEW.codigo_med;
	
        RETURN NEW;
    END;
$actualizar_unidades_vendidas$ LANGUAGE plpgsql;

CREATE TRIGGER actualizar_unidades_vendidas AFTER INSERT ON cliente_conv_compra
FOR EACH ROW EXECUTE PROCEDURE actualizar_unidades_vendidas();
