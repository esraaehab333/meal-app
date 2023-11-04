import 'dart:developer';


import 'package:flutter/material.dart';

import '../data/dummy_data.dart';
import '../models/meal.dart';
import '../widgets/main_drawer.dart';
import 'category_screens.dart';
import 'filter_screen.dart';
import 'meals_screen.dart';
 const kinitialFilter = {
   Filt.glutenfree: false,
   Filt.lactosefree: false,
   Filt.veganfree: false,
   Filt.vegetarianfree: false,
 };
class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int SelectedPage = 0;
  final List<Meal> _favor = [];
  Map<Filt, bool> selected = kinitialFilter;
  void setScreen(String ident) {
    Navigator.of(context).pop();
    if (ident == "filters") {
      Navigator.push(context, MaterialPageRoute(builder: (ctx) => Filter(
        currentFilter:selected
      )))
          .then((value) => setState(()=> selected = value?? kinitialFilter));
    }
  }

  void _showInfo(String mesa) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(mesa)));
  }

  void _toggle(Meal meal) {
    //عامل زي الكوبس كدا on off
    final isExisting = _favor.contains(meal);
    //هل هي تحتوي ضمن الفايفوريت ترو او فولس
    if (isExisting) {
      setState(() {
        _favor.remove(meal);
      });
      _showInfo("Meal is no longer a favorite");
    } else {
      setState(() {
        _favor.add(meal);
      });
      _showInfo("Marked as a favorite");
    }
  }

  void _selectPage(int index) {
    setState(() {
      SelectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Meal> availableMeals  = dummyMeals.where((meal){
      if(selected[Filt.glutenfree]! && !meal.isGlutenFree){
        // و كان اللي اختاره خالي من الجلوتين و الوجبه فيها جلوتين يبقي ختديني فولس
        return false;
      }
      if(selected[Filt.lactosefree]! && !meal.isLactoseFree){
        // و كان اللي اختاره خالي من الجلوتين و الوجبه فيها جلوتين يبقي ختديني فولس
        return false;
      }
      if(selected[Filt.veganfree]! && !meal.isVegan){
        // و كان اللي اختاره خالي من الجلوتين و الوجبه فيها جلوتين يبقي ختديني فولس
        return false;
      }
      if(selected[Filt.vegetarianfree]! && !meal.isVegetarian){
        // و كان اللي اختاره خالي من الجلوتين و الوجبه فيها جلوتين يبقي ختديني فولس
        return false;
      }
      return true;
    }).toList();
    Widget activePage = CategoryScreens(onToggle: _toggle, availableMeals: availableMeals,);
    var activePagetitle = "Pick your category";
    if (SelectedPage == 1) {
      activePage = Meals(
        meals: _favor,
        onToggle: _toggle,
      );
      activePagetitle = "Favoriets";
    }
    return Scaffold(
      backgroundColor: Color.fromRGBO(250, 248, 237,1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(249, 181, 114,1),
        title: Text(activePagetitle),
      ),
      body: activePage,
      drawer: MainDrawer(onSelect: setScreen),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromRGBO(249, 181, 114,1),
        onTap: _selectPage,
        currentIndex: SelectedPage,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: "Categories"),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favoriets"),
        ],
      ),
    );
  }
}
