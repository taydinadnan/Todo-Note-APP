import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

typedef OnCompose = void Function(String title, String description);

class ComposeWidget extends StatefulWidget {
  final OnCompose onCompose;
  const ComposeWidget({Key key, @required this.onCompose}) : super(key: key);

  @override
  _ComposeWidgetState createState() => _ComposeWidgetState();
}

class _ComposeWidgetState extends State<ComposeWidget> {
  TextEditingController _titleController;
  TextEditingController _descriptionController;

  @override
  void initState() {
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClayContainer(
      emboss: false,
      color: Colors.white.withOpacity(0.7),
      customBorderRadius: BorderRadius.only(
          topRight: Radius.elliptical(5, 150), bottomLeft: Radius.circular(50)),
      depth: 100,
      spread: 5,
      borderRadius: 20,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
            decoration: BoxDecoration(),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _titleController,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(color: Colors.black),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.0),
                      hintText: "Enter title...",
                      focusedBorder: InputBorder.none,
                    ),
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.0),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _descriptionController,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(color: Colors.black),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.0),
                      hintText: "Enter description...",
                      focusedBorder: InputBorder.none,
                    ),
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    final title = _titleController.text;
                    final description = _descriptionController.text;
                    widget.onCompose(title, description);
                    _titleController.text = '';
                    _descriptionController.text = '';
                  },
                  icon: const Icon(
                    Icons.add,
                    size: 30,
                    color: btnColor,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
