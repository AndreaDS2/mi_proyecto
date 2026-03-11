import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const MyHomePage(title: 'Home TechEdge'),
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => Scaffold(
        appBar: AppBar(title: const Text("Settings")),
        body: const Center(
          child: Text("Pantalla de Configuración"),
        ),
      ),
    ),
    GoRoute(
      path: '/about',
      builder: (context, state) => Scaffold(
        appBar: AppBar(title: const Text("About")),
        body: const Center(
          child: Text("Pantalla Acerca de"),
        ),
      ),
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Semantics(
              label: 'Texto indicativo del contador',
              child: const Text('Has pulsado el botón estas veces:'),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontSize: 34,
                  ),
            ),
            const SizedBox(height: 50),

            ElevatedButton(
              onPressed: () => context.go('/settings'),
              child: const Text("Ir a Configuración"),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () => context.go('/about'),
              child: const Text("Ir a acerca de"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Incrementar contador',
        child: Semantics(
          button: true,
          label: 'Añadir uno al contador',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}