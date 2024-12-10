import 'package:flutter/material.dart';
import 'package:granago_app/src/pages/addgasto_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HomePage"),
        backgroundColor: Colors.greenAccent,
      ),
      bottomNavigationBar: Row(
        children: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const AddGastoPage()));
              },
              icon: const Icon(Icons.add))
        ],
      ),
    );
  }
}
