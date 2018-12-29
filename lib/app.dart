import 'package:flutter/material.dart';
import 'package:facetag/screen/page_login.dart';
import 'package:facetag/resource/colors.dart';
import 'package:facetag/screen/page_sign_up.dart';
import 'package:facetag/screen/page_choose_sex.dart';
import 'package:facetag/screen/page_analyze_intro.dart';
import 'package:facetag/screen/page_analyze_result.dart';
import 'package:facetag/widgets/navigator.dart';
import 'package:facetag/screen/page_tech_info.dart';
import 'package:facetag/screen/page_analyze_camera.dart';
import 'package:facetag/screen/page_analyze_gallery.dart';

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
        '/camera': (context) => CameraPage(),
        '/gallery': (context) => GalleryPage()
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