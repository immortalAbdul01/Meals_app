import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do/models/meal_model.dart';

class FavouritesNotifer extends StateNotifier<List<Meal>> {
  FavouritesNotifer() : super([]);

  bool toggleFavourites(Meal meal) {
    final isExisting = state.contains(meal);

    if (isExisting) {
      state = state.where((element) => element.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favouritesProvider =
    StateNotifierProvider<FavouritesNotifer, List<Meal>>((ref) {
  return FavouritesNotifer();
});
