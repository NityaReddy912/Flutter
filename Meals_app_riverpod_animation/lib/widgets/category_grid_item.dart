//4
import 'package:flutter/material.dart';
import 'package:meals_app/models/category.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({super.key,
  required this.category,
  required this.onSelectCategory});

  final Category category;
  final void Function() onSelectCategory;

  @override
  Widget build(BuildContext context) {
    // GestureDetector / Inkwell - make the widget tappable
    return InkWell(
      // onTap: (){debugPrint('Tapped!');},
      //6.1
      onTap: onSelectCategory,
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors:[
              category.color.withOpacity(0.55),
              category.color.withOpacity(0.9),
            ],
            begin:Alignment.topLeft,
            end:Alignment.bottomRight,
            ),
        ),
        child:Text(category.title,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Theme.of(context).colorScheme.onBackground,
        ),)
      ),
    );
  }
}

// //3
// import 'package:flutter/material.dart';
// import 'package:meals_app/models/category.dart';

// class CategoryGridItem extends StatelessWidget {
//   const CategoryGridItem({super.key,
//   required this.category});

//   final Category category;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(16),
//         gradient: LinearGradient(
//           colors:[
//             category.color.withOpacity(0.55),
//             category.color.withOpacity(0.9),
//           ],
//           begin:Alignment.topLeft,
//           end:Alignment.bottomRight,
//           ),
//       ),
//       child:Text(category.title,
//       style: Theme.of(context).textTheme.titleLarge!.copyWith(
//         color: Theme.of(context).colorScheme.onBackground,
//       ),)
//     );
//   }
// }