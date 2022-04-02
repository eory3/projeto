import 'package:flutter/material.dart';
import 'package:projeto/app/modules/home/home_page.dart';

import 'components/bottom_navigation_bar.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    final pageViewController = PageController();

    return Scaffold(
      body: PageView(
        controller: pageViewController,
        children: const [
          HomePage(),
          HomePage(),
          HomePage(),
          HomePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBarPage(
        pageViewController: pageViewController,
      ),
    );
  }
}
