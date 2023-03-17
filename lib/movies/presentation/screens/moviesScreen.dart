import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/services/servicesLocated.dart';
import 'package:movies_app/movies/presentation/controllers/moviesBloc.dart';
import 'package:movies_app/movies/presentation/controllers/moviesEvents.dart';
import 'package:movies_app/movies/presentation/controllers/moviesState.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (BuildContext context) {
      return MoviesBloc(getIt())..add(GetNowPlayingEvents());
    }, child: BlocBuilder<MoviesBloc, MoviesState>(
      builder: (BuildContext context, state) {
        print(state);
        return const Scaffold();
      },
    ));
  }
}
