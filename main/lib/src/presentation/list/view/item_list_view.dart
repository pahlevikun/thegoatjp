import 'package:loadmore/loadmore.dart';
import 'package:thegoatjp/src/common/localization/app_translation.dart';
import 'package:thegoatjp/src/common/view/hideable_glow_behavior.dart';
import 'package:thegoatjp/src/h.dart';
import 'package:thegoatjp/src/presentation/widget/shimmer_network_image.dart';

class ItemListView extends StatefulWidget {
  const ItemListView({Key? key}) : super(key: key);

  @override
  ItemListViewState createState() => ItemListViewState();
}

class ItemListViewState extends State<ItemListView> {
  final navigator = Injector.locator<NavigationDispatcher>();
  final keyRating = GlobalKey<State>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<ItemListBloc, ItemListState>(
      listener: (context, state) {},
      child: GoatScaffold(
        title: Text(
          context.getString(StringManifest.APP_NAME),
          style: context.headline(color: white().toHex()),
        ),
        body: BlocBuilder<ItemListBloc, ItemListState>(
          builder: (context, state) {
            return state.page.when(
              renderItems: (List<BookItemEntity>? books) => _buildContent(
                context,
                books ?? [],
              ),
              showNetworkError: () => context.connectionError(),
              showGenericError: () => context.genericError(),
              showEmptyError: () => context.emptyError(),
              showShimmer: () => _buildShimmer(context),
            );
          },
        ),
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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: standardBorderRadius(),
                color: context.colorBackground(),
              ),
              height: DimensionsManifest.PERCENT_15.h,
              width: DimensionsManifest.PERCENT_30.w,
            ),
            SizedBox(
              width: DimensionsManifest.SPACING_4x,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: standardBorderRadius(),
                      color: context.colorBackground(),
                    ),
                    margin: EdgeInsets.only(top: DimensionsManifest.SPACING_x),
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
          ],
        ),
      ),
      count: 4,
    );
  }

  Widget _buildContent(
    BuildContext context,
    List<BookItemEntity> books,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: DimensionsManifest.SPACING_4x,
      ),
      child: ScrollConfiguration(
        behavior: HideableGlowBehavior(),
        child: LoadMore(
          delegate: _ItemListLoadMore(context),
          onLoadMore: () async {
            context.read<ItemListBloc>().add(const ItemListEvent.loadMore());
            return true;
          },
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: books.length,
            itemBuilder: (BuildContext context, int index) {
              final item = books[index];
              return _buildItemCard(item, context);
            },
          ),
        ),
      ),
    );
  }

  Card _buildItemCard(BookItemEntity item, BuildContext context) {
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
            onTap: () {},
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
                      return "Author: ${temp.isNotEmpty ? temp.substring(0, temp.length - 1) : "-"}";
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
                        return "Language: ${temp.isNotEmpty ? temp.substring(0, temp.length - 1).toUpperCase() : "-"}";
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
    if (status == LoadMoreStatus.fail) {
      return Container();
    }
    if (status == LoadMoreStatus.idle) {
      return Center(
        child: BounceLoading(
          color: context.primaryColor(),
        ),
      );
    }
    if (status == LoadMoreStatus.loading) {
      return Center(
        child: BounceLoading(
          color: context.primaryColor(),
        ),
      );
    }
    if (status == LoadMoreStatus.nomore) {
      return Container();
    }

    return Center(
      child: BounceLoading(
        color: context.primaryColor(),
      ),
    );
  }
}
