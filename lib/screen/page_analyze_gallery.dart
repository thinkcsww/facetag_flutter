import 'dart:io';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:facetag/widgets/asset_view.dart';

class GalleryPage extends StatefulWidget {
  File image;
  GalleryPage({this.image});

  @override
  State<StatefulWidget> createState() => GalleryPageState();
}

class GalleryPageState extends State<GalleryPage> {
  File _image;
  String _imagePath;
  List<String> _labels;
  List<Asset> _images;

  GalleryPageState() {
    _labels = List<String>();
    _images = List<Asset>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("갤러리 분석"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(child: _buildGridView()),
          FlatButton.icon(
              onPressed: _loadAsseets,
              icon: Icon(Icons.photo_library),
              label: Text(""))
        ],
      ),
    );
  }

  Widget _buildGridView() {
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(_images.length, (index) {
        return AssetView(index, _images[index]);
      }),
    );
  }

  Future<void> _loadAsseets() async {
    setState(() {
      _images = List<Asset>();
    });

    List<Asset> resultList;

    try {
      resultList = await MultiImagePicker.pickImages(
          maxImages: 100,
          enableCamera: false);
    } on PlatformException catch (e) {
      print(e);
    }

    if (!mounted) return;

    setState(() {
      _images = resultList;
    });
  }
}
