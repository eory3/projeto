import 'package:flutter/material.dart';
import 'package:projeto/app/app_properties.dart';

class BottomNavigationBarPage extends StatelessWidget {
  final PageController pageViewController;

  const BottomNavigationBarPage({
    Key? key,
    required this.pageViewController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: pageViewController,
      builder: (context, snapshot) {
        return BottomNavigationBar(
          currentIndex: pageViewController.page?.round() ?? 0,
          onTap: (index) {
            pageViewController.animateToPage(
              index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.ease,
            );
          },
          selectedItemColor: primary,
          unselectedItemColor: dark,
          selectedLabelStyle: const TextStyle(
            fontFamily: fontFamily,
            fontSize: sizeSmall,
          ),
          showUnselectedLabels: true,
          items: [
            bottomNavigationBarItem(
              icon: Icons.home,
              label: 'Home',
            ),
            bottomNavigationBarItem(
              icon: Icons.search,
              label: 'Informações',
            ),
            bottomNavigationBarItem(
              icon: Icons.list_alt,
              label: 'Acessos',
            ),
            bottomNavigationBarItem(
              icon: Icons.person,
              label: 'Perfil',
            ),
          ],
        );
      },
    );
  }

  // Extraido para evitar repetições
  bottomNavigationBarItem({required icon, required String label}) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
      tooltip: label,
    );
  }
}
