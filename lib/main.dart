import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = "Colour and Name App";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: _title),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String inputText = "Name: ";
  Color chosenColour = Colors.white;

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
            const Text("Get ones identity"),
            ElevatedButton(
                onPressed: () {
                  _navigateAndGetIdentity(context).then((value) {
                    setState(() {
                      if (value[0] != "" && value[1] != "") {
                        inputText = "${value[0]}'s name: ${value[1]}";
                      }
                    });
                  });
                },
                child: const Text("Get identity")),
            Flexible(
              child: FractionallySizedBox(
                widthFactor: 1,
                heightFactor: 0.2,
                child: Container(
                    color: chosenColour,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(inputText),
                        ])),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  _navigateAndGetColour(context).then((value) {
                    setState(() {
                      chosenColour = value;
                    });
                  });
                },
                child: const Text("Get ones colour")),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class ColourScreen extends StatefulWidget {
  const ColourScreen({super.key});

  @override
  State<ColourScreen> createState() => _ColourScreenState();
}

class _ColourScreenState extends State<ColourScreen> {
  Color colourCombination = Colors.black;
  String dropDownValue1 = "00";
  String dropDownValue2 = "00";
  String dropDownValue3 = "00";

  List<String> items = [
    "00",
    "10",
    "20",
    "30",
    "40",
    "50",
    "60",
    "70",
    "80",
    "90",
    "A0",
    "B0",
    "C0",
    "D0",
    "E0",
    "F0",
    "FF"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Choose colour"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // TODO: Add identity transfer to finish assignment
            SizedBox(
              width: 300.0,
              height: 100.0,
              child: DecoratedBox(
                decoration: BoxDecoration(color: colourCombination),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DropdownButton(
                  // Initial Value
                  value: dropDownValue1,

                  // Down Arrow Icon
                  icon: const Icon(Icons.keyboard_arrow_down),

                  // Array list of items
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (String? newValue) {
                    setState(() {
                      dropDownValue1 = newValue!;
                      colourCombination = Color(int.parse(
                          "0xFF$dropDownValue1$dropDownValue2$dropDownValue3"));
                    });
                  },
                ),
                DropdownButton(
                  // Initial Value
                  value: dropDownValue2,

                  // Down Arrow Icon
                  icon: const Icon(Icons.keyboard_arrow_down),

                  // Array list of items
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (String? newValue) {
                    setState(() {
                      dropDownValue2 = newValue!;
                      colourCombination = Color(int.parse(
                          "0xFF$dropDownValue1$dropDownValue2$dropDownValue3"));
                    });
                  },
                ),
                DropdownButton(
                  // Initial Value
                  value: dropDownValue3,

                  // Down Arrow Icon
                  icon: const Icon(Icons.keyboard_arrow_down),

                  // Array list of items
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (String? newValue) {
                    setState(() {
                      dropDownValue3 = newValue!;
                      colourCombination = Color(int.parse(
                          "0xFF$dropDownValue1$dropDownValue2$dropDownValue3"));
                    });
                  },
                ),
              ],
            ),
            ElevatedButton(
              child: const Text("Send"),
              onPressed: () {
                //Navigator.pop(context, colourCombination);
                setState(() {
                  Navigator.pop(context, colourCombination);
                });
              },
            )
          ],
        ),
      ),
    );
  }
}

class NameScreen extends StatefulWidget {
  const NameScreen({super.key});

  @override
  State<NameScreen> createState() => _NameScreen();
}

class _NameScreen extends State<NameScreen> {
  String? name = '';
  String? identity = '';
  final TextEditingController textController = TextEditingController();

  static const snackBar = SnackBar(
    content: Text('Please choose an identity and a name...'),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Choose identity"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("Choose identity"),
            RadioListTile(
              title: const Text("Mother"),
              value: "Mother",
              groupValue: identity,
              onChanged: (value) {
                setState(() {
                  identity = value;
                });
              },
            ),
            RadioListTile(
              title: const Text("Father"),
              value: "Father",
              groupValue: identity,
              onChanged: (value) {
                setState(() {
                  identity = value;
                });
              },
            ),
            RadioListTile(
              title: const Text("Cat"),
              value: "Cat",
              groupValue: identity,
              onChanged: (value) {
                setState(() {
                  identity = value;
                });
              },
            ),
            RadioListTile(
              title: const Text("Dog"),
              value: "Dog",
              groupValue: identity,
              onChanged: (value) {
                setState(() {
                  identity = value;
                });
              },
            ),
            if (identity != "") Text("$identity's name:"),
            TextField(
                controller: textController,
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                }),
            ElevatedButton(
              child: const Text("Send"),
              onPressed: () {
                if (identity == "" || name == "") {
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                } else {
                  Navigator.pop(context, [identity, name]);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

Future<List<String?>> _navigateAndGetIdentity(BuildContext context) async {
  final result = await Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const NameScreen()),
  );

  if (context.mounted) {
    try {
      return result;
    } catch (e) {
      return ["", ""];
    }
  }

  return ["No identity", "No name"];
}

Future<Color> _navigateAndGetColour(BuildContext context) async {
  final result = await Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const ColourScreen()),
  );

  if (context.mounted) {
    try {
      return result;
    } catch (e) {
      return Colors.white;
    }
  }

  return Colors.white;
}
