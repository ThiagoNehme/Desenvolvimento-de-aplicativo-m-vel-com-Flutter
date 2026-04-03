import 'package:flutter/material.dart';

void main() {
  runApp(MeuApp());
}

// Widget principal do aplicativo
class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trabalho Prático Flutter',
      debugShowCheckedModeBanner: false,
      home: TelaPrincipal(),
    );
  }
}

// Tela principal com estado (StatefulWidget)
class TelaPrincipal extends StatefulWidget {
  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  // Lista de tarefas
  List<String> tarefas = [];

  // Controlador do campo de texto
  TextEditingController controller = TextEditingController();

  // Função personalizada para adicionar tarefa
  void adicionarTarefa() {
    if (controller.text.isNotEmpty) {
      setState(() {
        tarefas.add(controller.text);
        controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tarefas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Campo de entrada de texto
            TextField(
              controller: controller,
              decoration: InputDecoration(
                labelText: 'Digite uma tarefa',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),

            // Botão para adicionar tarefa
            ElevatedButton(
              onPressed: adicionarTarefa,
              child: Text('Adicionar'),
            ),

            SizedBox(height: 20),

            // Lista de tarefas
            Expanded(
              child: ListView.builder(
                itemCount: tarefas.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: Icon(Icons.check_circle_outline),
                      title: Text(tarefas[index]),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
