import 'package:rxdart/rxdart.dart';
import 'package:thegoatjp/src/h.dart';

export 'item_list_bloc.dart';
export 'model/item_list_event.dart';
export 'model/item_list_state.dart';

class ItemListBloc extends BaseGoatBloc<ItemListEvent, ItemListState> {
  ItemListBloc(
    this._fetchBookListUseCase,
  ) : super(const ItemListState()) {
    on<ItemListReady>(_mapEventReady);
  }

  final FetchBookListUseCase _fetchBookListUseCase;
  num _currentCount = 0;
  num _totalCount = 0;
  List<BookItemEntity> _books = [];
  BookQuery _query = BookQuery(page: 1);

  _mapEventReady(
    ItemListReady event,
    Emitter<ItemListState> emitter,
  ) {
    _fetchBookListUseCase.execute(_query).doOnListen(() {
      if (_books.isEmpty) {
        emit(state.copyWith(page: const ItemListMarble.showShimmer()));
      } else {
        emit(
          state.copyWith(
            page: ItemListMarble.renderItems(
              books: _books,
              isLoadMore: true,
            ),
          ),
        );
      }
    }).listen(
      (event) {
        _totalCount = event.count;
        _currentCount += event.books.length;
        _books.addAll(event.books);
        if (_books.isEmpty) {
          emit(state.copyWith(page: ItemListMarble.showGenericError()));
        } else {
          emit(
            state.copyWith(
              page: ItemListMarble.renderItems(
                books: _books,
                isLoadMore: _currentCount < _totalCount,
              ),
            ),
          );
        }
      },
      onError: (error) {
        if (_books.isEmpty) {
          final exception = NetworkException.getDioException(event);
          if (exception is NoInternetConnection) {
            emit(state.copyWith(page: ItemListMarble.showNetworkError()));
          } else {
            emit(state.copyWith(page: ItemListMarble.showGenericError()));
          }
        } else {
          emit(
            state.copyWith(
              page: ItemListMarble.renderItems(
                books: _books,
                isLoadMore: _currentCount < _totalCount,
              ),
            ),
          );
        }
      },
    ).addTo(compositeSubscription);
  }
}
