import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/src/DependencyInjection/service_locator.dart';
import 'package:my_app/src/blocs/auth/auth_bloc.dart';
import 'package:my_app/src/blocs/file/file_bloc.dart';
import 'package:my_app/src/configs/constants.dart';
import 'package:my_app/src/configs/theme.dart';
import 'package:my_app/src/screens/login/login_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<AuthBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<FileBloc>(),
        ),
      ],
      child: MaterialApp(
        title: Constants.appName,
        theme: appTheme,
        home: LoginScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
