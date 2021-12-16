import 'package:flutter/material.dart';
import 'package:what_todo/note_models/todo.dart';
import 'package:what_todo/utils/todo_db.dart';
import 'package:what_todo/widgets/menu_widget.dart';
import '../widgets/compose_widget.dart';

class NoteScreen extends StatefulWidget {
  NoteScreen({Key key}) : super(key: key);

  @override
  _NoteScreenState createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  TodoDB _todoStorage;

  @override
  void initState() {
    _todoStorage = TodoDB(dbName: 'db.sqlite');
    _todoStorage.open();
    super.initState();
  }

  @override
  void dispose() {
    _todoStorage.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white.withOpacity(0.9),
        title: const Text(
          "Notes",
          style: TextStyle(color: Colors.black),
        ),
        leading: MenuWidget(),
      ),
      body: StreamBuilder(
        stream: _todoStorage.all(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.active:
            case ConnectionState.waiting:
              if (snapshot.data == null) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              final todo = snapshot.data as List<Todo>;
              return Container(
                color: Colors.white.withOpacity(0.9),
                child: Column(
                  children: [
                    ComposeWidget(
                      onCompose: (title, description) async {
                        await _todoStorage.create(title, description);
                      },
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: todo.length,
                        itemBuilder: (context, index) {
                          final todos = todo[index];
                          return Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.all(10),
                                color: Colors.grey.withOpacity(0.1),
                                child: ListTile(
                                  onTap: () async {
                                    final editedTodo =
                                        await showUpdateDialog(context, todos);
                                    if (editedTodo != null) {
                                      await _todoStorage.update(editedTodo);
                                    }
                                  },
                                  title: Container(
                                      padding: const EdgeInsets.all(10),
                                      child: Text(todos.title)),
                                  subtitle: Text(todos.description),
                                  trailing: TextButton(
                                    onPressed: () async {
                                      final shouldDelete =
                                          await showDeleteDialog(context);
                                      if (shouldDelete) {
                                        await _todoStorage.delete(todos);
                                      }
                                    },
                                    child: const Icon(
                                      Icons.disabled_by_default_rounded,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            default:
              return const Center(
                child: CircularProgressIndicator(),
              );
          }
        },
      ),
    );
  }

  Future<bool> showDeleteDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            content: const Text('Are you sure you want to delete this item?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: const Text('Delete'),
              )
            ]);
      },
    ).then(
      (value) {
        if (value is bool) {
          return value;
        } else {
          return false;
        }
      },
    );
  }

  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  Future<Todo> showUpdateDialog(BuildContext context, Todo todo) {
    _titleController.text = todo.title;
    _descriptionController.text = todo.description;
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Enter your updated values here:'),
              TextField(controller: _titleController),
              TextField(controller: _descriptionController),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(null);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                final editedTodo = Todo(
                    id: todo.id,
                    title: _titleController.text,
                    description: _descriptionController.text);
                Navigator.of(context).pop(editedTodo);
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    ).then((value) {
      if (value is Todo) {
        return value;
      } else {
        return null;
      }
    });
  }
}
