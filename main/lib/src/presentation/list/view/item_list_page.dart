import 'package:thegoatjp/src/h.dart';
import 'package:thegoatjp/src/presentation/list/bloc/item_list_bloc.dart';

export 'item_list_page.dart';
export 'item_list_view.dart';

class ItemListPage extends StatefulWidget {
  const ItemListPage({
    Key? key,
  }) : super(key: key);

  @override
  ItemListPageState createState() => ItemListPageState();
}

class ItemListPageState extends State<ItemListPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Injector.locator<ItemListBloc>()..add(const ItemListEvent.ready()),
      child: const ItemListView(),
    );
  }
}
