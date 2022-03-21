import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Navigation practice",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Navigation practice"),
        ),
        body: const MainScreen(),
      ),
    )
  );
}

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const DetailScreen();
        }));
      },
      child: Hero(
        tag: "image hero",
        child: Image.network('https://picsum.photos/250?image=9'),
      )

    );
  }
}

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
            child: Hero(
              tag: "image hero",
              child: Image.network('https://picsum.photos/250?image=9'),
            )
        ),
      ),
    );
  }
}
