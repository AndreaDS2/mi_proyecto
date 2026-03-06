# Pasos para que el Flutter doctor quedara en verde, versión Windows

## Paso 1

- Descargar **Git** (es un sistema de control de versiones esencial que permite gestionar, rastrear y guardar los cambios en el código fuente de las aplicaciones móviles (desarrolladas con Dart) - Flutter lo necesita para descargar archivos)
- Ir a la página git-scm.com
- Descargar el instalador para Windows
- Ejecutar el archivo y darle **Next** a todo.
- Configurar la identidad  
  - Abrir PowerShell y escribir:
    ```bash
    git config --global user.name "Nombre"
    git config --global user.email "correo@ejemplo.com"
    ```

## Paso 2

- Descargar **Android Studio** (es el entorno de desarrollo integrado (IDE) oficial de Google para crear aplicaciones Android)
- Ir a developer.android.com
- Descargar e instalar
- **Importante**: Al abrirlo por primera vez, saldrá un "Setup Wizard". Elegir la instalación "Standard". Esto instalará automáticamente el Android SDK, las Platform Tools y el Emulador.
- Configurar el SDK  
  - Una vez dentro de Android Studio: buscar SDK Manager (normalmente está en Setting o en la pantalla de bienvenida projects, More Actions)
  - Ir a la pestaña SDK Plataforms, marcar Android 13.0 (Tiramisu), esta es la API 33+ que se está requiriendo
  - Ir a la pestaña SDK Tools para asegurarse que estén marcadas las siguientes opciones:
    - Android SDK Command-line Tools (latest)
    - Android SDK Build-Tools
    - Android Emulator
  - Darle Apply para descargar todo

## Paso 3

- Crear **Emulador** (Teléfono Virtual) en Android Studio es esencial para probar aplicaciones sin usar un teléfono físico
- Buscar Device Manager (Suele estar en More Actions, Virtual Device Manager)
- Dar clic en Create Device
- Elegir teléfono según su pc:
  - Pixel 7 o Pixel 8: Son los más estándar, tienen buen rendimiento y reflejan las características de Android moderno.
  - Pixel 6 o 6a: Buenas opciones equilibradas si tu ordenador no es extremadamente potente.
  - Nexus 5X: Es una opción muy ligera si tu PC tiene poca RAM (menos de 16GB). 
- En System Image elegir Pie (API 33) de la columna x86_64 (si tu Pc es Intel/AMD)
- Finalizar
- Acelerar el emulador (para que no vaya lento)
  - Pulsar la tecla Windows y escribir: Activar o desactivar las características de Windows
  - En la lista marcar las casillas: Plataforma del hipervisor de Windows y Plataforma de máquina virtual.
  - Aceptar y reiniciar el ordenador.

## Paso 4

- Instalar **Flutter** con **FVM**  
- Activar **FVM**:
  - Abrir el PowerShell de Windows (clic derecho en el botón de inicio, Terminal o PowerShell) **importante**: Ejecutar como administrador.
  - Escribir el comando:  
    ```bash
    dart pub global activate fvm
    ```  
    (Si dice que 'dart' no se reconoce, es porque Android Studio todavía no se ha "registrado" en el sistema. Reinicie el PC y pruebe de nuevo).

### ERRORES

- “Dart” no se reconoce: Significa que aún no ha añadido la ruta de Flutter al sistema.

