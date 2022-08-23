

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/ui_provider.dart';

class CustomBottomNavigatorBarWidget extends StatelessWidget {
  const CustomBottomNavigatorBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final uiProvider = Provider.of<UIProvider>(context);

    final currentIndex = uiProvider.selectedIndex;

    return BottomNavigationBar(
      onTap: (index) {
        uiProvider.selectedIndex = index; // set the selected index
      },
      backgroundColor: Colors.grey[800],
      elevation: 100,
      showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: currentIndex,
        items: [
      BottomNavigationBarItem(
        icon: Icon(Icons.map_rounded,size: 30,),
        label: 'Map',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.history, size: 30,),
        label: 'Directions',
      ),
    ]);
  }
}