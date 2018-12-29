import 'package:flutter/material.dart';

// Snackbar를 이용한 토스트구현
void toastWithBuilder(BuildContext context, String message) {
  Scaffold.of(context).showSnackBar(SnackBar(
    content: Text(message),
    duration: Duration(seconds: 1),
  ));
}

void toastWithKey(GlobalKey<ScaffoldState> key, String message) {
  key.currentState.showSnackBar(SnackBar(
    content: Text(message),
    duration: Duration(seconds: 1),
  ));
}
