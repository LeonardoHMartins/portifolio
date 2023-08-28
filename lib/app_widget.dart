import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:portfolio/core/common/constants/app_routes.dart';
import 'package:portfolio/core/common/constants/app_theme.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute(AppRoutes.auth);

    return MaterialApp.router(
      title: 'Teste',
      builder: (context, child) {
        child = BotToastInit()(context, child);
        return child;
      },
      theme: AppTheme.light,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      routerDelegate: Modular.routerDelegate,
      routeInformationParser: Modular.routeInformationParser,
    );
  }
}
