import 'package:movies_app/core/network/errorResponseModel.dart';

class ServerException implements Exception {
  final RemoteErrorResponseModel remoteErrorResponseModel;

  const ServerException({
    required this.remoteErrorResponseModel,
  });
}

class LocalException implements Exception {
  final String message;

  LocalException({
    required this.message,
  });
}
