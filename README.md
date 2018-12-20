# Diseño e implementación

- Mireia Marta Scholz Díaz (alu0100905144@ull.edu.com)

Además de los triggers desarrollados en esta practica, en el repositorio se incluyen los __modelos conceptuales__, __modelos lógicos__, scripts sql generados con la herramienta *MySQL Workbench*, así como los __scripts postgresql__ equivalentes, para los casos __vivero__ y __farmacia__ propuestos.

## Farmacia 
### Modelo conceptual
![ModeloConceptual](Farmacia/farmacia_modeloconceptual.png?raw=true)

### Modelo lógico
![ModeloLogico](Farmacia/farmacia_modelologico.png?raw=true)

### Pruebas realizadas

Prueba: Inserción
![InsertIntoExample](Farmacia//Pruebas/prueba_insert.png?raw=true)

Prueba: Provocando un error al insertar
![InsertIntoErrorExample](Farmacia//Pruebas/prueba_error_insert.png?raw=true)

Prueba: Borrado en cascada
![DeleteOnCascadeExample](Farmacia//Pruebas/prueba_delete_on_cascade.png?raw=true)

### Trigger
Cada vez que un cliente convencional o de crédito realiza una compra, el trigger actualiza las unidades del medicamento vendidas y actualiza el stock para ese mismo medicamento.
![ejecucion_trigger](Farmacia//Triggers/ejecucion.png?raw=true)

## 2. Viveros
### Modelo conceptual
![mcvivero](/Viveros/Imagenes/modelo_conceptual.png?raw=true)
### Modelo lógico
![mlvivero](/Viveros/Imagenes/modelo_logico.png?raw=true)
### Triggers
(El código de los triggeres implementados se puede consultar en __/Viveros/Triggers__)  
Se han desarrollado 2 triggers que realmente deberían ser una única transacción:  
- El primero (__vender_producto__) comprueba que, antes de que un cliente compre un producto, haya stock suficiente. Además, añade la fecha y hora actual a la fila que se va a insertar (se insertará en la tabla cliente_producto).  
- El segundo (__actualizar_stock__) actualiza el stock (en la tabla producto) despues de que se haya registrado una compra (en cliente_producto)  
![ejecuciontriggervivero](/Viveros/Triggers/ejecucion.png?raw=true)
