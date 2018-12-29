import 'package:flutter/material.dart';
import 'package:progress_hud/progress_hud.dart';
export 'package:progress_hud/progress_hud.dart';

ProgressHUD makeProgressBar(String message, Color color) {
	return ProgressHUD(
		backgroundColor: Colors.black12,
		color: color,
		containerColor: Colors.white,
		borderRadius: 5.0,
		text: message,
		loading: false,
	);
}
