import 'package:flutter/material.dart';

class JobsChips extends StatelessWidget {
  const JobsChips({super.key,required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Chip(label: Text(title), color: WidgetStateProperty.all<Color>(Colors.purple[50]!),);
  }
}