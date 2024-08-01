import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/settings-Provider.dart';


class BillingsTab extends StatefulWidget {
  @override
  _BillingsTabState createState() => _BillingsTabState();
}

class _BillingsTabState extends State<BillingsTab> {
  bool lightOn = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer<SettingsProvider>(
        builder: (context, provider, child) {
          return SwitchListTile(
            title: Text('Light on/off'),
            value: provider.lightOn,
            onChanged: (bool value) {
              provider.toggleLightOn(value);
            },
          );
        },
      ),
    );
  }
}
