import 'package:flutter/material.dart';
import 'list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Formulário de Informações',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
      routes: {
        '/listScreen': (context) => ListScreen(
              data: ModalRoute.of(context)?.settings.arguments
                  as List<Map<String, String>>?,
            ),
      },
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _creController = TextEditingController();
  final List<Map<String, String>> _data = [];

  void _storeData() {
    final name = _nameController.text;
    final age = _ageController.text;
    final cre = _creController.text;

    if (name.isEmpty || age.isEmpty || cre.isEmpty) {
      // Show a snackbar or alert if fields are empty
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, preencha todos os campos.')),
      );
      return;
    }

    setState(() {
      _data.add({
        'name': name,
        'age': age,
        'cre': cre,
      });

      // Clear the text fields
      _nameController.clear();
      _ageController.clear();
      _creController.clear();
    });
  }

  void _navigateToListScreen() {
    Navigator.pushNamed(
      context,
      '/listScreen',
      arguments: _data,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tela Principal'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Nome'),
            ),
            TextField(
              controller: _ageController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Idade'),
            ),
            TextField(
              controller: _creController,
              decoration: const InputDecoration(labelText: 'CRE'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _storeData,
              child: const Text('Armazenar'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _navigateToListScreen,
              child: const Text('Enviar'),
            ),
          ],
        ),
      ),
    );
  }
}
