import 'package:thegoatjp/src/h.dart';

part 'book_details_state.freezed.dart';

@Freezed(
  toStringOverride: false,
  fromJson: false,
  toJson: false,
  map: FreezedMapOptions(
    map: false,
    mapOrNull: false,
    maybeMap: false,
  ),
)
abstract class BookDetailsMarble with _$BookDetailsMarble {
  const factory BookDetailsMarble.pure() = BookDetailsPure;

  const factory BookDetailsMarble.renderContent() = BookDetailsRenderContent;
}

class BookDetailsState extends Equatable {
  final BookDetailsMarble page;

  const BookDetailsState({
    this.page = const BookDetailsMarble.pure(),
  });

  BookDetailsState copyWith({
    BookDetailsMarble? page,
  }) {
    return BookDetailsState(
      page: page ?? this.page,
    );
  }

  @override
  List<Object> get props => [page];
}
