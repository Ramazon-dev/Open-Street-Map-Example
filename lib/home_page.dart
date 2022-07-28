import 'package:flutter/material.dart';
import 'package:osmap_example/openstreetmap.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Home Page",
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const OpenStreetMapPage(),
              ),
            );
          },
          child: const Text(
            "Open Street Map",
          ),
        ),
      ),
    );
  }
}
