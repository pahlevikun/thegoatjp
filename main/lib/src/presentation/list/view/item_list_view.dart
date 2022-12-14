import 'package:loadmore/loadmore.dart';
import 'package:thegoatjp/src/h.dart';
import 'package:thegoatjp/src/presentation/widget/search_text_field.dart';

class ItemListView extends StatefulWidget {
  const ItemListView({Key? key}) : super(key: key);

  @override
  ItemListViewState createState() => ItemListViewState();
}

class ItemListViewState extends State<ItemListView> {
  final navigator = Injector.locator<NavigationDispatcher>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<ItemListBloc, ItemListState>(
      listener: (context, state) {},
      child: BlocBuilder<ItemListBloc, ItemListState>(
        builder: (context, state) {
          return GoatScaffold(
            title: Text(
              state.title?.takeIf((it) => it.isNotEmpty) ??
                  context.getString(StringManifest.APP_NAME),
              style: context.headline(color: white().toHex()),
            ),
            body: state.page.when(
              renderItems: (
                List<BookItemEntity>? books,
                bool? isFinish,
              ) =>
                  _buildContent(
                context,
                books ?? [],
                isFinish.orFalse(),
              ),
              showNetworkError: () => context.connectionError(onClick: () {
                context.read<ItemListBloc>().add(ItemListEvent.loadMore());
              }),
              showGenericError: () => context.genericError(onClick: () {
                context.read<ItemListBloc>().add(ItemListEvent.loadMore());
              }),
              showEmptyError: () => context.emptyError(),
              showShimmer: () => _buildShimmer(context),
            ),
          );
        },
      ),
    );
  }

  ShimmerLoader _buildShimmer(BuildContext context) {
    return ShimmerLoader(
      item: Padding(
        padding: EdgeInsets.symmetric(
          vertical: DimensionsManifest.SPACING_4x,
          horizontal: DimensionsManifest.SPACING_4x,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: standardBorderRadius(),
                color: context.colorBackground(),
              ),
              height: DimensionsManifest.PERCENT_25.h,
              width: double.infinity,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: standardBorderRadius(),
                color: context.colorBackground(),
              ),
              margin: EdgeInsets.only(top: DimensionsManifest.SPACING_4x),
              height: DimensionsManifest.PERCENT_3_5.h,
              width: double.infinity,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: standardBorderRadius(),
                color: context.colorBackground(),
              ),
              margin: EdgeInsets.only(top: DimensionsManifest.SPACING_4x),
              height: DimensionsManifest.PERCENT_2.h,
              width: DimensionsManifest.PERCENT_30.w,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: standardBorderRadius(),
                color: context.colorBackground(),
              ),
              margin: EdgeInsets.only(top: DimensionsManifest.SPACING_2x),
              height: DimensionsManifest.PERCENT_2.h,
              width: DimensionsManifest.PERCENT_15.w,
            ),
          ],
        ),
      ),
      count: 4,
    );
  }

  Widget _buildContent(
    BuildContext context,
    List<BookItemEntity> books,
    bool isFinish,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: DimensionsManifest.SPACING_4x,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: DimensionsManifest.SPACING_4x,
            ),
            child: SearchTextField(
              isEnabled: true,
              onTextChanged: (text) {},
              onSubmitted: (text) {
                context
                    .read<ItemListBloc>()
                    .add(ItemListEvent.search(keyword: text));
              },
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                top: DimensionsManifest.SPACING_4x,
              ),
              child: ScrollConfiguration(
                behavior: HideableGlowBehavior(),
                child: LoadMore(
                  delegate: _ItemListLoadMore(context),
                  isFinish: isFinish,
                  onLoadMore: () async {
                    context
                        .read<ItemListBloc>()
                        .add(const ItemListEvent.loadMore());
                    return true;
                  },
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: books.length,
                    itemBuilder: (BuildContext context, int index) {
                      final item = books[index];
                      return _buildItemCard(context, item);
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Card _buildItemCard(
    BuildContext context,
    BookItemEntity item,
  ) {
    return Card(
      elevation: DimensionsManifest.UNIT_2,
      shadowColor: ColorManifest.DARK_GREY_COLOR.toColor(),
      shape: RoundedRectangleBorder(
        borderRadius: standardBorderRadius(),
      ),
      margin: const EdgeInsets.only(
        bottom: DimensionsManifest.SPACING_x,
        top: DimensionsManifest.SPACING_3x,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(standardRadius()),
        child: Material(
          color: white(),
          child: InkWell(
            onTap: () {
              Injector.locator<NavigationDispatcher>()
                  .goToItemDetails(context, item);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShimmerNetworkImage(
                  url: item.cover,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: DimensionsManifest.PERCENT_1.h,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: DimensionsManifest.PERCENT_1.h,
                    left: DimensionsManifest.PERCENT_4.w,
                    right: DimensionsManifest.PERCENT_4.w,
                  ),
                  child: Text(
                    item.title,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: context.bodyTitle1(),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: DimensionsManifest.PERCENT_1.h,
                    left: DimensionsManifest.PERCENT_4.w,
                    right: DimensionsManifest.PERCENT_4.w,
                  ),
                  child: Text(
                    item.authors.let((it) {
                      var temp = "";
                      it.forEach((element) {
                        temp += "${element.name},";
                      });
                      return "${context.getString(StringManifest.BOOK_AUTHOR)} ${temp.isNotEmpty ? temp.substring(0, temp.length - 1) : "-"}";
                    }),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: context.caption(
                        color: context.lightTextColor().toHex()),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: DimensionsManifest.PERCENT_2.h,
                    left: DimensionsManifest.PERCENT_4.w,
                    right: DimensionsManifest.PERCENT_4.w,
                    bottom: DimensionsManifest.PERCENT_2.h,
                  ),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      item.languages.let((it) {
                        var temp = "";
                        it.forEach((element) {
                          temp += "$element,";
                        });
                        return "${context.getString(StringManifest.BOOK_LANGUAGE)} ${temp.isNotEmpty ? temp.substring(0, temp.length - 1).toUpperCase() : "-"}";
                      }),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.right,
                      style: context.caption(
                          color: context.primaryColor()?.toHex()),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ItemListLoadMore extends LoadMoreDelegate {
  final BuildContext context;

  const _ItemListLoadMore(this.context);

  @override
  Widget buildChild(
    LoadMoreStatus status, {
    LoadMoreTextBuilder builder = DefaultLoadMoreTextBuilder.english,
  }) {
    return Center(
      child: BounceLoading(
        color: context.primaryColor(),
      ),
    );
  }
}
