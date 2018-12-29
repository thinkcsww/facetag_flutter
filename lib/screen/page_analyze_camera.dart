import 'dart:io';
import 'dart:async';

import 'package:facetag/widgets/toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:facetag/resource/colors.dart';

class CameraPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Future<File> _imageFile;
  File _realImageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: faceTagBackground,
      body: _buildCameraView(),
    );
  }

  Widget _buildCameraView() {
    return Column(
      children: <Widget>[
        Expanded(child: Center(child: _previewImage())),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton.icon(
                onPressed: _onCameraButtonPressed,
                icon: Icon(
                  Icons.camera,
                  size: 100.0,
                ),
                label: Text("")),
            FlatButton(
              child: Text(
                "진행",
                style: TextStyle(
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              onPressed: _onProgressButtonPressed,
            )
          ],
        ),
        SizedBox(
          height: 20.0,
        )
      ],
    );
  }

  void _onProgressButtonPressed() {
    if(_realImageFile == null) {
      toastWithKey(_scaffoldKey, "사진을 찍어야 합니다.");
      return;
    }
    showDialog(
        context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text('알림'),
          content: Text('정말로 진행하시겠습니까?'),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text('확인'),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/gallery');
              },
            ),
            CupertinoDialogAction(
              child: Text('취소'),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
    }
    );
  }

  void _onCameraButtonPressed() {
    setState(() {
      _imageFile = ImagePicker.pickImage(source: ImageSource.camera);
    });
  }

  Widget _previewImage() {
    return FutureBuilder<File>(
      future: _imageFile,
      builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.data != null) {
          _realImageFile = snapshot.data;
          return Image.file(snapshot.data);
        } else if (snapshot.error != null) {
          return const Text(
            "에러 발생!",
            textAlign: TextAlign.center,
          );
        } else {
          return const Text(
            "아직 사진을 찍지 않았습니다.",
            textAlign: TextAlign.center,
            textScaleFactor: 2.0,
          );
        }
      },
    );
  }
}
