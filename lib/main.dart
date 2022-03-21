import 'package:flutter/material.dart';

// void main() {
//   runApp(
//     const MaterialApp(
//       title: "Navigation practice",
//       home: FirstScreen()
//     )
//   );
// }

// void main() {
//   runApp(
//       MaterialApp(
//           title: "Named Routes Demo",
//           initialRoute: "/",
//           routes: {
//             '/' : (context) => const FirstScreen(),
//             '/second' : (context) => const SecondScreen()
//           },
//       )
//   );
// }

void main() {
  runApp(
      MaterialApp(
        initialRoute: '/',
        routes: {
          ExtractArgumentsScreen.routeName: (context) =>
            const ExtractArgumentsScreen(),
          '/' : (context) => const HomeScreen()
        },
      )
  );
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                      context,
                      ExtractArgumentsScreen.routeName,
                      arguments: ScreenArguments("Extract Arguments Screen", "This message is extracted in the build method.")
                  );
                },
                child: const Text('Navigate to screen that extracts arguments')
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                      context,
                      ExtractArgumentsScreen.routeName,
                      arguments: ScreenArguments('Accept Arguments Screen', 'This message is extracted in the onGenerateRoute '
                          'function.')
                  );
                },
                child: const Text('Navigate to a named that accepts arguments')
            ),
          ],
        ),
      )
    );
  }
}

class ExtractArgumentsScreen extends StatelessWidget {
  const ExtractArgumentsScreen({Key? key}) : super(key: key);

  static const routeName = "/extractArguments";

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(args.title),
      ),
      body: Center(
        child: Text(args.message),
      ),
    );
  }
}

class ScreenArguments {
  final String title;
  final String message;

  ScreenArguments(this.title, this.message);
}


// class FirstScreen extends StatelessWidget {
//   const FirstScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("first screen"),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             Navigator.pushNamed(context, '/second');
//           },
//           child: const Text("Open Route"),
//         ),
//       ),
//     );
//   }
// }
//
// class SecondScreen extends StatelessWidget {
//   const SecondScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Second Screen"),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           child: const Text("go to First Screen"),
//         ),
//       )
//     );
//   }
// }

///////////////// 일반 네비게이션 /////////////////
// class FirstScreen extends StatelessWidget {
//   const FirstScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("first screen"),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             Navigator.push(context, MaterialPageRoute(builder: (context) =>  const SecondScreen()));
//           },
//           child: const Text("Open Route"),
//         ),
//       ),
//     );
//   }
// }
//
// class SecondScreen extends StatelessWidget {
//   const SecondScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Second Screen"),
//       ),
//     );
//   }
// }

////////////////// animation ///////////////////////
//
// class MainScreen extends StatelessWidget {
//   const MainScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(context, MaterialPageRoute(builder: (context) {
//           return const DetailScreen();
//         }));
//       },
//       child: Hero(
//         tag: "image hero",
//         child: Image.network('https://picsum.photos/250?image=9'),
//       )
//
//     );
//   }
// }
//
// class DetailScreen extends StatelessWidget {
//   const DetailScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: GestureDetector(
//         onTap: () {
//           Navigator.pop(context);
//         },
//         child: Center(
//             child: Hero(
//               tag: "image hero",
//               child: Image.network('https://picsum.photos/250?image=9'),
//             )
//         ),
//       ),
//     );
//   }
// }
