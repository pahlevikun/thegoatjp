import 'package:thegoatjp/src/h.dart';

class BookDetailsView extends StatefulWidget {
  const BookDetailsView({Key? key}) : super(key: key);

  @override
  BookDetailsViewState createState() => BookDetailsViewState();
}

class BookDetailsViewState extends State<BookDetailsView> {
  final navigator = Injector.locator<NavigationDispatcher>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<ItemListBloc, ItemListState>(
      listener: (context, state) {},
      child: BlocBuilder<ItemListBloc, ItemListState>(
        builder: (context, state) {
          return GoatScaffold(
            title: Text(
              context.getString(StringManifest.APP_NAME),
              style: context.headline(color: white().toHex()),
            ),
            body: BlocBuilder<ItemListBloc, ItemListState>(
              builder: (context, state) {
                return Container();
              },
            ),
          );
        },
      ),
    );
  }
}
