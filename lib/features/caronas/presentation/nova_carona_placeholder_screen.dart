import 'package:flutter/material.dart';

class NovaCaronaPlaceholderScreen extends StatelessWidget {
  const NovaCaronaPlaceholderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nova carona')),
      body: const Center(child: Text('Formulário disponível na T1.5.')),
    );
  }
}
