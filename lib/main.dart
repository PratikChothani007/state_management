import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "State Management",
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Future<String> longTask() async {
    await Future.delayed(const Duration(seconds: 3));
    return "Task has been done";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Future builder"),
      ),
      body: Center(
        child: FutureBuilder<String>(
          future: longTask(),
          builder: (_, snapshot) {
            if (snapshot.data != null) {
              return Text(snapshot.data!);
            } else {
              if (snapshot.hasError) {
                return const Text("Some thing went wrong");
              }
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
