import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/pages/direcciones_page.dart';
import 'package:qr_reader/pages/mapas_page.dart';
import 'package:qr_reader/providers/scan_list_provider.dart';
//import 'package:qr_reader/providers/db_provider.dart';
import 'package:qr_reader/providers/ui_provider.dart';
import 'package:qr_reader/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Historial'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                final scanListProvider =
                    Provider.of<ScanListProvider>(context, listen: false);
                scanListProvider.borrarTodos();
              },
              icon: const Icon(Icons.delete))
        ],
      ),
      body: const _HomePageBody(),
      bottomNavigationBar: const CustomNavigatorBar(),
      floatingActionButton: const ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  const _HomePageBody();

  @override
  Widget build(BuildContext context) {
    //Obtener el selectedMuneOpt
    final uiProvider = Provider.of<UiProvider>(context);
    final int currentIndex = uiProvider.selectedMenuOpt;
    //* Leer base de datos pero después borrar
    //final tempScan = ScanModel(valor: 'http://google.com.co');
    //DBProvider.db.nuevoScan(tempScan); //Insertar un nuevo dato
    //DBProvider.db.getTodosLosScans().then((value) => print(value![0].valor));
    //DBProvider.db.updateScan(tempScan);
    //DBProvider.db.deleteAllScans().then((value) => print(value));

    final scanListProvider =
        Provider.of<ScanListProvider>(context, listen: false);
    switch (currentIndex) {
      case 0:
        scanListProvider.cargarScansPorTipo('geo');
        return const MapasPage();
      case 1:
        scanListProvider.cargarScansPorTipo('http');
        return const DireccionesPage();
      default:
        return const MapasPage();
    }
  }
}
