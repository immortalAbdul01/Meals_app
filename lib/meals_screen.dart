import 'package:flutter/material.dart';
import 'package:to_do/meals_details.dart';
import 'package:to_do/models/meal_model.dart';

class MealsScreen extends StatelessWidget {
  MealsScreen({super.key, this.title, required this.meals});
  final String? title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) => MealsDetails(
              meal: meals[index],
            ));

    if (meals.isEmpty) {
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'OOps nothing here ',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            Text(
              'try something different category ',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            )
          ],
        ),
      );
    }

    if (title == null) {
      return content;
    }
    return (Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content,
    ));
  }
}
