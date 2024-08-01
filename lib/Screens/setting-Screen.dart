import 'package:flutter/material.dart';

import 'tabs/account-Settings-Tab.dart';
import 'tabs/billing-Settings-Tab.dart';
import 'tabs/general-Settings-Tab.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});
  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _nextTab() {
    if (_tabController.index < _tabController.length - 1) {
      _tabController.animateTo(_tabController.index + 1);
    }
  }

  bool is18Plus = false;
  bool haveAccess = false;
  bool lightOn = false;

  void _prevTab() {
    if (_tabController.index > 0) {
      _tabController.animateTo(_tabController.index - 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: backgroundColor,
      appBar: AppBar(
        // backgroundColor: backgroundColor,
        title: Text(
          "Settings",
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey, // Border color
                  width: 1.0, // Border width
                ),
              ),
            ),
            child: IgnorePointer(
              ignoring: true,
              child: TabBar(
                controller: _tabController,
                tabs: [
                  Tab(
                    child: Text(
                      "Account Settings",
                    ),
                  ),
                  Tab(
                    child: Text("General Settings",)),
                  Tab(
                    child: Text("Billing"),
                  )
                ],
                // labelColor: themeColor,
                // indicatorColor: themeColor,
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(
                    // color: themeColor,
                    width: 4,
                  ), // Change indicator color and width
                  insets: EdgeInsets.symmetric(
                      horizontal: 100), // Custom width for the indicator
                ),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: TabBarView(
              controller: _tabController,
              physics:
                  NeverScrollableScrollPhysics(), // Disable swipe to change tabs
              children: [
                AccountTab(),
                GeneralTab(),
                BillingsTab(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: _prevTab,
              child: Text('PREV'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: _nextTab,
              child: Text('Next'),
            ),
          ),
        ],
      ),
    );
  }
}
