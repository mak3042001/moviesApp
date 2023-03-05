import 'package:dio/dio.dart';
import 'package:movies_app/core/network/errorResponseModel.dart';
import 'package:movies_app/core/utills/constant.dart';
import 'package:movies_app/error/exception.dart';
import 'package:movies_app/movies/data/model/moviesModel.dart';

abstract class BaseMoviesRemoteDataSource {
  Future<List<MoviesModel>> getNowPlaying();

  Future<List<MoviesModel>> getPopular();

  Future<List<MoviesModel>> getTopRated();
}

class MoviesRemoteDataSource implements BaseMoviesRemoteDataSource {
  @override
  Future<List<MoviesModel>> getNowPlaying() async {
    final response = await Dio().get(
      ConstantApp.nowPlayingApi,
    );
    if (response.statusCode == 200) {
      return List<MoviesModel>.from((response.data['results'] as List).map(
        (e) => MoviesModel.fromJson(e),
      ));
    } else {
      throw ServerException(
        remoteErrorResponseModel:
            RemoteErrorResponseModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MoviesModel>> getPopular() async {
    final response = await Dio().get(
      ConstantApp.popularApi,
    );
    if (response.statusCode == 200) {
      return List<MoviesModel>.from((response.data['results'] as List).map(
        (e) => MoviesModel.fromJson(e),
      ));
    } else {
      throw ServerException(
        remoteErrorResponseModel:
            RemoteErrorResponseModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MoviesModel>> getTopRated() async {
    final response = await Dio().get(
      ConstantApp.topRatedApi,
    );
    if (response.statusCode == 200) {
      return List<MoviesModel>.from((response.data['results'] as List).map(
        (e) => MoviesModel.fromJson(e),
      ));
    } else {
      throw ServerException(
        remoteErrorResponseModel:
            RemoteErrorResponseModel.fromJson(response.data),
      );
    }
  }
}
