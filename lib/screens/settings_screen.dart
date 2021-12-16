import 'package:flutter/material.dart';
import 'package:what_todo/widgets/menu_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text('Payment Page'),
          leading: MenuWidget(),
        ),
      );
}
