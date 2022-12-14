import 'package:thegoatjp/src/h.dart';
import 'package:rxdart/rxdart.dart';

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
      listener: (context, state) {
      },
      child: GoatScaffold(
        body: BlocBuilder<ItemListBloc, ItemListState>(
          builder: (context, state) {
            return Container();
          },
        ), title: Container(),
      ),
    );
  }
}
