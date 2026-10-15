import 'package:flutter/material.dart';
import 'package:fluttering/models/question.dart';

class Category {

  final String id;
  final String name;
  final IconData iconPath; // o IconData para la UI
  final List<Question> questions;

  Category({
    required this.id,
    required this.name,
    required this.iconPath,
    required this.questions,
  });

}