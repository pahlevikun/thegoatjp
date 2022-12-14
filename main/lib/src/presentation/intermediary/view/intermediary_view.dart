import 'package:thegoatjp/src/h.dart';

class IntermediaryView extends StatefulWidget {
  const IntermediaryView({Key? key}) : super(key: key);

  @override
  IntermediaryViewState createState() => IntermediaryViewState();
}

class IntermediaryViewState extends State<IntermediaryView> {
  final _navigator = Injector.locator<NavigationDispatcher>();

  @override
  void initState() {
    super.initState();
    context.read<IntermediaryBloc>().add(const IntermediaryEvent.routeNavigation());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<IntermediaryBloc, IntermediaryState>(
      listener: (context, state) {
        state.page.whenOrNull(
          navigateToListItem: () => _navigator.goToItemList(context, clearStack: true),
        );
      },
      child: BlocBuilder<IntermediaryBloc, IntermediaryState>(
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          return Center(
              child: BounceLoading(
              color: context.primaryColor(),
          ),);
        },
      ),
    );
  }
}
