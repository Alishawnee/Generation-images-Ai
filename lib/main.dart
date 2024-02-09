import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:aichat/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc_observer.dart';
import 'injection_container.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();
  Bloc.observer = AppBlocObserver();
  runApp(
    const AiApp(),
  );
}
