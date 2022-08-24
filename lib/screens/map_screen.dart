import 'package:flutter/material.dart';
import 'package:qr_reader/providers/db_provider.dart';

class MapScreen extends StatelessWidget{
  const MapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    //retrieve arguments from the previous screen
    final argument = ModalRoute.of(context)!.settings.arguments;
    final scan = argument as ScanModelModel;



    return Scaffold(
      body: Center(
        child: Text(scan.valor),
      ),
    );
  }
}