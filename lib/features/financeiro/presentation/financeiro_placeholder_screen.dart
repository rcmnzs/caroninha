import 'package:flutter/material.dart';

class FinanceiroPlaceholderScreen extends StatelessWidget {
  const FinanceiroPlaceholderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Financeiro')),
      body: const Center(child: Text('Placeholder: Financeiro')),
    );
  }
}
