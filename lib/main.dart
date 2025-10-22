import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to Flutter'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: SingleChildScrollView( // Para evitar overflow si el contenido es largo
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Hello World',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              // --- Text Widget ---
              const Text(
                'Este es un widget de texto.',
                style: TextStyle(fontSize: 18, color: Colors.blueGrey),
              ),
              const SizedBox(height: 20),

              // --- Row Widget ---
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    color: Colors.blue,
                  ),
                  const SizedBox(width: 10),
                  Container(
                    width: 60,
                    height: 60,
                    color: Colors.green,
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // --- Column Widget ---
              Column(
                children: const [
                  Text('Elemento 1 en columna'),
                  Text('Elemento 2 en columna'),
                ],
              ),
              const SizedBox(height: 20),

              // --- Stack Widget ---
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 150,
                    height: 100,
                    color: Colors.grey[400],
                  ),
                  const Text('Texto encima del Container'),
                ],
              ),
              const SizedBox(height: 20),

              // --- Container Widget ---
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  'Soy un Container con estilo',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
