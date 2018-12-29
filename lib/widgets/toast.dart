import 'package:flutter/material.dart';

// Snackbar를 이용한 토스트구현
void showToast(BuildContext context, String errorMessage) {
	Scaffold.of(context).showSnackBar(
		SnackBar(
			content: Text(errorMessage),
			duration: Duration(seconds: 1),
		)
	);
}