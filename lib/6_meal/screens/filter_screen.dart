
import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class Filter extends StatefulWidget {
  const Filter({super.key , required this.currentFilter});

  @override
  State<Filter> createState() => _FilterState();
  final Map<Filt , bool >currentFilter;
}

enum Filt { glutenfree, lactosefree, veganfree, vegetarianfree }

class _FilterState extends State<Filter> {
  bool _glutenfree = false;
  bool _lactosefree = false;
  bool _veganfree = false;
  bool _vegetarianfree = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // اول داله بتتنفذ
    _glutenfree = widget.currentFilter[Filt.glutenfree]!;
    _lactosefree= widget.currentFilter[Filt.lactosefree]!;
    _vegetarianfree = widget.currentFilter[Filt.vegetarianfree]!;
    _veganfree = widget.currentFilter[Filt.veganfree]!;
  }
  @override
  Widget build(BuildContext context) {
    //void setScreen(String ident) {
    //  if (ident == "filters") {
     //   Navigator.of(context).pop();
    //  } else {
      //  Navigator.pushReplacement(
     //       context, MaterialPageRoute(builder: (ctx) => TabsScreen()));
    //  }
   // }

    return Scaffold(
      appBar: AppBar(
        title: Text("Your Filters"),
      ),
    //  drawer: MainDrawer(onSelect: setScreen),
      body: WillPopScope(
        onWillPop: () async{
          Navigator.of(context).pop({
            Filt.glutenfree : _glutenfree,
            Filt.lactosefree :_lactosefree,
            Filt.veganfree :_veganfree,
            Filt.vegetarianfree :_vegetarianfree
          });
          return false;
      },
        child: Column(
          children: [
            customSwitch(
              context,
              "Gluten-free",
              "Only include gluten-free meals.",
              _glutenfree,
              (bool value) {
                setState(() {
                  _glutenfree = value;
                });
              },
            ),
            customSwitch(context, "Lactose-free",
                "Only include lactose-free meals.", _lactosefree, (bool value) {
              setState(() {
                _lactosefree = value;
              });
            }),
            customSwitch(context, "Vegan-free", "Only include vegan-free meals.",
                _veganfree, (bool value) {
              setState(() {
                _veganfree = value;
              });
            }),
            customSwitch(
                context,
                "Vegetarian-free",
                "Only include vegetarian-free meals.",
                _vegetarianfree, (bool value) {
              setState(() {
                _vegetarianfree = value;
              });
            }),
          ],
        ),
      ),
    );
  }

  SwitchListTile customSwitch(BuildContext context, String title,
      String subtitle, bool filter, Function(bool newValue) onChange) {
    return SwitchListTile(
      title: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: Theme.of(context).colorScheme.primary),
      ),
      subtitle: Text(
        subtitle,
        style: Theme.of(context)
            .textTheme
            .labelMedium!
            .copyWith(color: Theme.of(context).colorScheme.primary),
      ),
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: const EdgeInsets.only(left: 34, right: 22),
      onChanged: onChange,
      value: filter,
    );
  }
}
