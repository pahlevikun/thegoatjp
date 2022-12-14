import 'package:cached_network_image/cached_network_image.dart';
import 'package:thegoatjp/src/h.dart';

class ShimmerNetworkImage extends StatelessWidget {
  final String url;
  final double ratio;
  final BoxFit fit;

  const ShimmerNetworkImage({
    Key? key,
    required this.url,
    this.ratio = 16 / 9,
    this.fit = BoxFit.contain,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all({}.standardRadius()),
      child: AspectRatio(
        aspectRatio: ratio,
        child: CachedNetworkImage(
          imageUrl: url,
          fit: fit,
          placeholder: (context, url) => Shimmer.fromColors(
            enabled: true,
            highlightColor: ColorManifest.WHITE_COLOR.toColor(),
            baseColor: ColorManifest.LIGHT_GREY_COLOR.toColor(),
            child: Container(
              width: double.infinity,
              height: DimensionsManifest.PERCENT_15.h,
              color: Colors.white,
            ),
          ),
          errorWidget: (context, url, error) {
            return Container(
              width: double.infinity,
              height: double.infinity,
              color: ColorManifest.DARK_GREY_COLOR.toColor(),
              child: Icon(
                Icons.broken_image,
                size: DimensionsManifest.PERCENT_10.h,
              ),
            );
          },
        ),
      ),
    );
  }
}
