import 'package:flutter/material.dart';
import 'package:flutter_foundation/randomizer_page.dart';
import 'package:flutter_foundation/range_selector_form.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class RangeSelectorPage extends HookWidget {
  // key used so that the FAB can interact with the Form widget
  final formKey = GlobalKey<FormState>();
  RangeSelectorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // int is the data type expected to use. 0 is the default value
    final min = useState<int>(0);
    final max = useState<int>(0);

    return Scaffold(
      appBar: AppBar(
        title: Text("Range Selector"),
      ),
      body: RangeSelectorForm(
        formKey: formKey,
        minValueSetter: (value) => min.value = value,
        maxValueSetter: (value) => max.value = value,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_right),
        onPressed: () {
          // Calls the FormFields to validate themselves
          if (formKey.currentState?.validate() == true) {
            // what actually makes the min and max variables store their values
            formKey.currentState?.save();
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) =>
                    RandomizerPage(min: min.value, max: max.value),
              ),
            );
          }
        },
      ),
    );
  }
}
