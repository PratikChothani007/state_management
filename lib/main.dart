import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/data_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "State Management",
      home: ChangeNotifierProvider.value(
        value: DataProvider(),
        child: HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider demo"),
      ),
      body: Center(
        child: Consumer<DataProvider>(
          builder: (_, provider, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(provider.counter.toString()),
                if(child!= null)child
              ],
            );
          },
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Only count number will re-render,This text will render only once.",textAlign: TextAlign.center,),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<DataProvider>(context,listen: false).increaseCount();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
