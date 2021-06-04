import 'package:flutter/material.dart';

class AddPhotoPage extends StatefulWidget {
  const AddPhotoPage({Key key}) : super(key: key);

  @override
  _AddPhotoPageState createState() => _AddPhotoPageState();
}

class _AddPhotoPageState extends State<AddPhotoPage> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Camera"));
  }
}
