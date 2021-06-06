import 'package:flutter/material.dart';

class RangeSelectorPage extends StatefulWidget {
  RangeSelectorPage({Key? key}) : super(key: key);

  @override
  _RangeSelectorPageState createState() => _RangeSelectorPageState();
}

class _RangeSelectorPageState extends State<RangeSelectorPage> {
  // key used so that the FAB can interact with the Form widget
  final formKey = GlobalKey<FormState>();
  int _min = 0;
  int _max = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Range Selector"),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RangeSelectorTextFormField(
                labelText: 'Minimum',
                intValueSetter: (value) => _min = value,
              ),
              const SizedBox(height: 16),
              RangeSelectorTextFormField(
                labelText: 'Maximum',
                intValueSetter: (value) => _max = value,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_right),
        onPressed: () {
          // Calls the FormFields to validate themselves
          if (formKey.currentState?.validate() == true) {
            // what actually makes the min and max variables store their values
            formKey.currentState?.save();
          }
        },
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
  final void Function(int value) intValueSetter;

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
