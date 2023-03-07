import 'package:flutter/material.dart';
import 'package:movies_app/movies/data/datasource/moviesRemoteDataSource.dart';
import 'package:movies_app/movies/data/repository/dataRepository.dart';
import 'package:movies_app/movies/domain/repository/domainRepository.dart';
import 'package:movies_app/movies/domain/usecase/getPopularMoviesUsecase.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }

  @override
  void initState() {
    _getData();
    super.initState();
  }

  void _getData() async {
    BaseMoviesRemoteDataSource baseMoviesRemoteDataSource = MoviesRemoteDataSource();
    DomainRepository domainRepository = DataRepository(baseMoviesRemoteDataSource);
    final result = await GetPopularMoviesUsecase(domainRepository).execute();
    print(result);
  }
}
