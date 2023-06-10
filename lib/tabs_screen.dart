import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do/category_screen.dart';
import 'package:to_do/data/dummy_data.dart';
import 'package:to_do/filters_screen.dart';
import 'package:to_do/main_drawer.dart';
import 'package:to_do/meals_screen.dart';
import 'package:to_do/providers/favourites_provier.dart';
import 'package:to_do/models/meal_model.dart';
import 'package:to_do/providers/meals_provider.dart';

const kIntitalFilters = {
  Filters.glutten: false,
  Filters.vegan: false,
  Filters.vegetarian: false,
  Filters.lactose: false,
};

class Tabs extends ConsumerStatefulWidget {
  const Tabs({super.key});

  @override
  ConsumerState<Tabs> createState() {
    return _Tabs();
  }
}

class _Tabs extends ConsumerState<Tabs> {
  int _selectedPage = 0;
  void _selectPage(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  Map<Filters, bool> _selectedFilters = kIntitalFilters;

  void _selectString(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filter') {
      final result = await Navigator.of(context)
          .push<Map<Filters, bool>>(MaterialPageRoute(
              builder: (ctx) => FilterScreen(
                    currentFilters: _selectedFilters,
                  )));

      setState(() {
        _selectedFilters = result ?? kIntitalFilters;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final meals = ref.watch(mealsprovider);
    final availableMeals = meals.where((meal) {
      if (_selectedFilters[Filters.glutten]! && !meal.isGlutenFree) {
        return false;
      }
      if (_selectedFilters[Filters.vegan]! && !meal.isVegan) {
        return false;
      }
      if (_selectedFilters[Filters.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (_selectedFilters[Filters.lactose]! && !meal.isLactoseFree) {
        return false;
      }
      return true;
    }).toList();

    Widget activePage = CategoryScreen(
      availableMeals: availableMeals,
    );
    var activePageTitle = 'Categories';

    if (_selectedPage == 1) {
      final favMeals = ref.watch(favouritesProvider);
      activePage = MealsScreen(
        meals: favMeals,
      );
      activePageTitle = 'Favourites';
    }

    return (Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      body: activePage,
      drawer: MainDrawer(selectScreen: _selectString),
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          currentIndex: _selectedPage,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.set_meal), label: 'Category'),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favourites')
          ]),
    ));
  }
}
