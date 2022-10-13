import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeNamed = '/filters';
  final saveFilters; //نوعها function
  //هي ال function الي مررتها عن طريق الكونستركتر عن طريق الراوت
  final currentFilters; //Map <String,bool>  اسمها current

  //اعطيتو كونستركتور عشان اقدر استدعيه عن طريق الراوت واعطيه قيممة الفينكشن
  FiltersScreen(this.saveFilters, this.currentFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _isGlutenFree = false;
  bool _isLactoseFree = false;
  bool _isVegan = false;
  bool _isVegetarian = false;

  @override
  initState() {
    //عملنا اوفر رايد لل function initState
    //راح نوخد المتغيرات الاربعة ونغير قيميهم عن طريق القيم المستوردة من ال current
    //ونسند قيم جديدة للمتغيرات
    _isGlutenFree = widget.currentFilters['gluten'];
    _isLactoseFree = widget.currentFilters['lactose'];
    _isVegan = widget.currentFilters['vegan'];
    _isVegetarian = widget.currentFilters['vegetarian'];
    super.initState();
  }

  Widget buildSwitchListTile(
      String title, String description, bool currentValue, updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updateValue,
      //updateValue اصلها فونيكشن
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Filters"),
        actions: [
          IconButton(
            //اقون بوتون عشان لمه اضغط عليها تقوم بالحفظ
            icon: Icon(Icons.save),
            onPressed: () {
              //function  لمه اضغط عليها تتنفد
              //راح نكتبها بالمين ونربطها مع بعض
              final Map<String, bool> selectedFilters = {
                //نوعها   Map<String, bool>
                //ماب معينة قيمها المفروض تتساوى مع قيم المتغيرات الاربعة الي عرفناهم
                'gluten': _isGlutenFree,
                'lactose': _isLactoseFree,
                'vegan': _isVegan,
                'vegetarian': _isVegetarian,
              };
              widget.saveFilters(selectedFilters);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Adjust your meal selection.",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            //تاخد كل المساحة المتبقية في الكلوم ةتتحكم فيه
            child: ListView(
              children: [
                buildSwitchListTile(
                  "Gluten-free",
                  "Only include gluten-free meals.",
                  _isGlutenFree,
                  (newValue) {
                    setState(() {
                      _isGlutenFree = newValue;
                    });
                  },
                ),
                buildSwitchListTile(
                  "Lactose-Free",
                  "Only include LactoseFree meals.",
                  _isLactoseFree,
                  (newValue) {
                    setState(() {
                      _isLactoseFree = newValue;
                    });
                  },
                ),
                buildSwitchListTile(
                  "Vegetarian",
                  "Only include Vegetarian meals.",
                  _isVegetarian,
                  (newValue) {
                    setState(() {
                      _isVegetarian = newValue;
                    });
                  },
                ),
                buildSwitchListTile(
                  "Vegan",
                  "Only include Vegan meals.",
                  _isVegan,
                  (newValue) {
                    setState(() {
                      _isVegan = newValue;
                    });
                  },
                ),
              ],
            ),
          )
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
