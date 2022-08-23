import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/providers/db_provider.dart';
import 'package:qr_reader/screens/screens.dart';

import '../providers/ui_provider.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR READER'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: (){
            },
          ),
        ],
      ),


      body: _HomePageBody(),

      bottomNavigationBar: CustomBottomNavigatorBarWidget(),

      floatingActionButton: ScanButtonWidget() ,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}




class _HomePageBody extends StatelessWidget{
  const _HomePageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final uiProvider = Provider.of<UIProvider>(context);
    final currentIndex = uiProvider.selectedIndex;

    // TODO: TEMPORAL BASE DE DATOS
    //DBProvider.db.database;
    final tempScan = ScanModel (valor: 'http://www.google.com');
    DBProvider.db.newScan(tempScan);

    switch(currentIndex){
      case 0:
        return MapsScreen();
      case 1:
        return DirectionsScreen();
      default:
        return MapScreen();
    }



  }
}