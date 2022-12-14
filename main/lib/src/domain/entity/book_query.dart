class BookQuery {
  num? page;
  String? keyword;
  String? topic;

  BookQuery({
    this.page,
    this.keyword,
    this.topic,
  });

  BookQuery copyWith({
    num? page,
    String? keyword,
    String? topic,
  }) {
    return BookQuery(
      page: page ?? this.page,
      keyword: keyword ?? this.keyword,
      topic: topic ?? this.topic,
    );
  }
}
