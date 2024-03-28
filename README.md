# Personal Finances

## MVP
El MVP de debe de contar con 3 cosas:
1. CRUD cuentas.
2. CRUD categorias.
3. Calculadora.
4. Visualizacion de los ingresos y egresos.

## 1 - Iteración

### Agregar las dependencias necesarias

Las siguientes dependencias fueron agregadas al ``pubspec.yaml``

```yaml
    flutter_card_swiper: 7.0.0
    bloc: 8.1.4
    flutter_bloc: 8.1.5
    equatable: 2.0.5
    get_it: 7.6.7
    firebase_core: 2.27.2
    cloud_firestore: 4.15.10
    go_router: 13.2.1
    path_provider: 2.1.2
    hydrated_bloc: 9.1.5
    fl_chart: 0.66.2
```
### Registro de la cuenta que se quiere realizar en tracking de ingresos y egresos

1. Formulario donde el usuario pueda ingresar el monto que tiene en la cuenta.
    - Crear la entitdad Account con los siguientes datos: balance(double) y currency(string).
    - El formulario debe de contar con un input.
    - Sólo debe permitir ingresar números hasta dos digitos decimales.
    - El formulario debe de contar con un botón de continuar y este debe de redirigir al usuario al home.
2. Opción de agregar más cuentas.
    - El usuario tendra un botón en la parte superior derecha para agregar una nueva cuenta.
    - El botón debe de redirigir al formulario de registro de cuenta.
3. Las tarjetas(cuentas) deben de mostrarse en el home.
    - Las tarjetas(cuentas) deben de estar apiladas.
    - Se debe de poder hacer swipe tanto a la derecha como a la izquierda, cambiando de cueta.