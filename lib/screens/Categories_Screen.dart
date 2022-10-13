import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/category_item.dart';

//  قائمة التصنيفات وانواع الطعام
class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("meal"),
      // ),
       body: GridView(
          padding: EdgeInsets.all(25),
          //حولنا ال ليست اوف اوبجيت الى ليست اوف وجيت ليتم عرضها ب الجريد
          //هنستعل دالة الماب وبعد منحول لماب بنرجع نحولها لليست
          //  في الماب بنعرف متغير وراح يمرر بداخل ال DUMMY_CATEGORIES راح يفوت على كل العناصر بداخلها وياخد قيم الاوبجيكت الي داخلها
          //catData.title راح يعرض التايتل
          //catData.color بعرض اللون
          //catData.id راح يعرض الاي دي
          //catData  راح يمر على كل الاوبجيت وياخد القيم الموجودة فيها
         //CategoryItem عملنا تمرير للبيانات
          children: DUMMY_CATEGORIES.map((catData) =>
          CategoryItem(catData.id,catData.title,catData.color),
          ).toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200, //كل عنصر عرضو 200
            childAspectRatio: 3 / 2, //نسبة عرض الى الارتفاع
            crossAxisSpacing: 20, //المسافات بين العناصر
            mainAxisSpacing: 20,
          ),
        ),

    );
  }
}