1. Localizar carpeta de Flutter/Dart, si se instaló Android Studio con las opciones estándar, la ruta debería ser algo similar:  
   `C:\Users\(Usuario)\AppData\Local\Android\Sdk\flutter\bin`
   ```powershell
   $env:Path += ';' + $env:USERPROFILE '\AppData\Local\Android\Sdk\flutter\bin'
   $env:Path += ';' + $env:USERPROFILE + '\.pub-cache\bin'

*Después de eso volver a escribir el comando:
dart pub global activate fvm

2.   Si el error persiste es porque **Android Studio** instala las herramientas para Android, pero **NO** incluye el SDK de Flutter/Dart por defecto.

* Descargar **Flutter** manualmente
* Ir a docs.flutter.dev/install/archive, descargar Flutter 3.27.3 Stable
* Crear una carpeta en el Disco Local C: llamada src
* Descomprimir y mover o arrastrar la carpeta llamada flutter a C:\src, con esto la ruta final es C:\src\flutter
*Configurar las **Variables de Entorno** en el Path.
En el buscador de Windows, escriba Variables de entorno y seleccione “Editar las variables de entorno del sistema”
*Clic en el botón inferior que dice Variables de entorno
*Buscar en la lista de arriba (Variables del entorno) Path y doble clic
*En la ventana que se abrió, darle en Nuevo y escribir exactamente C:\src\flutter\bin, si no llegara a funcionar y aun no reconoce el FVM, eliminar la ruta anterior y colocar: C:\Users\(su usuario)\fvm\default\bin
*Aceptar a todas las ventanas.

**Importante**: Hay que cerrar el PowerShell y volverlo a abrir para que reconozca los cambios.

    *En el PowerShell volver a escribir el comando:
dart pub global activate fvm

3. "**truco**" de permisos si sale el error 1314.

Activar **Modo Desarrollador**: Antes de usar FVM, ir a Configuración de Windows → Privacidad y seguridad → Para desarrolladores y activar el Modo de desarrollador. Esto permite que FVM cree los enlaces simbólicos necesarios sin errores de permisos.

 Ahora añadir FVM al Path, en PowerShell:
- Configurar la ruta: 
$env:Path += ';' + $env:USERPROFILE + '\AppData\Local\Pub\Cache\bin'

- Para configurar el Path definitivamente y no salga un aviso amarillo diciendo que FVM no está en el Path:
1. Ir a variables de entorno en Windows y entrar en “Editar variables de entorno del sistema”
2. Clic en Variables de entorno
3. En variables de usuario buscar Path y hacer doble clic
4. Darle **Nuevo** y pegar la ruta: %USERPROFILE%\AppData\Local\Pub\Cache\bin
5. Aceptar y reiniciar el PowerShell

 Instalar la versión **Flutter 3.27.3**, escribir el comando:
Fvm install 3.27.3.

 Verificar que todo está listo, comando:
fvm flutter doctor (se deben ver todos los checks en verde).

**ERROR**  
Si sale este símbolo [!] en Android Java, es porque Flutter necesita Java para construir Apps, pero no lo encuentra en el sistema.

1. Configurar la variable de entorno **JAVA_HOME**  
* Buscador de Windows → Variables de entorno → lista de abajo (Variables de sistema) → Nuevo
* Nombre de la Variable: JAVA_HOME
* Valor de la Variable: C:\Program Files\Android\Android Studio\jbr

2. En la misma lista de abajo (Variables del sistema), en la que se llama Path, doble clic → Nuevo → %JAVA_HOME%\bin  
Aceptar en todas las ventanas.

2. Comando para PowerShell:
fvm flutter config --android-studio-dir "C:\Program Files\Android\Android Studio"

 Autorizar las licencias de Android
Fvm flutter doctor –android-licenses (**Importante**: cuando pregunte si acepta (y/n), colocar **y** y pulsar Enter todas las veces que pregunte hasta que termine).

## Paso 5: 
 Configurar el Editor (**VS Code**)

- Descargar VS Code: Ir a code.visualstudio.com y descargar el instalador para Windows. 

- Instalar: ejecutar y seguir los pasos (asegurarse de marcar la casilla "Agregar al PATH"). 

- Extensiones de Flutter: Una vez instalado, abrir VS Code y pulsar el icono de Extensiones (o Ctrl+Shift+X).
Buscar e instalar la extensión llamada "Flutter" (la oficial de Dart Code). Esto habilitará el soporte para el lenguaje Dart automáticamente. 

**Vínculo con FVM**: Gracias a la configuración del PATH realizada en el Paso 4, VS Code detectará automáticamente el SDK de Flutter gestionado por FVM. No requiere configuración manual adicional en archivos JSON.

## Comandos de Supervivencia

| Comando             | Para qué sirve                                           |
|--------------------|-----------------------------------------------------------|
| fvm flutter doctor  | Ver el estado de salud del entorno                        |
| fvm flutter devices | Ver si el Redmi o el Emulador están conectados           |
| fvm use 3.27.3      | Decirle a la carpeta del proyecto qué Flutter usar       |
| fvm flutter run     | Lanzar la aplicación al teléfono                          |

**Importante**: En dispositivos Redmi, además de la Depuración USB, hay que activar la opción "Instalar vía USB" en las opciones de desarrollador del móvil para que Flutter pueda cargar la app.