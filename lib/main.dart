import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:what_todo/screens/homepage.dart';
import 'package:what_todo/screens/note_screen.dart';

import 'models/menu_item.dart';
import 'screens/about_screen.dart';
import 'screens/menu_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.nunitoSansTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  MenuItem currentItem = MenuItems.todo;

  @override
  Widget build(BuildContext context) => ZoomDrawer(
        borderRadius: 40,
        angle: -10,
        slideWidth: MediaQuery.of(context).size.width * 0.7,
        showShadow: true,
        backgroundColor: Color(0xFF4AC8EA),
        style: DrawerStyle.Style1,
        mainScreen: getScreen(),
        menuScreen: Builder(builder: (context) {
          return MenuPage(
            currentItem: currentItem,
            onSelectedItem: (item) {
              setState(() {
                currentItem = item;
                ZoomDrawer.of(context).close();
              });
            },
          );
        }),
      );

  Widget getScreen() {
    switch (currentItem) {
      case MenuItems.todo:
        return Homepage();
      case MenuItems.profile:
        return NoteScreen();
      case MenuItems.about:
      default:
        return AboutScreen();
    }
  }
}
