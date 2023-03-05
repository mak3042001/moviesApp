import 'package:equatable/equatable.dart';

class RemoteErrorResponseModel extends Equatable {
  final bool success;
  final int statusCode;
  final String statusMessage;

  const RemoteErrorResponseModel({
    required this.success,
    required this.statusCode,
    required this.statusMessage,
  });

  factory RemoteErrorResponseModel.fromJson(Map<String, dynamic> json) {
    return RemoteErrorResponseModel(
      success: json["success"],
      statusCode: json["statusCode"],
      statusMessage: json["statusMessage"],
    );
  }

  @override
  List<Object?> get props => [
    success,
    statusCode,
    statusMessage,
  ];
//
}

class LocalErrorResponseModel extends Equatable {
  final String message;

  const LocalErrorResponseModel({
    required this.message,
  });

  @override
  List<Object?> get props => [
    message,
  ];
//
}
