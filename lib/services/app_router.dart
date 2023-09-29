import 'package:flutter/material.dart';
import 'package:tasks_app/screens/recycle_bin.dart';
import 'package:tasks_app/screens/tabs_screen.dart';
import 'package:tasks_app/screens/pending_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RecycleBin.id:
        return MaterialPageRoute(builder: (_) => const RecycleBin());
      case TabScreen.id:
        return MaterialPageRoute(builder: (_) =>  TabScreen());

      default:
        return null;
    }
  }
}
