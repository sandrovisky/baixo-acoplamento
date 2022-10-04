import 'package:flutter/material.dart';

class CategoryError extends StatelessWidget {
  const CategoryError({super.key, required this.error, required this.onRefreh});
  final String error;
  final Future<void> Function() onRefreh;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: onRefreh,
        child: const Icon(Icons.refresh),
      ),
      body: Center(child: Text(error)),
    );
  }
}
