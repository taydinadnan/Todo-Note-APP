import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';

class TaskCardWidget extends StatelessWidget {
  final String title;
  final String desc;

  TaskCardWidget({this.title, this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 20, right: 20),
      margin: EdgeInsets.only(
        bottom: 20.0,
      ),
      // decoration: BoxDecoration(
      //   gradient: LinearGradient(colors: [
      //     Color(0xFF558EF9),
      //     Color(0xFFFFFFFF).withOpacity(0.9),
      //   ], begin: Alignment(0.0, -1.0), end: Alignment(0.0, 1.0)),
      //   borderRadius: BorderRadius.circular(50.0),
      // ),
      child: ClayContainer(
        emboss: false,
        color: Colors.amber[200],
        // customBorderRadius: BorderRadius.only(
        //     topRight: Radius.elliptical(150, 150),
        //     bottomLeft: Radius.circular(50)),
        depth: 200,
        spread: 5,
        borderRadius: 20,
        child: Container(
          margin: const EdgeInsets.only(left: 20, top: 10, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    title ?? "(Unnamed Task)",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 10),
                  Icon(
                    Icons.edit,
                    size: 20,
                    color: Colors.white,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 10.0,
                ),
                child: Text(
                  desc ?? "No Description Added",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                    height: 1.5,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TodoWidget extends StatelessWidget {
  final String text;
  final bool isDone;

  TodoWidget({this.text, @required this.isDone});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 24.0,
        vertical: 8.0,
      ),
      child: Row(
        children: [
          Container(
            width: 20.0,
            height: 20.0,
            margin: EdgeInsets.only(
              right: 12.0,
            ),
            decoration: BoxDecoration(
                color: isDone ? Color(0xFF272D34) : Colors.transparent,
                borderRadius: BorderRadius.circular(6.0),
                border: isDone
                    ? null
                    : Border.all(color: Color(0xFF86829D), width: 1.5)),
            child: Image(
              image: AssetImage('assets/images/check_icon.png'),
            ),
          ),
          Flexible(
            child: Text(
              text ?? "(Unnamed Todo)",
              style: TextStyle(
                color: isDone ? Color(0xFF272D34) : Color(0xFF86829D),
                fontSize: 16.0,
                fontWeight: isDone ? FontWeight.bold : FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NoGlowBehaviour extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
