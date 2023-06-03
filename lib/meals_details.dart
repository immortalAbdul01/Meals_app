import 'package:flutter/material.dart';
import 'package:to_do/models/meal_model.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:to_do/meals_item_trait.dart';

class MealsDetails extends StatelessWidget {
  const MealsDetails({super.key, required this.meal});
  final Meal meal;

  get ComplexityText {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1).toLowerCase();
  }

  get AffordabilityText {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1).toLowerCase();
  }

  @override
  Widget build(BuildContext context) {
    return (Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      margin: const EdgeInsets.all(8),
      elevation: 2,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () {},
        child: Stack(
          children: [
            FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(meal.imageUrl),
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.black54,
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 44),
                  child: Column(
                    children: [
                      Text(
                        meal.title,
                        textAlign: TextAlign.center,
                        softWrap: true,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ItemDetails(
                              icon: Icons.schedule_outlined,
                              label: '${meal.duration} min'),
                          const SizedBox(
                            width: 14,
                          ),
                          ItemDetails(icon: Icons.work, label: ComplexityText),
                          const SizedBox(
                            width: 14,
                          ),
                          ItemDetails(
                              icon: Icons.attach_money,
                              label: AffordabilityText),
                          const SizedBox(
                            width: 14,
                          ),
                        ],
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    ));
  }
}
