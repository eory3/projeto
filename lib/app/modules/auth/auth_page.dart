import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:projeto/app/app_properties.dart';
import 'package:projeto/app/modules/auth/auth_store.dart';
import 'package:projeto/app/shared/utils/validators.dart';

class AuthPage extends StatefulWidget {
  final String title;
  const AuthPage({Key? key, this.title = 'AuthPage'}) : super(key: key);
  @override
  AuthPageState createState() => AuthPageState();
}

class AuthPageState extends ModularState<AuthPage, AuthStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: linearGradient,
        ),
        child: Observer(
          builder: (context) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: Container()),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Card(
                    elevation: 7,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Form(
                        key: controller.formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            if (controller.method == AuthMethod.signUp)
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 6),
                                child: TextFormField(
                                  controller: controller.name,
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(Icons.email),
                                    labelText: 'Nome',
                                    labelStyle:
                                        const TextStyle(fontSize: sizeP),
                                    isDense: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                        color: darkNegativeOne,
                                      ),
                                    ),
                                  ),
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.name,
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                  validator: (email) {
                                    if (email == null || email.isEmpty) {
                                      return 'Nome Obrigatório!';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 6),
                              child: TextFormField(
                                controller: controller.email,
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.email),
                                  labelText: 'Email',
                                  labelStyle: const TextStyle(fontSize: sizeP),
                                  isDense: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: darkNegativeOne,
                                    ),
                                  ),
                                ),
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.emailAddress,
                                validator: (email) {
                                  if (email == null || email.isEmpty) {
                                    return 'Email Obrigatório!';
                                  } else if (!Validators.validEmail(email)) {
                                    return 'Email inválido!';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            if (controller.method != AuthMethod.recovery)
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 6),
                                child: TextFormField(
                                  controller: controller.password,
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(Icons.lock),
                                    labelText: 'Senha',
                                    labelStyle:
                                        const TextStyle(fontSize: sizeP),
                                    isDense: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                        color: darkNegativeOne,
                                      ),
                                    ),
                                  ),
                                  textInputAction:
                                      controller.method == AuthMethod.signUp
                                          ? TextInputAction.next
                                          : TextInputAction.done,
                                  keyboardType: TextInputType.text,
                                  obscureText: true,
                                  validator: (password) {
                                    if (password == null || password.isEmpty) {
                                      return 'Senha Obrigatória!';
                                    } else if (password.length < 6) {
                                      return 'Senha deve conter no minimo 6 caracteres';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            if (controller.method == AuthMethod.signUp)
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 6),
                                child: TextFormField(
                                  controller: controller.confirmPassword,
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(Icons.lock),
                                    labelText: 'Confirmar Senha',
                                    labelStyle:
                                        const TextStyle(fontSize: sizeP),
                                    isDense: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                        color: darkNegativeOne,
                                      ),
                                    ),
                                  ),
                                  textInputAction: TextInputAction.done,
                                  keyboardType: TextInputType.text,
                                  obscureText: true,
                                  validator: (confirmPassword) {
                                    if (confirmPassword == null ||
                                        confirmPassword.isEmpty) {
                                      return 'Confirmar Senha Obrigatório!';
                                    } else if (controller
                                            .confirmPassword.text !=
                                        controller.password.text) {
                                      return 'As senhas não coincidem!';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              child: SizedBox(
                                height: 40,
                                child: ElevatedButton(
                                  onPressed: controller.signIn,
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            primary),
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                    controller.method == AuthMethod.signUp
                                        ? 'Criar Conta'
                                        : controller.method ==
                                                AuthMethod.recovery
                                            ? 'Recuperar'
                                            : 'Entrar',
                                    style: const TextStyle(
                                      color: light,
                                      fontSize: sizeH6,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                if (controller.method == AuthMethod.signIn)
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: TextButton(
                      onPressed: () =>
                          controller.setMethod(AuthMethod.recovery),
                      child: const Text(
                        'Recuperar Senha',
                        style: TextStyle(color: light, fontSize: sizeP),
                      ),
                    ),
                  ),
                Expanded(child: Container()),
                TextButton(
                  onPressed: () {
                    if (controller.method == AuthMethod.signIn) {
                      controller.setMethod(AuthMethod.signUp);
                    } else {
                      controller.setMethod(AuthMethod.signIn);
                    }
                  },
                  child: Text(
                    controller.method == AuthMethod.signIn
                        ? 'Criar Conta'
                        : 'Realizar Login',
                    style: const TextStyle(
                      color: light,
                      fontSize: sizeP,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            );
          },
        ),
      ),
    );
  }
}
