import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/scan_list_provider.dart';

class DeleteScreen extends StatelessWidget{
  const DeleteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final scanListProvider  = Provider.of<ScanListProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('Delete Scans'),
        backgroundColor: Colors.red,
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: (){
              //show ios confirmation dialog
              showDialog(
                  context: context,
                  builder: (BuildContext context) => CupertinoAlertDialog(
                    title: new Text("Delete All Scans"),
                    content: new Text("Are you sure you want to delete all app scans?"),
                    actions: <Widget>[
                      CupertinoDialogAction(
                        child: Text('Delete'),
                        onPressed: (){
                          scanListProvider.deleteScans();
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                      ),
                      CupertinoDialogAction(
                        isDefaultAction: true,
                        child: Text("Cancel"),
                        onPressed: (){
                          Navigator.pop(context);
                        }
                      )
                    ],
                  )
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: scanListProvider.scans.length,
          itemBuilder: (context, index) {
            final title  = scanListProvider.scans[index].valor;
            final id = scanListProvider.scans[index].id;
            return GestureDetector(
              onTap: (){
                scanListProvider.deleteScan(id!);
                print('delete${id}');
                //return to the previous screen
                Navigator.pop(context);
              },
              child: Card(
                color: Colors.red,
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
      ),
    );
  }
}