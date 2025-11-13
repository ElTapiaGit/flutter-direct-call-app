📞 Aplicación de Llamada Rápida (Flutter)

Este es un proyecto de Flutter simple diseñado para un propósito específico: abrir y llamar inmediatamente a un número de teléfono predefinido.

La aplicación sirve como un "acceso directo" en el teléfono. Al hacer clic en el ícono de la app (personalizado con la foto del contacto), la aplicación se lanza, solicita permisos (si es necesario) e inicia la llamada directa sin pasos intermedios.

✨ Características

Llamada Automática: Inicia la llamada telefónica en cuanto se abre la aplicación.

Gestión de Permisos: Utiliza permission_handler para solicitar el permiso CALL_PHONE en Android.

Llamada Directa: Utiliza flutter_phone_direct_caller para realizar la llamada sin necesidad de abrir el marcador manual.

Interfaz Simple: Muestra la foto del contacto y el estado de la llamada.

Icono Personalizado: Utiliza flutter_launcher_icons para establecer el icono de la app (la foto del contacto).

🚀 Instalación y Configuración

Sigue estos pasos para compilar y ejecutar el proyecto localmente.

1. Prerrequisitos

Tener el SDK de Flutter instalado.

Un dispositivo físico Android (los simuladores no pueden realizar llamadas).

2. Clonar el Repositorio

git clone [https://github.com/TU_USUARIO/flutter-direct-call-app.git](https://github.com/TU_USUARIO/flutter-direct-call-app.git)
cd flutter-direct-call-app


3. Configuración del Proyecto

a. Instalar Dependencias

flutter pub get


b. Configurar el Número de Teléfono (¡IMPORTANTE!)

Por razones de seguridad, el número de teléfono no se guarda en el repositorio.

Ve a la carpeta lib/.

Copia el archivo config.example.dart y renómbralo a config.dart.

Abre config.dart y reemplaza el valor de kDefaultPhoneNumber con el número real al que deseas llamar.

// lib/config.dart
const String kDefaultPhoneNumber = '72224615'; // <--- Pon tu número aquí


c. Configurar Icono y Foto de Perfil

Reemplaza la imagen en assets/perfil.png con la foto de tu contacto (preferiblemente 512x512 o 1024x1024).

Para generar los iconos de la app, ejecuta:

dart run flutter_launcher_icons


d. Configuración Nativa (Android)

Asegúrate de que el permiso de llamada esté en tu manifiesto de Android:
android/app/src/main/AndroidManifest.xml

<manifest ...>
    <!-- Este permiso es obligatorio -->
    <uses-permission android:name="android.permission.CALL_PHONE"/>
    <application ...>
    ...
    </application>
</manifest>


4. Ejecutar la Aplicación

flutter run


🛠️ Stack Tecnológico

Framework: Flutter 3.x

Lenguaje: Dart

Dependencias Clave:

permission_handler: Para solicitar permisos nativos.

flutter_phone_direct_caller: Para la llamada directa.

flutter_launcher_icons: Para la generación del icono de la app.