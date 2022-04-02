import 'package:flutter_modular/flutter_modular.dart';
import 'package:projeto/app/modules/auth/auth_page.dart';
import 'package:projeto/app/modules/home/home_page.dart';
import 'package:projeto/app/modules/splash/splash_page.dart';
import 'package:projeto/app/modules/start/start_page.dart';

import 'modules/auth/auth_store.dart';
import 'modules/home/home_store.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => AuthStore()),
    Bind.lazySingleton((i) => HomeStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const SplashPage()),
    ChildRoute('/start', child: (_, args) => const StartPage()),
    ChildRoute('/auth', child: (_, args) => const AuthPage()),
    ChildRoute('/home', child: (_, args) => const HomePage()),
  ];
}
