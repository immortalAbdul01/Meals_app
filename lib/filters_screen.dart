import 'package:flutter/material.dart';
import 'package:to_do/main.dart';
import 'package:to_do/main_drawer.dart';
import 'package:to_do/tabs_screen.dart';

enum Filters { glutten, lactose, vegetarian, vegan }

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key, required this.currentFilters});

  final Map<Filters, bool> currentFilters;

  @override
  State<StatefulWidget> createState() {
    return _FilterScreen();
  }
}

class _FilterScreen extends State<FilterScreen> {
  var gluttenFree = false;
  var LactoseFree = false;
  var Vegetarian = false;
  var Veganfree = false;

  @override
  void initState() {
    super.initState();
    gluttenFree = widget.currentFilters[Filters.glutten]!;
    LactoseFree = widget.currentFilters[Filters.lactose]!;
    Vegetarian = widget.currentFilters[Filters.vegetarian]!;
    Veganfree = widget.currentFilters[Filters.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Filtered Items')),
      body: Column(
        children: [
          WillPopScope(
            onWillPop: () async {
              Navigator.of(context).pop({
                Filters.glutten: gluttenFree,
                Filters.lactose: LactoseFree,
                Filters.vegetarian: Vegetarian,
                Filters.vegan: Veganfree
              });

              return false;
            },
            child: (SwitchListTile(
              value: gluttenFree,
              title: Text(
                'Glutten free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                'only includes glutten free',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              onChanged: (isChecked) {
                setState(() {
                  gluttenFree = isChecked;
                });
              },
            )),
          ),
          SwitchListTile(
            value: LactoseFree,
            title: Text(
              'Lactose free',
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
                LactoseFree = isChecked;
              });
            },
          ),
          SwitchListTile(
            value: Vegetarian,
            title: Text(
              'Vegetarian',
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
                Vegetarian = isChecked;
              });
            },
          ),
          SwitchListTile(
            value: Veganfree,
            title: Text(
              'Vegan',
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
                Veganfree = isChecked;
              });
            },
          )
        ],
      ),
    );
  }
}
