
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget{

  final String idMeal;

  DetailScreen({required this.idMeal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Text(
          idMeal
        )
      ),
    );
  }
}