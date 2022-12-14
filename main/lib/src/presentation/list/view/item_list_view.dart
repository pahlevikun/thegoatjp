import 'package:thegoatjp/src/common/localization/app_translation.dart';
import 'package:thegoatjp/src/h.dart';

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
              renderItems: () => Container(),
              showNetworkError: () => context.connectionError(),
              showGenericError: () => context.genericError(),
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
}
