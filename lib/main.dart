import 'package:flutter/material.dart';
import 'package:state_management/bloc.dart';

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

  MyBloc bloc = MyBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BLoC"),
      ),
      body: Center(
        child: StreamBuilder<int>(
          // initialData: 0,
          stream: bloc.stream,
          builder: (_, snapshot) {
            if (snapshot.hasError) {
              return const Text("Some thing went wrong");
            }
            if (snapshot.data != null) {
              return Text(snapshot.data.toString());
            }
            return const Text("Tap to increase");
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          bloc.increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
