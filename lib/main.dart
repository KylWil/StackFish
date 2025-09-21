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
                    onPressed: null,
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