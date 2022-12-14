import 'package:rxdart/rxdart.dart';
import 'package:thegoatjp/src/h.dart';

export 'item_list_bloc.dart';
export 'model/item_list_event.dart';
export 'model/item_list_state.dart';

class ItemListBloc extends BaseGoatBloc<ItemListEvent, ItemListState> {
  ItemListBloc(
    this._fetchBookListUseCase,
  ) : super(const ItemListState()) {
    on<ItemListLoadMore>(_mapEventLoadMore);
  }

  final FetchBookListUseCase _fetchBookListUseCase;
  num _currentCount = 0;
  num _totalCount = 0;
  List<BookItemEntity> _books = [];
  BookQuery _query = BookQuery(page: 0);
  bool _isFetching = false;

  _mapEventLoadMore(
    ItemListLoadMore event,
    Emitter<ItemListState> emitter,
  ) {
    fetchNextPage();
  }

  void fetchNextPage() {
    if (!_isFetching && _currentCount <= _totalCount) {
      _query = _query.copyWith(page: _query.page.orZero() + 1);
      _fetchBookListUseCase.execute(_query).doOnListen(() {
        _isFetching = true;
        if (_books.isEmpty) {
          emit(state.copyWith(page: const ItemListMarble.showShimmer()));
        } else {
          emit(
            state.copyWith(
              page: ItemListMarble.renderItems(books: _books),
            ),
          );
        }
      }).listen(
        (event) {
          _isFetching = false;
          _totalCount = event.count;
          _currentCount += event.books.length;
          _books.addAll(event.books);
          if (_books.isEmpty) {
            emit(state.copyWith(page: ItemListMarble.showGenericError()));
          } else {
            emit(
              state.copyWith(
                page: ItemListMarble.renderItems(books: _books),
              ),
            );
          }
        },
        onError: (error) {
          _isFetching = false;
          if (_books.isEmpty) {
            final exception = NetworkException.getDioException(error);
            if (exception is NoInternetConnection) {
              emit(state.copyWith(page: ItemListMarble.showNetworkError()));
            } else {
              emit(state.copyWith(page: ItemListMarble.showGenericError()));
            }
          } else {
            emit(
              state.copyWith(
                page: ItemListMarble.renderItems(books: _books),
              ),
            );
          }
        },
      ).addTo(compositeSubscription);
    }
  }
}
