

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/scan_list_provider.dart';

class MapsScreen extends StatelessWidget{
  const MapsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final scanListProvider  = Provider.of<ScanListProvider>(context, listen: true);

    return ListView.builder(
        itemCount: scanListProvider.scans.length,
        itemBuilder: (context, index) {
          final title  = scanListProvider.scans[index].valor;
          final id = scanListProvider.scans[index].id;
          return GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, '/map', arguments: scanListProvider.scans[index]);
            },
            child: Card(
              color: Colors.grey[800],
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),

              child: Container(
                padding: EdgeInsets.all(20),
                child: Row(
                  children: [
                    Icon(Icons.map, color: Colors.cyan,size: 35,),
                    SizedBox(width: 20,),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(title.toUpperCase(),style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),maxLines: 1 , overflow: TextOverflow.ellipsis,),
                          Text('ID: ${id.toString()}', style: TextStyle(fontSize: 10)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
    );
  }
}