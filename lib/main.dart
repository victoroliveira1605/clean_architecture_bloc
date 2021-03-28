import 'package:clean_architecture_bloc/core/constants/app_color.dart';
import 'package:clean_architecture_bloc/core/route/app_router.dart';
import 'package:clean_architecture_bloc/feature/movies/presentation/bloc/movies_bloc.dart';
import 'package:clean_architecture_bloc/feature/movies/presentation/bloc/movies_event.dart';
import 'package:clean_architecture_bloc/feature/movies/presentation/pages/movies_page.dart';
import 'package:clean_architecture_bloc/inject_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'inject_container.dart' as di;

void main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarIconBrightness: Brightness.light, statusBarColor: primaryColor));
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MultiBlocProvider(
      providers: [
        BlocProvider<MoviesBloc>(
            create: (context) =>
                getIt<MoviesBloc>()..add(GetAllNewShowingEvent())),
      ],
      child: MyApp(),
    ));
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: AppPages.pages,
      home: MoviesPage(),
      theme: ThemeData(appBarTheme: AppBarTheme(brightness: Brightness.light)),
    );
  }
}
