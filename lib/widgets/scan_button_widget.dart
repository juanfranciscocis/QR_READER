import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';

import '../providers/scan_list_provider.dart';
import '../utils/utils.dart';

class ScanButtonWidget extends StatelessWidget{
  const ScanButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {


        String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode('#3D8BEF', 'Cancel', false, ScanMode.QR); //https://pub.dev/packages/flutter_barcode_scanner


        //final barcodeScanRes = 'geo:-0.185382,-78.449844'; //emulate the barcodeScanRes
        //final barcodeScanRes = 'http://www.google.com/'; //emulate the barcodeScanRes

        if(barcodeScanRes == '-1'){
          return;
        }

        final scanListProvider  = Provider.of<ScanListProvider>(context, listen: false);
        final newScan = await scanListProvider.newScan(barcodeScanRes);

        launchURL(context,newScan);





      },
      elevation: 10,
      child: Icon(Icons.camera_alt),
    );
  }
}