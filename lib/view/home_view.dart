import 'package:flutter/material.dart';
import 'package:remote_config_firebase/service/remote_config_service.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final Map<String, dynamic> availableBackgroundColors = {
    "red": Colors.red,
    "yellow": Colors.yellow,
    "blue": Colors.blue,
    "green": Colors.green,
    "white": Colors.white,
  };

  String backgroundColor = "white";

  @override
  initState() {
    super.initState();
    RemoteConfigService.initConfig();
  }

  uiPress() async {
    backgroundColor = await RemoteConfigService.fetchConfig();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: availableBackgroundColors[backgroundColor],
      body: Center(child: Text(backgroundColor)),
      floatingActionButton: FloatingActionButton(
        onPressed: () => uiPress(),
      ),
    );
  }
}
