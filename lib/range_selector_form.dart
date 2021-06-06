import 'package:flutter/material.dart';
import 'package:flutter_foundation/randomizer_change_notifier.dart';
import 'package:provider/provider.dart';

typedef IntValueSetter = void Function(int value);

class RangeSelectorForm extends StatelessWidget {
  const RangeSelectorForm({
    Key? key,
    required this.formKey,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RangeSelectorTextFormField(
              labelText: 'Minimum',
              intValueSetter: (value) =>
                  context.read<RandomizerChangeNotifier>().min = value,
            ),
            const SizedBox(height: 16),
            RangeSelectorTextFormField(
              labelText: 'Maximum',
              intValueSetter: (value) =>
                  context.read<RandomizerChangeNotifier>().max = value,
            ),
          ],
        ),
      ),
    );
  }
}

class RangeSelectorTextFormField extends StatelessWidget {
  const RangeSelectorTextFormField({
    Key? key,
    required this.labelText,
    // used to lift state up so that the value within this widget gets passed up to the form widget
    required this.intValueSetter,
  }) : super(key: key);

  final String labelText;
  // used to lift state up so that the value within this widget gets passed up to the form widget
  final IntValueSetter intValueSetter;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: labelText,
      ),
      keyboardType: TextInputType.numberWithOptions(
        decimal: false,
        signed: true,
      ),
      validator: (value) {
        // checks to see if the value is null or if unable to parse to an int
        if (value == null || int.tryParse(value) == null) {
          return 'Must be an int';
        } else {
          // returning null means no error message
          return null;
        }
      },
      onSaved: (newValue) => intValueSetter(int.parse(newValue ?? '')),
    );
  }
}
