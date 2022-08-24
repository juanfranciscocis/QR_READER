import 'package:flutter/material.dart';
import 'package:qr_reader/providers/db_provider.dart';

import '../models/scan_model_model.dart';



class ScanListProvider extends ChangeNotifier{

  List<ScanModelModel> scans = [];
  String typeSelected = 'http';

  newScan(String value) async {
    final newScan = ScanModelModel(valor: value);
    final id = await DBProvider.db.newScan(newScan);
    newScan.id = id;

    if(this.typeSelected == newScan.tipo){
      this.scans.add(newScan);
      notifyListeners();
    }
  }

  getScans() async{
    this.scans = await DBProvider.db.getAllScans();

    this.scans = [...scans];

    notifyListeners();
  }

  getScansByType(String type) async{
    final scans = await DBProvider.db.getScanByType(type);
    this.scans = [...scans];
    this.typeSelected = type;
    notifyListeners();

  }

  deleteScans() async{
    await DBProvider.db.deleteAllScans();
    this.scans = [];
    notifyListeners();
  }

  deleteScan(int id) async{
    await DBProvider.db.deleteScan(id);
    getScansByType(this.typeSelected);
  }





}