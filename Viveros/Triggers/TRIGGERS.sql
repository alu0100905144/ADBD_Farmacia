CREATE FUNCTION vender_producto() RETURNS trigger AS $vender_producto$
    DECLARE
    	stock_	INTEGER;

    BEGIN
	-- Comprobar el stock
		SELECT stock INTO stock_ FROM producto WHERE codigo=NEW.codigo;

        IF stock_ < NEW.cantidad THEN
            RAISE EXCEPTION 'Sólo hay % unidades en stock', stock_;
        END IF;

        -- Poner el timestamp
		NEW.fecha = current_timestamp;
		
        RETURN NEW;
    END;
$vender_producto$ LANGUAGE plpgsql;

CREATE TRIGGER vender_producto BEFORE INSERT ON cliente_producto
    FOR EACH ROW EXECUTE PROCEDURE vender_producto();

____________________________________

CREATE OR REPLACE FUNCTION actualizar_stock() RETURNS trigger AS $actualizar_stock$
    BEGIN
		
        UPDATE producto
		SET stock = stock - NEW.cantidad
		WHERE codigo = NEW.codigo;

		RETURN NEW;
    END;
$actualizar_stock$ LANGUAGE plpgsql;

CREATE TRIGGER actualizar_stock AFTER INSERT ON cliente_producto
    FOR EACH ROW EXECUTE PROCEDURE actualizar_stock();











