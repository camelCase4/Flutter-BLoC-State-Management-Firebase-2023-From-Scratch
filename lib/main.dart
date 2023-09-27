import 'package:counter_app_initial_proj/bloc/counter_bloc.dart';
import 'package:counter_app_initial_proj/pages/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'bloc/dart_imports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Bloc.observer = MyBlocObserver();
  // runApp(
  //   const MyApp(),
  // );

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );
  Bloc.observer = MyBlocObserver();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: const MaterialApp(
        home: Scaffold(
          body: CounterAppMainScreen(),
        ),
      ),
    );
  }
}
