import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Minha Localização',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String locationMessage = '';

  @override
  void initState() {
    super.initState();
    _requestLocationPermission(); // Solicita a permissão ao iniciar o app
  }

  Future<void> _requestLocationPermission() async {
    // Solicita a permissão de localização
    var status = await Permission.location.request();

    if (status.isGranted) {
      // Permissão concedida, pode acessar a localização
      print('Permissão concedida');
    } else if (status.isDenied) {
      // Permissão negada pelo usuário
      print('Permissão negada');
    } else if (status.isPermanentlyDenied) {
      // Permissão permanentemente negada, o usuário precisa alterar isso nas configurações do sistema
      print('Permissão permanentemente negada');
      openAppSettings();
    }
  }

  void _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      locationMessage =
          'Latitude: ${position.latitude}, Longitude: ${position.longitude}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minha Localização'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(locationMessage),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _getCurrentLocation,
              child: const Text('Obter Localização Atual'),
            ),
          ],
        ),
      ),
    );
  }
}
