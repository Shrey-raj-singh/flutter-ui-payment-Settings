import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/settings-Provider.dart';


class GeneralTab extends StatefulWidget {
  @override
  _GeneralTabState createState() => _GeneralTabState();
}

class _GeneralTabState extends State<GeneralTab> {
  bool haveAccess = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer<SettingsProvider>(
        builder: (context, provider, child) {
          return SwitchListTile(
            title: Text('Have access'),
            value: provider.haveAccess,
            onChanged: (bool value) {
              provider.toggleHaveAccess(value);
            },
          );
        },
      ),
    );
  }
}
