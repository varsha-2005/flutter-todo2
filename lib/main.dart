import 'package:flutter/material.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.blue,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Todo",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 34,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  "Organize your tasks easily!",
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                    onPressed: () {}, child: const Text("Get Started"))
              ],
            ),
          ),
        ));
  }
}
