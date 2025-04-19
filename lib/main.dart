import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/src/DependencyInjection/service_locator.dart';
import 'package:my_app/src/configs/talker_bloc_observer.dart';
import 'package:my_app/src/configs/talker_config.dart';
import 'app.dart';

void main() {
  runZonedGuarded(() async {
    Bloc.observer = TalkerBlocObserver(talker: TalkerConfig.talker);

    WidgetsFlutterBinding.ensureInitialized();
    await setupLocator();
    FlutterError.onError = (FlutterErrorDetails details) {
      TalkerConfig.talker.handle(details.exception, details.stack);
    };

    runApp(const MyApp());
  }, (error, stack) {
    TalkerConfig.talker.handle(error, stack);
  });
}
