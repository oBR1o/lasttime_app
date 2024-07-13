import 'package:flutter/material.dart';
import 'package:lasttime/widgets/lasttime_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Last Time',
            style: TextStyle(
              color: Color.fromARGB(255, 218, 192, 163),
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 16, 44, 87),
        ),
        body: const TabBarView(
          children: [
            LastTimePage(),
            Text('This is create Task page'),
          ],
        ),
        bottomNavigationBar: const TabBar(tabs: [
          Tab(
            icon: Icon(Icons.list),
            text: 'Your Task',
          ),
          Tab(icon: Icon(Icons.create)),
        ]),
      ),
    );
  }
}
