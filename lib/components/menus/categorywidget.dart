import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:dan_resto/data/model/category.dart';

class CategoryWidget extends StatelessWidget {
  final List<Category> categories;

  CategoryWidget({required this.categories});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: categories.length,
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(left: 14.0),
          child: Chip(
            padding: EdgeInsets.all(0),
            backgroundColor: Colors.purple,
            label: Text(categories[index].name, style: TextStyle(color: Colors.white)),
          ),
        );
      },
    );
  }
}