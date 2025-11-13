# 📞 One-Tap Call (Llamada Rápida Accesible)

> **Accesibilidad en un solo toque**
>
> One-Tap Call es una aplicación móvil desarrollada con Flutter, pensada para simplificar al máximo la acción de realizar una llamada telefónica. 
>
> Su objetivo es ofrecer una experiencia accesible, directa y sin distracciones, ideal para personas mayores o usuarios con dificultades para usar interfaces complejas.

---

## 📱 Descripción

**One-Tap Call** es una aplicación desarrollada en Flutter diseñada para la **accesibilidad extrema**. Su única función es realizar una llamada telefónica directa a un número preconfigurado inmediatamente después de abrirse.

Funciona como un "acceso directo inteligente" que gestiona los permisos de Android y la intención de llamada de forma transparente para el usuario.

## ✨ Características Principales

* **⚡ Llamada Instantánea:** La llamada se inicia automáticamente al abrir la app (en el evento `initState`).
* **👵 Diseño Senior-Friendly:** Elimina cualquier barrera de entrada; si pueden tocar un icono, pueden llamar.
* **🔒 Gestión de Permisos:** Detecta y solicita el permiso `CALL_PHONE` automáticamente si no está concedido.
* **🖼️ Icono Personalizado:** El icono de la app es la foto del contacto, facilitando el reconocimiento visual cognitivo.
* **📞 Integración Nativa:** Utiliza intents nativos de Android para "saltarse" el marcador numérico y llamar directo.

---

## 🛠️ Stack Tecnológico

| Tecnología | Herramienta / Librería | Propósito |
| :--- | :--- | :--- |
| **Framework** | ![Flutter](https://img.shields.io/badge/Flutter-02569B?style=flat&logo=flutter&logoColor=white) | Desarrollo multiplataforma. |
| **Lenguaje** | ![Dart](https://img.shields.io/badge/Dart-0175C2?style=flat&logo=dart&logoColor=white) | Lógica de la aplicación. |
| **Plugin** | `permission_handler` | Gestión de permisos de Android en tiempo de ejecución. |
| **Plugin** | `flutter_phone_direct_caller` | Ejecución de la llamada sin interfaz intermedia. |
| **Herramienta** | `flutter_launcher_icons` | Generación de iconos adaptativos (Android/iOS). |

---

## 🚀 Instalación y Configuración

Sigue estos pasos si deseas clonar y configurar este proyecto para tu propio familiar.

### 1. Prerrequisitos
* SDK de Flutter instalado (`v3.x`).
* Dispositivo físico Android (los emuladores **no** pueden realizar llamadas reales).

### 2. Clonar el Repositorio

    ```bash
    git clone [https://github.com/ElTapiaGit/flutter-direct-call-app.git](https://github.com/ElTapiaGit/flutter-direct-call-app.git)
    cd flutter-direct-call-app

### 3. Configuración de Seguridad (Paso Crítico ⚠️)
* Por seguridad, el número de teléfono no está incluido en el código público. Debes crear tu propio archivo de configuración.
* Navega a la carpeta lib/.
* Copia el archivo config.example.dart y renómbralo a config.dart.
* Edita el archivo y coloca el número real:
  
    ```bash
    // Archivo: lib/config.dart
    // Este archivo es ignorado por git para proteger tu privacidad

    const String kDefaultPhoneNumber = '1234567'; // <--- TU NÚMERO AQUÍ

### 4. Personalizar la Foto (Icono)
Para que la abuela reconozca a quién va a llamar:

* Reemplaza la imagen en assets/perfil.png con la foto del contacto (se recomienda cuadrada, min 512px).

* Genera los nuevos iconos ejecutando:

    ```bash
    flutter pub get
    dart run flutter_launcher_icons

### 5. Configuración Android
* Verifica que el permiso esté declarado en android/app/src/main/AndroidManifest.xml:

    ```bash
    <manifest ...>
        <uses-permission android:name="android.permission.CALL_PHONE"/>
        
        <application ...>
           ...
        </application>
    </manifest>

** ▶️ Ejecución
Conecta tu dispositivo por USB y ejecuta:

    ```bash
    flutter run
    