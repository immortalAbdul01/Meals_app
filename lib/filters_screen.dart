import 'package:flutter/material.dart';
import 'package:to_do/main.dart';
import 'package:to_do/main_drawer.dart';
import 'package:to_do/tabs_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do/providers/filters_provider.dart';

enum Filters { glutten, lactose, vegetarian, vegan }

class FilterScreen extends ConsumerStatefulWidget {
  const FilterScreen({super.key});

  @override
  ConsumerState<FilterScreen> createState() {
    return _FilterScreen();
  }
}

class _FilterScreen extends ConsumerState<FilterScreen> {
  var gluttenFree = false;
  var LactoseFree = false;
  var Vegetarian = false;
  var Veganfree = false;

  @override
  void initState() {
    final activeFilters = ref.read(filtersProvider);
    super.initState();

    gluttenFree = activeFilters[Filter.glutten]!;
    LactoseFree = activeFilters[Filter.lactose]!;
    Vegetarian = activeFilters[Filter.vegetarian]!;
    Veganfree = activeFilters[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Filtered Items')),
      body: Column(
        children: [
          WillPopScope(
            onWillPop: () async {
              ref.read(filtersProvider.notifier).setFilters({
                Filter.glutten: gluttenFree,
                Filter.lactose: LactoseFree,
                Filter.vegetarian: Vegetarian,
                Filter.vegan: Veganfree
              });
              Navigator.of(context).pop();

              return true;
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
