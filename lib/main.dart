import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:routeam/src/bloc/blocs.dart';
import 'package:routeam/src/repositories/repositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//views
import './src/views/views.dart';
//utils
import './src/utils/utils.dart';

void main() {
  runApp(
    MultiBlocProvider(
        providers: [
          BlocProvider<SearchBloc>(
            create: (context) => SearchBloc(
                searchRepository: SearchRepository(),
                favoriteRepository: FavoriteRepository())),
          BlocProvider<FavoriteBloc>(
            create: (context) => FavoriteBloc(favoriteRepository: FavoriteRepository()),
          )
        ], child: const SearchApp())
  );
}

class SearchApp extends StatelessWidget {
  const SearchApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppThemes.baseTheme(context),
      home:  AnimatedSplashScreen(
        splashIconSize: double.infinity,
        centered: false,
        splash: Splash(),
        nextScreen: SearchView(),
        backgroundColor: Colors.white,
      ),
    );
  }
}
