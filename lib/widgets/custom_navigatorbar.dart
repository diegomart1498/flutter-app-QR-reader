import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/providers/ui_provider.dart';

class CustomNavigatorBar extends StatelessWidget {
  const CustomNavigatorBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    final int currentIndex = uiProvider.selectedMenuOpt;
    return BottomNavigationBar(
      onTap: (int option) => uiProvider.selectedMenuOpt = option,
      selectedItemColor: Colors.blue,
      elevation: 0,
      currentIndex: currentIndex,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          label: 'Mapa',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.language),
          label: 'Direcciones',
        ),
      ],
    );
  }
}
