import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelect});

  final void Function (String identefier) onSelect;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.primaryContainer,
                Theme.of(context).colorScheme.primaryContainer.withOpacity(0.8)
              ],
            )),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood_outlined,
                  size: 50,
                  color: Theme.of(context).colorScheme.primary,
                ),
                SizedBox(width: 20,),
                Text (
                  "Cooking up ...",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary
                  ),
                )
              ],
            ),
          ),
          ListTile(
            title: Text (
              "Meals",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary
              ),
            ) ,
            leading: Icon(
              Icons.restaurant,
              color: Theme.of(context).colorScheme.onBackground,
            ),
            onTap: (){
              //Navigator.of(context).pop();
              onSelect("meals");
            },
          ),
          ListTile(
            title: Text (
              "Filters",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary
              ),
            ) ,
            leading: Icon(
              Icons.settings,
              color: Theme.of(context).colorScheme.onBackground,
            ),
            onTap: (){
             // Navigator.of(context).pop();
              onSelect("filters");
            },
          ),
        ],
      ),
    );
  }
}
