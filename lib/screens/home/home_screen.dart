import 'package:artisan/components/customdrawer/custom_drawer.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Scaffold(
        drawer: CustomDrawer(),
        appBar: AppBar(),

      ),
    );
  }
}
