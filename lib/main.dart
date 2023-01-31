import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

bool colourBool = true;
const Color blue = Colors.blue;
const Color green = Colors.green;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class Game {
  final String name;
  final String description;

  const Game(this.name, this.description);
}

List<Game> gameList = [
  const Game("World of Warcraft", "Bad game lul"),
  const Game("Final Fantasy XIV", "Gud game lul"),
  const Game("Guild Wars 2", "It's a game, alright")
];

class _MyHomePageState extends State<MyHomePage> {
  Game? _game = gameList[0];
  String gameString = 'World of Warcraft';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            for (var game in gameList)
              ListTile(
                  title: Text(game.name),
                  leading: Radio<Game>(
                    value: game,
                    groupValue: _game,
                    onChanged: (Game? value) {
                      setState(() {
                        gameString = game.name;
                        _game = value;
                      });
                    },
                  )),
            Text('The chosen game is $gameString'),
            ElevatedButton(
              child: const Text('Open route'),
              onPressed: () {
                _navigateAndDisplaySelection(context, _game);
              },
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class FirstRoute extends StatelessWidget {
  const FirstRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Route'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Open route'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.game});

  final Game? game;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(game!.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(game!.description),
            ElevatedButton(
              child: const Text("Go back"),
              onPressed: () {
                Navigator.pop(context, "${game!.name} was accessed");
              },
            )
          ],
        ),
      ),
    );
  }
}

Future<void> _navigateAndDisplaySelection(
    BuildContext context, Game? game) async {
  final result = await Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => DetailScreen(game: game)),
  );

  if (context.mounted) {
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text('$result')));
  }
}
