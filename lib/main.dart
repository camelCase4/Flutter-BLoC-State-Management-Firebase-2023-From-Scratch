import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tasks_app/blocs/switchbloc/switch_bloc_bloc.dart';
import 'package:tasks_app/services/app_router.dart';
import 'package:tasks_app/services/app_theme.dart';

import 'blocs/bloc_exports.dart';
import 'models/task.dart';
import 'screens/add_task_screen.dart';
import 'screens/tabs_screen.dart';
import 'screens/pending_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );

  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appRouter});

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TasksBloc()),
        BlocProvider(create: (context) => SwitchBlocBloc()),
      ],
      child: BlocBuilder<SwitchBlocBloc, SwitchBlocState>(
        builder: (context, state) {
          return MaterialApp(
            
            debugShowCheckedModeBanner: false,
            theme: state.switchValue 
                ? AppThemes.appThemeData[AppTheme.darkTheme]
                : AppThemes.appThemeData[AppTheme.lightTheme],
            home:  TabScreen(),
            onGenerateRoute: appRouter.onGenerateRoute,
          );
        },
      ),
    );
  }
}
