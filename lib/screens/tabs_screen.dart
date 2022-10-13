import 'package:flutter/material.dart';
import '../modules/meal.dart';
import '../widgets/main_drawer.dart';
import '../screens/Categories_Screen.dart';
import '../screens/favorites_screen.dart';

class TapsScreen extends StatefulWidget {
  final List<Meal>
      favoriteMeals; // استقبلنها عن طريق الكونستركتور وبدنا نوجها ونعطيها لل favoriteScreen
  TapsScreen(this.favoriteMeals);

  @override
  _TapsScreenState createState() => _TapsScreenState();
}

class _TapsScreenState extends State<TapsScreen> {
  late List _pages; //عرفنا ال  pages  واعطناه قيمة عن طريق  initState
  //<Map<String , Object>> نوعها

  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {
        'page': CategoriesScreen(),
        'title': 'Categories',
      },
      {
        'page': FavoritesScreen(widget.favoriteMeals),
        'title': 'Favorites',
      }
    ];
  }

  void _selectPage(int value) {
    setState(() {
      _selectedPageIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Favorites",
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
