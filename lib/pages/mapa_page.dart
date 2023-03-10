import 'package:flutter/material.dart';
import 'package:qr_reader/models/scans_model.dart';

class MapaPage extends StatelessWidget {
  const MapaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScanModel scan =
        ModalRoute.of(context)!.settings.arguments as ScanModel;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mapa'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(scan.valor),
      ),
    );
  }
}
