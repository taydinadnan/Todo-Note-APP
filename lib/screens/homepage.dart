import 'package:flutter/material.dart';
import 'package:what_todo/db/database_helper.dart';
import 'package:what_todo/screens/taskpage.dart';
import 'package:what_todo/widgets.dart';
import 'package:what_todo/widgets/menu_widget.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  DatabaseHelper _dbHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Stack(
            children: [
              Positioned(
                child: Container(
                  width: double.maxFinite,
                  height: 350,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/tab1.jpg'),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 20,
                top: 50,
                child: Row(
                  children: [
                    MenuWidget(),
                  ],
                ),
              ),
              Positioned(
                top: 300,
                child: Container(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                  width: MediaQuery.of(context).size.width,
                  height: 500,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: FutureBuilder(
                          initialData: [],
                          future: _dbHelper.getTasks(),
                          builder: (context, snapshot) {
                            return ScrollConfiguration(
                              behavior: NoGlowBehaviour(),
                              child: ListView.builder(
                                itemCount: snapshot.data.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Taskpage(
                                            task: snapshot.data[index],
                                          ),
                                        ),
                                      ).then(
                                        (value) {
                                          setState(() {});
                                        },
                                      );
                                    },
                                    child: TaskCardWidget(
                                      title: snapshot.data[index].title,
                                      desc: snapshot.data[index].description,
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 40.0,
                right: 30.0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Taskpage(
                                task: null,
                              )),
                    ).then((value) {
                      setState(() {});
                    });
                  },
                  child: Container(
                    width: 60.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Color(0xFF4AC8EA).withOpacity(0.2),
                        Color(0xFF4AC8EA)
                      ], begin: Alignment(0.0, -1.0), end: Alignment(0.0, 1.0)),
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    child: Image(
                      image: AssetImage(
                        "assets/images/add_icon.png",
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
