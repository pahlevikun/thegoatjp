import 'package:thegoatjp/src/h.dart';

export 'item_list_page.dart';
export 'item_list_view.dart';

class ItemListPage extends StatefulWidget {
  const ItemListPage({
    Key? key,
    this.subject,
  }) : super(key: key);

  final String? subject;

  @override
  ItemListPageState createState() => ItemListPageState();
}

class ItemListPageState extends State<ItemListPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Injector.locator<ItemListBloc>()
        ..add(ItemListEvent.ready(subject: widget.subject)),
      child: const ItemListView(),
    );
  }
}
