import 'package:flutter/material.dart';
import 'login.dart';
import 'colors.dart';
import 'sign_up.dart';
import 'sex.dart';
import 'analyze.dart';
import 'analyze_result.dart';
import 'navigator.dart';
import 'tech_info.dart';
class FaceTagApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FaceTag',
      theme: _buildFaceTagTheme(),
      home: LoginPage(),
      onGenerateRoute: _getRoute,
      routes: {
        '/login': (context) => LoginPage(),
        '/sign_up': (context) => SignUpPage(),
        '/choose_sex': (context) => ChooseSexPage(),
        '/analyze': (context) => AnalyzePage(),
        '/analyze_result': (context) => AnalyzeResultPage(),
        '/navigator': (context) => NavigatorPage(),
        '/tech_info': (context) => TechInfoPage(),
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
    accentColor: faceTagPink,
    primaryColor: faceTagPink,
  );
}