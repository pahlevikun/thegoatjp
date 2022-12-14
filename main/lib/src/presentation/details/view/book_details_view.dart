import 'package:thegoatjp/src/h.dart';

class BookDetailsView extends StatefulWidget {
  const BookDetailsView({
    Key? key,
    required this.book,
  }) : super(key: key);
  final BookItemEntity book;

  @override
  BookDetailsViewState createState() => BookDetailsViewState();
}

class BookDetailsViewState extends State<BookDetailsView> {
  final navigator = Injector.locator<NavigationDispatcher>();

  @override
  Widget build(BuildContext context) {
    return GoatScaffold(
      title: Text(
        widget.book.title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: context.headline(color: white().toHex()),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: DimensionsManifest.SPACING_4x,
        ),
        child: ScrollConfiguration(
          behavior: HideableGlowBehavior(),
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildContent(context, widget.book),
                Padding(
                  padding: EdgeInsets.only(
                    top: DimensionsManifest.SPACING_4x,
                    left: DimensionsManifest.SPACING_4x,
                    right: DimensionsManifest.SPACING_4x,
                  ),
                  child: Text(
                    context.getString(StringManifest.BOOK_SUBJECT),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: context.headline(),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: DimensionsManifest.SPACING_4x,
                  ),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: widget.book.subjects.length,
                    itemBuilder: (BuildContext context, int index) {
                      final item = widget.book.subjects[index];
                      return _buildSubjectItem(context, item);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Card _buildContent(
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShimmerNetworkImage(
                url: item.cover,
                fit: BoxFit.fitHeight,
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
                  style:
                      context.caption(color: context.lightTextColor().toHex()),
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
                      return "${context.getString(StringManifest.BOOK_LANGUAGE)}: ${temp.isNotEmpty ? temp.substring(0, temp.length - 1).toUpperCase() : "-"}";
                    }),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.right,
                    style:
                        context.caption(color: context.primaryColor()?.toHex()),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Card _buildSubjectItem(
    BuildContext context,
    String item,
  ) {
    return Card(
      elevation: DimensionsManifest.UNIT_2,
      shadowColor: ColorManifest.DARK_GREY_COLOR.toColor(),
      shape: RoundedRectangleBorder(
        borderRadius: standardBorderRadius(),
      ),
      margin: const EdgeInsets.only(
        bottom: DimensionsManifest.SPACING_3x,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(standardRadius()),
        child: Material(
          color: white(),
          child: InkWell(
            onTap: () {
              navigator.goToItemList(
                context,
                clearStack: false,
                subject: item,
              );
            },
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: DimensionsManifest.PERCENT_2.h,
                horizontal: DimensionsManifest.PERCENT_4.w,
              ),
              child: Text(
                item,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: context.bodyTitle1(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
