import 'package:flutter/material.dart';
import 'package:to_do/category_screen.dart';
import 'package:to_do/filters_screen.dart';
import 'package:to_do/main_drawer.dart';
import 'package:to_do/meals_screen.dart';

import 'package:to_do/models/meal_model.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() {
    return _Tabs();
  }
}

class _Tabs extends State<Tabs> {
  int _selectedPage = 0;
  void _selectPage(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  final List<Meal> _favourites = [];

  void _toogleFav(Meal meal, bool isFav) {
    isFav = _favourites.contains(meal);
    if (isFav) {
      setState(() {
        _favourites.remove(meal);
        isFav = false;
      });
      // isFav = false;
    } else {
      setState(() {
        _favourites.add(meal);
        isFav = true;
      });
      // isFav = true;
    }
  }

  void _selectString(String identifier) {
    if (identifier == 'filter') {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (ctx) => FilterScreen()));
    } else {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoryScreen(
      handleFav: _toogleFav,
    );
    var activePageTitle = 'Categories';

    if (_selectedPage == 1) {
      activePage = MealsScreen(
        meals: _favourites,
        handleFav: _toogleFav,
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
