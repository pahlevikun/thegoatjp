import 'package:rxdart/rxdart.dart';
import 'package:thegoatjp/src/h.dart';

export 'package:thegoatjp/src/presentation/list/bloc/item_list_bloc.dart';
export 'package:thegoatjp/src/presentation/list/bloc/model/item_list_event.dart';
export 'package:thegoatjp/src/presentation/list/bloc/model/item_list_state.dart';

class ItemListBloc extends BaseGoatBloc<ItemListEvent, ItemListState> {
  ItemListBloc(
    this._fetchBookListUseCase,
  ) : super(const ItemListState()) {
    on<ItemListLoadMore>(_mapEventLoadMore);
    on<ItemListReady>(_mapItemListReady);
    on<ItemListSearch>(_mapItemListSearch);
  }

  final FetchBookListUseCase _fetchBookListUseCase;
  num _currentCount = 0;
  num _totalCount = 0;
  List<BookItemEntity> _books = [];
  BookQuery _query = BookQuery(page: 1);
  bool _isFetching = false;
  String? _customTitle;

  _mapItemListSearch(
    ItemListSearch event,
    Emitter<ItemListState> emitter,
  ) {
    _query = _query.copyWith(page: 1, keyword: event.keyword);
    _books.clear();
    fetchNextPage();
  }

  _mapItemListReady(
    ItemListReady event,
    Emitter<ItemListState> emitter,
  ) {
    _customTitle = event.subject;
    _query = _query.copyWith(topic: event.subject);
    fetchNextPage();
  }

  _mapEventLoadMore(
    ItemListLoadMore event,
    Emitter<ItemListState> emitter,
  ) {
    fetchNextPage();
  }

  void fetchNextPage() {
    if (!_isFetching && _currentCount <= _totalCount) {
      _fetchBookListUseCase.execute(_query).doOnListen(() {
        _isFetching = true;
        if (_books.isEmpty) {
          emit(state.copyWith(
            page: ItemListMarble.showShimmer(),
            title: _customTitle,
          ));
        } else {
          emit(
            state.copyWith(
              page: ItemListMarble.renderItems(
                books: _books,
                isFinish: _isFetching,
              ),
              title: _customTitle,
            ),
          );
        }
      }).listen(
        (event) {
          _isFetching = false;
          _query = _query.copyWith(page: _query.page.orZero() + 1);
          _totalCount = event.count;
          _currentCount += event.books.length;
          _books.addAll(event.books);
          if (_books.isEmpty) {
            emit(state.copyWith(page: ItemListMarble.showEmptyError()));
          } else {
            emit(
              state.copyWith(
                page: ItemListMarble.renderItems(
                  books: _books,
                  isFinish: _isFetching,
                ),
                title: _customTitle,
              ),
            );
          }
        },
        onError: (error) {
          _isFetching = false;
          if (_books.isEmpty) {
            final exception = NetworkException.getDioException(error);
            if (exception is NoInternetConnection) {
              emit(state.copyWith(
                page: ItemListMarble.showNetworkError(),
                title: _customTitle,
              ));
            } else {
              emit(state.copyWith(
                page: ItemListMarble.showGenericError(),
                title: _customTitle,
              ));
            }
          } else {
            emit(
              state.copyWith(
                page: ItemListMarble.renderItems(
                  books: _books,
                  isFinish: _isFetching,
                ),
                title: _customTitle,
              ),
            );
          }
        },
      ).addTo(compositeSubscription);
    }
  }
}
