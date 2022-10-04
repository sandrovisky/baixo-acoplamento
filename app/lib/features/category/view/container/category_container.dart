import 'package:app/features/category/controller/category_controller.dart';
import 'package:app/features/category/view/pages/category_error.dart';
import 'package:app/features/category/view/pages/category_loading.dart';
import 'package:app/features/category/view/pages/category_page.dart';
import 'package:flutter/material.dart';

class CategoryContainer extends StatelessWidget {
  const CategoryContainer({super.key, required this.controller});
  final ICategoryController controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        if (controller.isLoading) {
          return const CategoryLoading();
        }

        if (controller.hasError) {
          return CategoryError(
            error: controller.error,
            onRefreh: controller.fetchList,
          );
        }

        return CategoryPage(
          list: controller.list,
          onRefresh: () => controller.fetchList(isError: true),
        );
      },
    );
  }
}
