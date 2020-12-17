import 'package:clean_architecture_movie/core/route/app_router.dart';
import 'package:clean_architecture_movie/feature/movies/presentation/bloc/movies_bloc.dart';
import 'package:clean_architecture_movie/feature/movies/presentation/bloc/movies_event.dart';
import 'package:clean_architecture_movie/feature/splash/presentation/pages/splash_page.dart';
import 'package:clean_architecture_movie/inject_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'inject_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MultiBlocProvider(
      providers: [
        BlocProvider<MoviesBloc>(
            create: (context) => getIt<MoviesBloc>()..add(GetMoviesEvent()))
      ],
      child: MyApp(),
    ));
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: AppPages.pages,
      home: SplashPage(),
    );
  }
}
