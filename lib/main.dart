import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:portfolio/app_modules.dart';
import 'package:portfolio/modules/auth/ui/presenter/auth_page.dart';

void main() {
  runApp(
    ModularApp(
      module: AppModule(),
      child: const AuthPage(),
    ),
  );
}
