import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RGB Color Picker',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ColorPickerPage(),
    );
  }
}

class ColorPickerPage extends StatefulWidget {
  const ColorPickerPage({super.key});

  @override
  State<ColorPickerPage> createState() => _ColorPickerPageState();
}

class _ColorPickerPageState extends State<ColorPickerPage> {
  double _red = 0;
  double _green = 0;
  double _blue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Flutter Demo Home Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: Color.fromRGBO(_red.toInt(), _green.toInt(), _blue.toInt(), 1),
                border: Border.all(color: Colors.black12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    spreadRadius: 2,
                  )
                ],
              ),
            ),

            const SizedBox(height: 50), // Відступ

            // Секція RED
            _buildColorSlider(
                label: 'Red',
                value: _red,
                color: Colors.red,
                onChanged: (newValue) {
                  setState(() {
                    _red = newValue;
                  });
                }
            ),

            // Секція GREEN
            _buildColorSlider(
                label: 'Green',
                value: _green,
                color: Colors.green,
                onChanged: (newValue) {
                  setState(() {
                    _green = newValue;
                  });
                }
            ),

            // Секція BLUE
            _buildColorSlider(
                label: 'Blue',
                value: _blue,
                color: Colors.blue,
                onChanged: (newValue) {
                  setState(() {
                    _blue = newValue;
                  });
                }
            ),
          ],
        ),
      ),
    );
  }

  // Допоміжний метод для створення повзунка (щоб не дублювати код 3 рази)
  Widget _buildColorSlider({
    required String label,
    required double value,
    required Color color,
    required Function(double) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Текстовий підпис, наприклад: "Red: 125"
        RichText(
          text: TextSpan(
            style: const TextStyle(fontSize: 16, color: Colors.black),
            children: [
              TextSpan(text: '$label: ', style: const TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(text: '${value.toInt()}', style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        Slider(
          value: value,
          min: 0,
          max: 255,
          activeColor: Colors.deepPurple, // Колір активної частини як на скріншоті
          thumbColor: Colors.deepPurple,
          onChanged: onChanged,
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}