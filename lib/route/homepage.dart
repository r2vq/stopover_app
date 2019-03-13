import 'package:flutter/material.dart';
import 'package:stopover_app/route/category_list_page.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Category Screen"),
      ),
      body: Center(
        child: CategoryListPage(),
      ),
    );
  }
}
