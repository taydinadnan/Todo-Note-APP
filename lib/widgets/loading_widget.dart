import 'package:flutter/material.dart';
import 'package:what_todo/widgets/app_text.dart';

class CircularProcessLoading extends StatelessWidget {
  const CircularProcessLoading({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: double.maxFinite,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 200,
                width: double.maxFinite,
                child: Image(
                  image: AssetImage('assets/images/avatar.gif'),
                ),
              ),
              SizedBox(height: 10),
              AppText(text: 'Tab + icon to add Todo.')
            ],
          ),
        ),
      ),
    );
  }
}
