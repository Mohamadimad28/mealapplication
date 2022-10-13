import 'package:flutter/material.dart';
import '../screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  const CategoryItem(
    this.id,
    this.title,
    this.color,
  );

  //function  خاصة
  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      CategoryMealsScreen.routeName,
      arguments: {
        'id':id,
        'title': title,
      }
    );
  }

//عشان ننسق البيانات بهاد الكلاس
  @override
  Widget build(BuildContext context) {
    //عند الضغط على ال inkwell  يعرض قائمة الوجبات
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: EdgeInsets.all(15),
        //عشان نبعد المحتويات الداخلية
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
        // استدعيت التيم الي عرفتو واعطيتو خصائص وراح يضيف الخصائص الي عرفناها
        // لكل العناصر الي موجودة بال category item  بالنسبة لل title
        decoration: BoxDecoration(
          //تدريج الالوان باستخدام gradient
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              //بقدر اعمل تدرج مع لون نفسو مع شفافية معينة
              color,
              //بعمل gradient  عبال مصل للون الاصلي
            ], //بعطيه اللون الي هياخدو من الاوبجيكت
            begin: Alignment.topLeft, //بداية التدريج
            end: Alignment.bottomRight, //نهاية التدرج
          ),
          borderRadius: BorderRadius.circular(15), //مقدار التدوير
        ),
      ),
    );
  }
}
