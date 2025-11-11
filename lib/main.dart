import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

//Importaciones para Firebase
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Necesario antes de inicializar Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.flutter_dash,
                size: 80,
                color: Colors.white,
              ),
              const SizedBox(height: 20),
              const Text(
                'Welcome to Flutter',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Hello World',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const PokemonPage()),
                  );
                },
                child: const Text('Ver Pokémon'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// 🧩 Pantalla que usa la PokéAPI
class PokemonPage extends StatefulWidget {
  const PokemonPage({super.key});

  @override
  State<PokemonPage> createState() => _PokemonPageState();
}

class _PokemonPageState extends State<PokemonPage> {
  String? pokemonName;
  String? imageUrl;

  Future<void> fetchPokemon() async {
    final response =
        await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/pikachu'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        pokemonName = data['name'];
        imageUrl = data['sprites']['front_default'];
      });
    } else {
      setState(() {
        pokemonName = 'Error al cargar';
        imageUrl = null;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchPokemon();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PokéAPI Demo'),
      ),
      body: Center(
        child: pokemonName == null
            ? const CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (imageUrl != null) Image.network(imageUrl!, height: 150),
                  const SizedBox(height: 20),
                  Text(
                    pokemonName!.toUpperCase(),
                    style: const TextStyle(
                        fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: fetchPokemon,
                    child: const Text('Actualizar Pokémon'),
                  ),
                ],
              ),
      ),
    );
  }
}
