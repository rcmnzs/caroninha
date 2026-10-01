import 'package:flutter/material.dart';

class ConfiguracoesPlaceholderScreen extends StatelessWidget {
  const ConfiguracoesPlaceholderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Configurações')),
      body: const Center(child: Text('Placeholder: Configurações')),
    );
  }
}
