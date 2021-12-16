import 'package:flutter/material.dart';
import 'package:what_todo/widgets/menu_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text('Payment Page'),
          leading: MenuWidget(),
        ),
      );
}
