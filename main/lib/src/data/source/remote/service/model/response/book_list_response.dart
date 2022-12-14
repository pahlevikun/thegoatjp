import 'package:json_annotation/json_annotation.dart';

part 'book_list_response.g.dart';

@JsonSerializable()
class BookListResponse {
  @JsonKey(name: "count")
  num? count;
  @JsonKey(name: "next")
  String? next;
  @JsonKey(name: "previous")
  String? previous;
  @JsonKey(name: "results")
  List<BookResultData>? results;

  BookListResponse({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory BookListResponse.fromJson(Map<String, dynamic>? json) =>
      json == null ? BookListResponse() : _$BookListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BookListResponseToJson(this);
}

@JsonSerializable()
class BookResultData {
  @JsonKey(name: "id")
  num? id;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "authors")
  List<BookResultAuthor>? authors;
  @JsonKey(name: "subjects")
  List<String>? subjects;
  @JsonKey(name: "bookshelves")
  List<String>? bookshelves;
  @JsonKey(name: "languages")
  List<String>? languages;
  @JsonKey(name: "copyright")
  bool? copyright;
  @JsonKey(name: "media_type")
  String? mediaType;
  @JsonKey(name: "download_count")
  num? downloadCount;
  @JsonKey(name: "formats")
  BookResultFormat? format;

  BookResultData({
    this.id,
    this.title,
    this.authors,
    this.subjects,
    this.bookshelves,
    this.languages,
    this.copyright,
    this.mediaType,
    this.downloadCount,
    this.format,
  });

  factory BookResultData.fromJson(Map<String, dynamic>? json) =>
      json == null ? BookResultData() : _$BookResultDataFromJson(json);

  Map<String, dynamic> toJson() => _$BookResultDataToJson(this);
}

@JsonSerializable()
class BookResultAuthor {
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "birth_year")
  num? birthYear;
  @JsonKey(name: "death_year")
  num? deathYear;

  BookResultAuthor({
    this.name,
    this.birthYear,
    this.deathYear,
  });

  factory BookResultAuthor.fromJson(Map<String, dynamic>? json) =>
      json == null ? BookResultAuthor() : _$BookResultAuthorFromJson(json);

  Map<String, dynamic> toJson() => _$BookResultAuthorToJson(this);
}

@JsonSerializable()
class BookResultFormat {
  @JsonKey(name: "image/jpeg")
  String? image;

  BookResultFormat({
    this.image,
  });

  factory BookResultFormat.fromJson(Map<String, dynamic>? json) =>
      json == null ? BookResultFormat() : _$BookResultFormatFromJson(json);

  Map<String, dynamic> toJson() => _$BookResultFormatToJson(this);
}
