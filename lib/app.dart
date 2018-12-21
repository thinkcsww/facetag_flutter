import 'package:flutter/material.dart';
import 'login.dart';

class FaceTagApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FaceTag',
      theme: _buildFaceTagTheme(),
      onGenerateRoute: _getRoute,
      routes: {
        '/login': (context) => LoginPage(),
      },
    );
  }

  Route<dynamic> _getRoute(RouteSettings setting) {
    if (setting.name != 'login') { return null;}
    return MaterialPageRoute<void> (
      settings: setting,
      builder: (BuildContext context) => LoginPage(),
      fullscreenDialog: true,
    );
  }
}

ThemeData _buildFaceTagTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    accentColor: 
  );
}