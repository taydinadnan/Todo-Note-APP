import 'package:flutter/material.dart';

import '../colors.dart';
import 'app_text.dart';

class TabBarWidget extends StatefulWidget {
  const TabBarWidget({Key key}) : super(key: key);

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> {
  var images = {
    'avatar.gif': 'Walking Tours',
    '3.jpeg': 'Hiking',
    '2.jpeg': 'kayaking',
    '1.jpeg': 'Snorkling',
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: double.maxFinite,
      margin: const EdgeInsets.only(left: 10),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 4,
          itemBuilder: (_, index) {
            return Container(
              margin: const EdgeInsets.only(right: 20),
              child: Column(
                children: [
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      image: DecorationImage(
                          image: AssetImage(
                              'assets/images/' + images.keys.elementAt(index)),
                          fit: BoxFit.cover),
                    ),
                  ),
                  const SizedBox(height: 10),
                  AppText(
                    text: images.values.elementAt(index),
                    color: AppColors.textColor2,
                  )
                ],
              ),
            );
          }),
    );
  }
}
