import 'package:thegoatjp/src/h.dart';

export 'intermediary_page.dart';
export 'intermediary_view.dart';

class IntermediaryPage extends StatefulWidget {
  const IntermediaryPage({
    Key? key,
  }) : super(key: key);

  @override
  IntermediaryPageState createState() => IntermediaryPageState();
}

class IntermediaryPageState extends State<IntermediaryPage> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(
        builder: (context, orientation) {
          return ResponsiveSizer(
            builder: (context, orientation, screenType) {
              return BlocProvider.value(
                value: Injector.locator<IntermediaryBloc>(),
                child: const IntermediaryView(),
              );
            },
          );
        },
      );
    });
  }
}
