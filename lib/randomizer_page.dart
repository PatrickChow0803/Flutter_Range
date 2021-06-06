import 'dart:math';

import 'package:flutter/material.dart';

class RandomizerPage extends StatefulWidget {
  final int min, max;

  const RandomizerPage({
    Key? key,
    required this.min,
    required this.max,
  }) : super(key: key);
  @override
  _RandomizerPageState createState() => _RandomizerPageState();
}

class _RandomizerPageState extends State<RandomizerPage> {
  // nullable since the number isn't generated yet
  int? _generatedNumber;

  final randomGenerator = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Randomizer Generator'),
      ),
      body: Center(
        child: Text(
          _generatedNumber?.toString() ?? 'Generate a Number',
          style: TextStyle(
            fontSize: 40,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Generate'),
        onPressed: () {
          setState(() {
            _generatedNumber = widget.min +
                randomGenerator.nextInt(widget.max + 1 - widget.min);
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
