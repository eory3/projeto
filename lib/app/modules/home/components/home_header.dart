import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:projeto/app/app_properties.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(color: primary),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipOval(
                  child: Image.asset(
                    'assets/images/primeiro.jpg',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Text(
                      'Usuário X',
                      style: TextStyle(
                        color: light,
                        fontSize: sizeH6,
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Modular.to.navigate('/auth');
                  },
                  child: const Text(
                    'Sair',
                    style: TextStyle(
                      color: light,
                      fontSize: sizeSmall,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Usuários',
                    style: TextStyle(
                      color: dark,
                      fontWeight: FontWeight.bold,
                      fontSize: sizeP,
                    ),
                  ),
                  Text(
                    'Lista de usuários',
                    style: TextStyle(
                      color: dark,
                      fontSize: sizeSmall,
                    ),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Ver mais >',
                  style: TextStyle(
                    color: dark,
                    fontSize: sizeSmall,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
