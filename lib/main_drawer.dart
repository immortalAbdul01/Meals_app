import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.selectScreen});

  final void Function(String identifier) selectScreen;
  @override
  Widget build(BuildContext context) {
    return (Drawer(
      child: Column(
        children: [
          DrawerHeader(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.pink, Colors.pink.withOpacity(0.8)],
                      begin: Alignment.topRight,
                      end: Alignment.bottomRight)),
              child: Row(
                children: [
                  Icon(
                    Icons.lunch_dining,
                    size: 59,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Meals App',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground),
                  )
                ],
              )),
          ListTile(
            leading: Icon(
              Icons.restaurant,
              size: 23,
              color: Theme.of(context).colorScheme.onBackground,
            ),
            title: Text(
              'Resturant',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            onTap: () {
              selectScreen('meals');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              size: 23,
              color: Theme.of(context).colorScheme.onBackground,
            ),
            title: Text(
              'Filters',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            onTap: () {
              selectScreen('filter');
            },
          )
        ],
      ),
    ));
  }
}
