import 'package:thegoatjp/src/h.dart';

part 'exception_details.g.dart';

@JsonSerializable()
class ExceptionResponse {
  @JsonKey(name: "exception")
  ExceptionDetails? exception;

  ExceptionResponse({this.exception});

  factory ExceptionResponse.fromJson(Map<String, dynamic>? json) =>
      json == null ? ExceptionResponse() : _$ExceptionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ExceptionResponseToJson(this);
}

@JsonSerializable()
class ExceptionDetails {
  @JsonKey(name: "code", defaultValue: "")
  String? code;
  @JsonKey(name: "description", defaultValue: "")
  String? description;

  ExceptionDetails({this.code, this.description,});

  factory ExceptionDetails.fromJson(Map<String, dynamic>? json) =>
      json == null ? ExceptionDetails() : _$ExceptionDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$ExceptionDetailsToJson(this);
}