import 'package:flutter/material.dart';
import 'package:lasttime/widgets/lasttime_page.dart';
import 'package:lasttime/widgets/lasttime_view.dart';

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
              color: Colors.white,
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 16, 44, 87),
        ),
        body: Container(
          decoration:
              const BoxDecoration(color: Color.fromARGB(255, 248, 240, 229)),
          child: const TabBarView(
            children: [
              LastTimeView(),
              LastTimePage(),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: 50,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 16, 44, 87),
          ),
          child: const TabBar(
            tabs: [
              Tab(
                  icon: Icon(
                Icons.list,
                color: Colors.white,
              )),
              Tab(
                icon: Icon(
                  Icons.create,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
