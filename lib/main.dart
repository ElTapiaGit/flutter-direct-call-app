import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/services.dart';
import 'config.dart';

void main() {
  // Inicialización obligatoria para plugins nativos
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Quitamos la etiqueta "Debug"
      title: 'Llamada Rapida',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const CallScreen(),
    );
  }
}

// Widget principal con estado
class CallScreen extends StatefulWidget {
  const CallScreen({super.key});

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  final String phoneNumber = kDefaultPhoneNumber; // numero telefonico

  String statusMessage = 'Iniciando sistema...';

  @override
  void initState() {
    super.initState();
    // llamda apenas se dibuje la pantalla
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _makeDirectCall();
    });
  }

  // Función para cerrar la app
  void _exitApp() {
    SystemNavigator.pop();
  }

  // logica llamada
  Future<void> _makeDirectCall() async {
    setState(() {
      statusMessage = 'Verificando permisos...';
    });

    // verificar permisos de telefono
    var status = await Permission.phone.status;

    if (status.isDenied || status.isPermanentlyDenied) {
      status = await Permission.phone.request();
    }
    // si tenemos permisos procedemos
    if (status.isGranted) {
      setState(() {
        statusMessage = 'Llamando a $phoneNumber...';
      });

      try {
        // llamamos directo
        bool? res = await FlutterPhoneDirectCaller.callNumber(phoneNumber);

        if (res == true) {
          setState(() {
            statusMessage = 'Llamada en curso...';
          });
        } else {
          setState(() {
            statusMessage = 'No se puede iniciar la llamada automatica.\nIntente el boton manual.';
          });
        }
      } catch (e) {
        setState(() {
          statusMessage = 'Error tecnico: $e';
        });
      }
    } else {
      setState(() {
        statusMessage = 'Se requiere permiso de teléfono para funcionar.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                //mensaje de estado
                Text(
                  statusMessage,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.blueGrey,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),

                // foto de perfil
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.2),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      )
                    ]
                  ),
                  child: const CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage('assets/perfil.png'), 
                  ),
                ),
                const SizedBox(height: 50),

                //boton reintentar
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton.icon(
                    onPressed: _makeDirectCall,
                    icon: const Icon(Icons.call),
                    label: const Text('Llamar Ahora'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      textStyle: const TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                const SizedBox(height: 15),

                // Botón Salir
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: OutlinedButton.icon(
                    onPressed: _exitApp, 
                    icon: const Icon(Icons.exit_to_app),
                    label: const Text('Salir'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.red,
                      side: const BorderSide(color: Colors.red),
                      textStyle: const TextStyle(fontSize: 18),
                    ),
                  ),
                )
              ],
            ),
          ),
          
        ),
      ),
    );
  }
}
