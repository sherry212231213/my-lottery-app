import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Random random = Random();
  int x = 0;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: const Text(
          "Lottery App",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black),
        ),
      ),
      body: Container(
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'assets/lottery.jpg',
              ),
              fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            const SizedBox(height: 200),
            const Center(
              child: Text(
                "Winning Number is \n \t \t\t\t\t\t\t\t\t\t\t\t5",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            const SizedBox(height: 30),
            x == 5
                ? Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                        image: const DecorationImage(
                            image: AssetImage('assets/winner lottery.jpg'),
                            fit: BoxFit.cover),
                        color: const Color.fromARGB(255, 241, 237, 0),
                        borderRadius: BorderRadius.circular(140)),
                  )
                : Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 241, 237, 0),
                        borderRadius: BorderRadius.circular(140)),
                    child: Center(
                      child: Text(
                        "$x",
                        style: const TextStyle(
                            fontSize: 50, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
            const SizedBox(
              height: 40,
            ),
            x == 5
                ? ElevatedButton(
                    onPressed: () {
                      x = random.nextInt(10);
                      setState(() {});
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.yellow),
                    child: const Icon(Icons.done))
                : ElevatedButton(
                    onPressed: () {
                      x = random.nextInt(10);
                      setState(() {});
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.yellow),
                    child: const Icon(Icons.replay_outlined))
          ],
        ),
      ),
    );
  }
}
