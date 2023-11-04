import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;
  final Color color;
  final String img ;
  const Category({
    required this.img,
    required this.id,
    required this.title,
    required this.color
  });
}
