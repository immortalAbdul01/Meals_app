import 'package:flutter/material.dart';
import 'package:to_do/main.dart';
import 'package:to_do/main_drawer.dart';
import 'package:to_do/tabs_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do/providers/filters_provider.dart';

enum Filters { glutten, lactose, vegetarian, vegan }

class FilterScreen extends ConsumerWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);
    return Scaffold(
        appBar: AppBar(title: const Text('Filtered Items')),
        body: Column(
          children: [
            SwitchListTile(
              value: activeFilters[Filter.glutten]!,
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
                ref
                    .read(filtersProvider.notifier)
                    .setFilter(Filter.glutten, isChecked);
              },
            ),
            SwitchListTile(
              value: activeFilters[Filter.lactose]!,
              title: Text(
                'Lactose free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                'only includes glutten free',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              onChanged: (isChecked) {
                ref
                    .read(filtersProvider.notifier)
                    .setFilter(Filter.lactose, isChecked);
              },
            ),
            SwitchListTile(
              value: activeFilters[Filter.vegetarian]!,
              title: Text(
                'Vegetarian',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                'only includes glutten free',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              onChanged: (isChecked) {
                ref
                    .read(filtersProvider.notifier)
                    .setFilter(Filter.vegetarian, isChecked);
              },
            ),
            SwitchListTile(
              value: activeFilters[Filter.vegan]!,
              title: Text(
                'Vegan',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                'only includes glutten free',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              onChanged: (isChecked) {
                ref
                    .read(filtersProvider.notifier)
                    .setFilter(Filter.vegan, isChecked);
              },
            )
          ],
        ));
  }
}
