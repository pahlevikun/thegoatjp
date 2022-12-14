import 'package:thegoatjp/src/h.dart';

class ShimmerLoader extends StatelessWidget {
  final Widget item;
  final int count;
  const ShimmerLoader({
    Key? key,
    required this.item,
    required this.count,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (_, __) => Shimmer.fromColors(
        enabled: true,
        highlightColor: ColorManifest.WHITE_COLOR.toColor(),
        baseColor: ColorManifest.GREY_COLOR.toColor(),
        child: item,
      ),
      itemCount: count,
    );
  }
}