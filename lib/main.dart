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
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
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
      title: 'Flutter Demo',
      theme: _themeData,
      home: MyHomePage(
        title: 'Flutter Demo Home Page',
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
                    tooltip: 'Set Theme',
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
  @override
  Widget build(BuildContext context) {
    return Padding(
              padding: EdgeInsets.all(16.0),
              child: Wrap (
                spacing: 10,
                runSpacing: 10,
                children: [
                  FloatingActionButton(
                    onPressed: () => widget.onThemeChanged(Colors.red),
                    tooltip: 'Test',
                    backgroundColor: Colors.red,
                  ),
                  FloatingActionButton(
                    onPressed: () => widget.onThemeChanged(Colors.deepOrange),
                    tooltip: 'Test',
                    backgroundColor: Colors.deepOrange,
                  ),
                  FloatingActionButton(
                    onPressed: () => widget.onThemeChanged(Colors.orange),
                    tooltip: 'Test',
                    backgroundColor: Colors.orange,
                  ),
                  FloatingActionButton(
                    onPressed: () => widget.onThemeChanged(Colors.orangeAccent),
                    tooltip: 'Test',
                    backgroundColor: Colors.orangeAccent,
                  ),
                  FloatingActionButton(
                    onPressed: () => widget.onThemeChanged(Colors.yellow),
                    tooltip: 'Test',
                    backgroundColor: Colors.yellow,
                  ),
                  FloatingActionButton(
                    onPressed: () => widget.onThemeChanged(Colors.lightGreen),
                    tooltip: 'Test',
                    backgroundColor: Colors.lightGreen,
                  ),
                  FloatingActionButton(
                    onPressed: () => widget.onThemeChanged(Colors.green),
                    tooltip: 'Test',
                    backgroundColor: Colors.green,
                  ),
                  FloatingActionButton(
                    onPressed: () => widget.onThemeChanged(Colors.teal),
                    tooltip: 'Test',
                    backgroundColor: Colors.teal,
                  ),
                  FloatingActionButton(
                    onPressed: () => widget.onThemeChanged(Colors.blue),
                    tooltip: 'Test',
                    backgroundColor: Colors.blue,
                  ),
                  FloatingActionButton(
                    onPressed: () => widget.onThemeChanged(Colors.deepPurple),
                    tooltip: 'Test',
                    backgroundColor: Colors.deepPurple,
                  ),
                  FloatingActionButton(
                    onPressed: () => widget.onThemeChanged(Colors.purple),
                    tooltip: 'Test',
                    backgroundColor: Colors.purple,
                  ),
                  FloatingActionButton(
                    onPressed: () => widget.onThemeChanged(Colors.purpleAccent),
                    tooltip: 'Test',
                    backgroundColor: Colors.purpleAccent,
                  ),
                ],
              ),
            );

  }
}