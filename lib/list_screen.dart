import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  final List<Map<String, String>>? data;

  const ListScreen({super.key, this.data});

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  late List<Map<String, String>> _data;

  @override
  void initState() {
    super.initState();
    _data = widget.data ?? [];
  }

  void _deleteCard(int index) {
    setState(() {
      _data.removeAt(index);
    });
  }

  void _addCard() {
    // Adiciona um card com dados fictícios ou uma nova interface pode ser implementada aqui
    setState(() {
      _data.add({
        'name': 'Nome ${_data.length + 1}',
        'age': '${_data.length + 20}',
        'cre': 'CRE ${_data.length + 1}',
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Informações'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _data.length,
              itemBuilder: (context, index) {
                final item = _data[index];
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text('Nome: ${item['name']}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Idade: ${item['age']}'),
                        Text('CRE: ${item['cre']}'),
                      ],
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _deleteCard(index),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: _addCard,
              child: const Text('Adicionar Card'),
            ),
          ),
        ],
      ),
    );
  }
}
