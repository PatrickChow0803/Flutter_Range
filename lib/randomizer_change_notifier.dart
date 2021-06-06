import 'dart:math';

import 'package:flutter/foundation.dart';

class RandomizerChangeNotifier extends ChangeNotifier {
  final _randomGenerator = Random();
  int? _generatedNumber;

  int? get generatedNumber => _generatedNumber;

  int min = 0;
  int max = 0;

  void generateRandomNumber() {
    _generatedNumber = min + _randomGenerator.nextInt(max + 1 - min);
    // rebuilds the ui that is observing this listener
    notifyListeners();
  }
}
