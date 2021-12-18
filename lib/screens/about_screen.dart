import 'package:flutter/material.dart';
import 'package:what_todo/widgets/menu_widget.dart';
import 'package:what_todo/widgets/tabbar_widget.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text('About'),
          leading: MenuWidget(),
        ),
        body: Column(
          children: [
            SizedBox(height: 50),
            Container(
              width: double.maxFinite,
              child: TabBarWidget(),
            ),
          ],
        ),
      );
}
