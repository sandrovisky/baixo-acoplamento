import 'package:app/features/category/repository/category_repository.dart';
import 'package:app/features/category/router/category_router.dart';
import 'package:flutter/material.dart';

class Routers {
  static String get initialRoute => '/';
  static final Map<String, Widget Function(BuildContext, dynamic)> routes = {
    '/': (_, args) => CategoryRouter(
          repository: CategoryRepository(),
        ),
  };

  static Route? generateRoutes(RouteSettings settings) {
    final routerName = settings.name;
    final routerArgs = settings.arguments;

    final navigateTo = routes[routerName];

    if (navigateTo == null) return null;

    return MaterialPageRoute(
        builder: (context) => navigateTo.call(context, routerArgs));
  }
}
