import 'package:flutter/material.dart';
import 'package:to_do/main.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _FilterScreen();
  }
}

class _FilterScreen extends State<FilterScreen> {
  var gluttenFree = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Filtered Items')),
      body: (SwitchListTile(
        value: gluttenFree,
        title: Text(
          'Glutten free',
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
        subtitle: Text(
          'only includes glutten free',
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
        onChanged: (isChecked) {
          setState(() {
            gluttenFree = isChecked;
          });
        },
      )),
    );
  }
}
