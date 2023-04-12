import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class TaskObject{
  final String title;
  late bool doneOrNot;

  TaskObject({
    required this.title,
    required this.doneOrNot,
  });

}