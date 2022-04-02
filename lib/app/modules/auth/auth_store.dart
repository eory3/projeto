import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'auth_store.g.dart';

enum AuthMethod { signIn, signUp, recovery }

class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();

  @observable
  AuthMethod method = AuthMethod.signIn;

  @action
  void setMethod(AuthMethod authMethod) {
    method = authMethod;
  }

  @action
  void signIn() {
    if (formKey.currentState!.validate()) {
      Modular.to.navigate('/start');
    }
  }
}
