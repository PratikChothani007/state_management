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

  Stream<int> autoCounter() async* {
    int count = 0;
    while(true){
      await Future.delayed(const Duration(seconds: 1));
      yield count++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stream builder"),
      ),
      body: Center(
        child: StreamBuilder<int>(
          // initialData: 0,
          stream: autoCounter(),
          builder: (_, snapshot) {
            if (snapshot.hasError) {
              return const Text("Some thing went wrong");
            }
            if (snapshot.data != null) {
              return Text(snapshot.data.toString());
            }
            return const Text("Starting...");
          },
        ),
      ),
    );
  }
}
