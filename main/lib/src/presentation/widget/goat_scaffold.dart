import 'package:thegoatjp/src/h.dart';

class GoatScaffold extends StatelessWidget {
  final Widget title;
  final Widget body;

  const GoatScaffold({
    Key? key,
    required this.title,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).backgroundColor,
      extendBody: false,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        toolbarHeight: DimensionsManifest.PERCENT_10.h,
        backgroundColor: ColorManifest.LIGHT_PRIMARY_RED.toColor(),
        title: title,
        bottomOpacity: 0.0,
      ),
      body: body,
    );
  }
}
