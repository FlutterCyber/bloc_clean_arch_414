import 'package:bloc_clean_arch_414/core/di/service_locator.dart';
import 'package:bloc_clean_arch_414/features/home/presentation/bloc/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<ProductBloc>(create: (context) => sl<ProductBloc>()),
      ],
      child: MyApp(),
    ),
  );
}
