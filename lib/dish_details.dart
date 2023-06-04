import 'package:flutter/material.dart';
import 'package:to_do/models/meal_model.dart';

class DishDetails extends StatefulWidget {
  const DishDetails({super.key, required this.meal, required this.handleFav});

  final void Function(Meal meal, bool isFav) handleFav;
  final Meal meal;
  @override
  State<StatefulWidget> createState() {
    return _DishDetails(
      meal: meal,
      handleFav: handleFav,
    );
  }
}

class _DishDetails extends State<DishDetails> {
  _DishDetails({required this.meal, required this.handleFav});

  final void Function(Meal meal, bool isFav) handleFav;
  final Meal meal;
  var isFav = false;
  Widget starIcon = Icon(Icons.star_purple500);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
              onPressed: () {
                handleFav(meal, isFav);
                setState(() {
                  if (isFav) {
                    starIcon = Icon(Icons.star_purple500);
                    // isFav = false;
                  } else {
                    starIcon = Icon(Icons.star);
                    // isFav = true;
                  }
                });
              },
              icon: starIcon)
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
