import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/providers/scan_list_provider.dart';
import 'package:qr_reader/utils/utils.dart';

class ScanTiles extends StatelessWidget {
  final String tipo;
  const ScanTiles({
    Key? key,
    required this.tipo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans;
    if (scans.isEmpty) {
      return Container(
        alignment: Alignment.center,
        child: const Image(
          image: NetworkImage(
              'https://icons.veryicon.com/png/o/education-technology/onemind/input-data-1.png'),
        ),
      );
    }
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: scans.length,
      itemBuilder: (_, index) => Dismissible(
        key: UniqueKey(),
        background: Container(
          color: const Color.fromRGBO(55, 57, 84, 1),
        ),
        onDismissed: (DismissDirection direction) {
          Provider.of<ScanListProvider>(context, listen: false)
              .borrarScanPorId(scans[index].id!);
        },
        child: ListTile(
          leading: Icon(
            tipo == 'http' ? Icons.language : Icons.map,
            color: Theme.of(context).primaryColor,
          ),
          title: Text(scans[index].valor),
          subtitle: Text('ID: ${scans[index].id}'),
          trailing: const Icon(Icons.keyboard_arrow_right, color: Colors.grey),
          onTap: () => launchURL(context, scans[index]),
          //print('ID: ${scans[index].id}'),
        ),
      ),
    );
  }
}
