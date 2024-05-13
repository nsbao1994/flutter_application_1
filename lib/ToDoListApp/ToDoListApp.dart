import 'package:flutter/material.dart';

class ToDoListApp extends StatelessWidget {
  const ToDoListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green.shade100),
      ),
      home: const TodoListScreen(),
    );
  }
}

enum TodoStatus { pending, completed }

class Todo {
  final String title;
  final String content;
  TodoStatus status;

  Todo(
      {required this.title,
      required this.content,
      this.status = TodoStatus.pending});
}

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  List<Todo> todos = [];

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  // ignore: non_constant_identifier_names
  void RemoveTodo(int id) {
    todos.removeAt(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade100,
        title: const Text('Todo List App'),
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          final todo = todos[index];
          return ListTile(
            title: Text(todo.title),
            subtitle: Text(todo.content),
            trailing: Checkbox(
              value: todo.status == TodoStatus.completed,
              onChanged: (value) {
                setState(() {
                  if (value != null) {
                    todo.status =
                        value ? TodoStatus.completed : TodoStatus.pending;
                    RemoveTodo(index);
                  }
                });
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddTodoDialog(context);
        },
        tooltip: 'Add Todo',
        child: const Icon(Icons.add),
      ),
      persistentFooterButtons: <Widget>[
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AllTodosScreen(todos: todos)),
            );
          },
          child: const Text('Danh sách công việc'),
        ),
      ],
    );
  }

  void _showAddTodoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Thêm công việc'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _titleController,
                decoration:
                    const InputDecoration(hintText: 'Tiêu đề công việc'),
              ),
              TextField(
                controller: _contentController,
                decoration:
                    const InputDecoration(hintText: 'Nội dung công việc'),
              ),
            ],
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Hủy bỏ'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  todos.add(Todo(
                    title: _titleController.text,
                    content: _contentController.text,
                  ));
                  _titleController.clear();
                  _contentController.clear();
                });
                Navigator.of(context).pop();
              },
              child: const Text('Thêm'),
            ),
          ],
        );
      },
    );
  }
}

class AllTodosScreen extends StatelessWidget {
  final List<Todo> todos;

  const AllTodosScreen({super.key, required this.todos});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        title: const Text('Danh sách công việc'),
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          final todo = todos[index];
          return ListTile(
            title: Text(todo.title),
            subtitle: Text(todo.content),
            trailing: Checkbox(
              value: todo.status == TodoStatus.completed,
              onChanged: null,
            ),
          );
        },
      ),
    );
  }
}
