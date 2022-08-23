import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScanButtonWidget extends StatelessWidget{
  const ScanButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {


        //String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode('#3D8BEF', 'Cancel', false, ScanMode.QR); //https://pub.dev/packages/flutter_barcode_scanner
        final barcodeScanRes = 'www.google.com'; //emulate the barcodeScanRes
        print(barcodeScanRes);





      },
      elevation: 10,
      child: Icon(Icons.camera_alt),
    );
  }
}