import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'brick_breaker.dart';
import 'screens/game_app.dart';
import 'screens/rive_button_test.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        textTheme: GoogleFonts.pressStart2pTextTheme().apply(
          bodyColor: const Color(0xff184e77),
          displayColor: const Color(0xff184e77),
        ),
        useMaterial3: true,
      ),
      home: Directionality(
        textDirection: TextDirection.ltr,
        child: Builder(
          builder: (context) => Scaffold(
            body: Column(
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    final game = FlameGame();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Scaffold(
                          appBar: AppBar(
                            title: const Text('Default game demo'),
                          ),
                          body: GameWidget(game: game),
                        ),
                      ),
                    );
                  },
                  child: const Text('Default game demo'),
                ),
                const SizedBox(height: 30.0),
                ElevatedButton(
                  onPressed: () {
                    // final game = FlameGame();
                    // final game = BrickBreaker();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            // Scaffold(
                            //   appBar: AppBar(
                            //     title: const Text('Game demo'),
                            //   ),
                            //   body: GameWidget(game: game),
                            // ),
                            const GameApp(),
                      ),
                    );
                  },
                  child: const Text('Game demo'),
                ),
                const SizedBox(height: 30.0),
                ElevatedButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RiveButtonTest(),
                    ),
                  ),
                  child: const Text('Rive button demo'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
