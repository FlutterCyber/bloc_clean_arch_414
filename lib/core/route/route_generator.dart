import 'package:bloc_clean_arch_414/core/route/route_names.dart';
import 'package:bloc_clean_arch_414/features/home/presentation/pages/product_page.dart';
import 'package:flutter/material.dart';

class AppRoute {
  BuildContext context;

  AppRoute({required this.context});

  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RouteNames.productPage:
        return MaterialPageRoute(builder: (_) => ProductPage());

      // case RouteNames.byCategoryPage:
      //   final categoryData = routeSettings.arguments as Map<String, String>;
      //   return MaterialPageRoute(
      //       builder: (_) => ProductByCategoryPage(data: categoryData));
      default:
        return _errorRoute();
    }
  }

  Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder:
          (_) => Scaffold(
            appBar: AppBar(title: const Text('Error')),
            body: const Center(child: Text('Page not found')),
          ),
    );
  }
}
