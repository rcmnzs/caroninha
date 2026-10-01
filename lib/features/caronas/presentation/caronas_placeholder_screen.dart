import 'package:flutter/material.dart';

class CaronasPlaceholderScreen extends StatelessWidget {
  const CaronasPlaceholderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Caronas')),
      body: const Center(child: Text('Placeholder: Caronas')),
    );
  }
}
