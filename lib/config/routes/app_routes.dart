import 'package:aichat/core/routes/routes.dart';
import 'package:aichat/features/home/presentation/screens/home_screen.dart';
import 'package:aichat/features/image_generation/presentation/cubit/image_generation_cubit.dart';
import 'package:aichat/features/image_generation/presentation/screens/image_generation_screen.dart';
import 'package:aichat/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.imageGenerationRoute:
        return TransitionRoutePage.navigator(BlocProvider(
          create: (context) => sl<ImageGenerationCubit>.call(),
          child: const ImageGenerationScreen(),
        ));
    }
    return null;
  }
}

class TransitionRoutePage {
  static PageTransition navigator(Widget screen) {
    return PageTransition(child: screen, type: PageTransitionType.bottomToTop);
  }
}
