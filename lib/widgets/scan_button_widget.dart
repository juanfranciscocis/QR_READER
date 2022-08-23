import 'package:flutter/material.dart';

class ScanButtonWidget extends StatelessWidget{
  const ScanButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: (){
      },
      elevation: 10,
      child: Icon(Icons.camera_alt),
    );
  }
}