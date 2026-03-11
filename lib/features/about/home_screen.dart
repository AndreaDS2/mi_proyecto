import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home')
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            ElevatedButton(
              onPressed:() {
                context.go('/settings');
              },
              child: const Text("Ir a Settings"),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                context.go('/about');
              },
              child: const Text("Ir a About"),
            ),
          ],
        ),
      )
    );
  }
}