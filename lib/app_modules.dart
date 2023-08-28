import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:portfolio/core/common/constants/app_routes.dart';
import 'package:portfolio/modules/auth/ui/presenter/auth_page.dart';

class AppModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          AppRoutes.auth,
          child: (context, args) => const AuthPage(),
          transition: TransitionType.fadeIn, //
          duration: 500.ms,
        ),
      ];
}
