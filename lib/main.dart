import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeData _themeData = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
  );

  void _setTheme(Color seedColor) {
    setState(() {
      _themeData = ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: seedColor),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StackFish',
      theme: _themeData,
      home: MyHomePage(
        title: 'StackFish Home Page',
        onThemeChanged: _setTheme,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, required this.onThemeChanged});

  final String title;
  final void Function(Color) onThemeChanged;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 60),
                  FloatingActionButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: SizedBox(
                              width: 286,
                              height: 600,
                              child: InfoWindow(title: "Information")
                            ),
                          );
                        }
                      );
                    },
                    tooltip: 'Info',
                    child: const Icon(Icons.info_outline),
                  ),
                  const SizedBox(height: 10),
                  FloatingActionButton(
                    onPressed:  () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: SizedBox(
                              width: 286,
                              height: 220,
                              child: ThemeWindow(title: "Select Theme",
                                     onThemeChanged: widget.onThemeChanged,),
                            ),
                          );
                        },
                      );
                    },
                    tooltip: 'Set Theme',
                    child: const Icon(Icons.color_lens_outlined),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
                padding: const EdgeInsets.all(36.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FloatingActionButton(
                      onPressed: null,
                      tooltip: 'Add Action',
                      child: const Icon(Icons.add_circle_outline),
                    ),
                    const SizedBox(height: 10),
                    FloatingActionButton(
                        onPressed: null,
                        tooltip: 'Reset Stack',
                        child: const Icon(Icons.autorenew)
                    ),
                    const SizedBox(height: 256),
                  ]
                )
            )
          )
        ],
      ),
    );
  }

}

class ThemeWindow extends StatefulWidget {
  const ThemeWindow({super.key, required this.title, required this.onThemeChanged});
  final String title;
  final void Function(Color) onThemeChanged;

  @override
  State<ThemeWindow> createState() => _ThemeWindowState();
}

class _ThemeWindowState extends State<ThemeWindow> {
  final List<Color> themeColors = [
    Colors.red,
    Colors.deepOrange,
    Colors.orange,
    Colors.orangeAccent,
    Colors.yellow,
    Colors.lightGreen,
    Colors.green,
    Colors.teal,
    Colors.blue,
    Colors.deepPurple,
    Colors.purple,
    Colors.purpleAccent,
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        children: themeColors.map((color) {
          return FloatingActionButton(
            onPressed: () {
              widget.onThemeChanged(color);
            },
            backgroundColor: color,
            tooltip: color.toString(),
          );
        }).toList(),
      ),
    );
  }
}

class InfoWindow extends StatefulWidget {
  const InfoWindow({super.key, required this.title});
  final String title;

  @override
  State<InfoWindow> createState() => _InfoWindowState();
}

class _InfoWindowState extends State<InfoWindow> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Container(
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
          color: Colors.white, // optional background
        ),
        child: SingleChildScrollView(
          child: RichText(
            text: TextSpan(
              style: TextStyle(
                fontSize: 14,
                height: 1.5,
                color: Colors.black, // must set color for TextSpan
              ),
              children: [
                TextSpan(
                  text: 'Disclaimer\n\n',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                TextSpan(
                  text:
                  'This application is provided free of charge and will always remain free to use. '
                      'The source code is open and licensed under the MIT License, allowing anyone to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the software. '
                      'You are free to fork, adapt, and use the application for any purpose, including personal, educational, or commercial use. '
                      'This software is provided "as is," without warranty of any kind, express or implied, including but not limited to the warranties of merchantability, fitness for a particular purpose, and noninfringement. '
                      'In no event shall the authors or copyright holders be liable for any claim, damages, or other liability, whether in an action of contract, tort, or otherwise, arising from, out of, or in connection with the software or the use or other dealings in the software.',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
