import 'package:flutter/material.dart';

class RangeSelectorPage extends StatefulWidget {
  RangeSelectorPage({Key? key}) : super(key: key);

  @override
  _RangeSelectorPageState createState() => _RangeSelectorPageState();
}

class _RangeSelectorPageState extends State<RangeSelectorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Range Selector"),
      ),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RangeSelectorTextFormField(
                labelText: 'Minimum',
              ),
              const SizedBox(height: 16),
              RangeSelectorTextFormField(
                labelText: 'Maximum',
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.arrow_right),
      ),
    );
  }
}

class RangeSelectorTextFormField extends StatelessWidget {
  const RangeSelectorTextFormField({
    Key? key,
    required String this.labelText,
  }) : super(key: key);

  final String labelText;

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
    );
  }
}
