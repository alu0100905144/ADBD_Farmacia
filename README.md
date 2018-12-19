# Diseño e implementación: Farmacias


Diseño e implementación para la base de datos de la Farmacia porpuesta.

## Modelo conceptual
![ModeloConceptual](farmacia_modeloconceptual.png?raw=true)

## Modelo lógico
![ModeloLogico](farmacia_modelologico.png?raw=true)

## Pruebas realizadas

Prueba: Inserción
![InsertIntoExample](/Pruebas/prueba_insert.png?raw=true)

Prueba: Provocando un error al insertar
![InsertIntoErrorExample](/Pruebas/prueba_error_insert.png?raw=true)

Prueba: Borrado en cascada
![DeleteOnCascadeExample](/Pruebas/prueba_delete_on_cascade.png?raw=true)

## Trigger
Cada vez que un cliente convencional o de crédito realiza una compra, el trigger actualiza las unidades del medicamento vendidas y actualiza el stock para ese mismo medicamento.
![ejecucion_trigger](/Triggers/ejecucion_trigger.png?raw=true)
