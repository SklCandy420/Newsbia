import 'package:flutter/material.dart';
import 'package:newsbia/model/categories.dart';
import 'package:newsbia/pages/home/news_list.dart';
import 'package:newsbia/widgets/logo.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categories = Category.all();

    return DefaultTabController(
      length: categories.length,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            isScrollable: true,
            tabs: [...categories.map((category) => Tab(text: category.label))],
          ),
          title: Logo(),
        ),
        body: TabBarView(
          physics: BouncingScrollPhysics(),
          children: [
            ...categories.map((category) => NewsList(category: category))
          ],
        ),
      ),
    );
  }
}
