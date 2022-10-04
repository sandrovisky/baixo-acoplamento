import 'package:app/features/category/controller/category_controller.dart';
import 'package:app/features/category/repository/category_repository.dart';
import 'package:app/features/category/view/container/category_container.dart';
import 'package:flutter/material.dart';

class CategoryRouter extends StatelessWidget {
  const CategoryRouter({super.key, required this.repository});
  final ICategoryRepository repository;

  @override
  Widget build(BuildContext context) {
    return CategoryContainer(
        controller: CategoryController(
            repository: repository,
            onError: (error) => _showErrorDialog(error, context))
          ..fetchList());
  }

  Future<void> _showErrorDialog(String error, BuildContext context) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(error),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Ok"))
          ],
        );
      },
    );
  }
}
