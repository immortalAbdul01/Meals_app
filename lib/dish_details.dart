import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do/models/meal_model.dart';
import 'package:to_do/providers/favourites_provier.dart';

class DishDetails extends ConsumerStatefulWidget {
  const DishDetails({
    super.key,
    required this.meal,
  });

  final Meal meal;
  @override
  ConsumerState<DishDetails> createState() {
    return _DishDetails(
      meal: meal,
    );
  }
}

class _DishDetails extends ConsumerState<DishDetails> {
  _DishDetails({required this.meal});

  final Meal meal;
  // var isFav = false;

  @override
  Widget build(BuildContext context) {
    final favouritesList = ref.watch(favouritesProvider);
    final isFav = favouritesList.contains(meal);
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  ref.read(favouritesProvider.notifier).toggleFavourites(meal);
                });
              },
              icon: isFav
                  ? const Icon(Icons.star)
                  : const Icon(Icons.star_outline))
        ],
      ),
      body: SingleChildScrollView(
        child: (Column(children: [
          Image.network(meal.imageUrl),
          Text(
            'Steps :',
            maxLines: 3,
            textAlign: TextAlign.left,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          const SizedBox(
            height: 20,
          ),
          for (final step in meal.steps)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
              child: Text('- $step',
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground)),
            ),
          const SizedBox(
            height: 40,
          ),
          Text(
            'Ingredents :',
            textAlign: TextAlign.left,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          const SizedBox(
            height: 20,
          ),
          for (final step in meal.ingredients)
            Text('- $step',
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground)),
        ])),
      ),
    );
  }
}
