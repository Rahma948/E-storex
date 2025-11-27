import 'package:e_storex/core/DI/get_it.dart';
import 'package:e_storex/core/routing/app_route.dart';
import 'package:e_storex/my_app.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    print('🔥 Flutter Error: ${details.exception}');
    print(details.stack);
  };
  setupGetIt();
  runApp(MyApp(appRouter: AppRouter()));
}
