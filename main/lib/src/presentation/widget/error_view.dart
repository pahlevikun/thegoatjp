import 'package:lottie/lottie.dart';
import 'package:thegoatjp/src/h.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({
    Key? key,
    this.image,
    this.lottieAsset,
    required this.title,
    required this.description,
  }) : super(key: key);

  final ImageProvider? image;
  final LottieProvider? lottieAsset;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.all(DimensionsManifest.SPACING_4x),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Visibility(
              visible: image != null || lottieAsset != null,
              child: SizedBox(
                height: DimensionsManifest.PERCENT_30.h,
                child: image != null
                    ? Image(
                        image: image!,
                        fit: BoxFit.contain,
                      )
                    : lottieAsset != null
                        ? LottieBuilder(
                            lottie: lottieAsset!,
                            fit: BoxFit.contain,
                            repeat: true,
                            animate: true,
                          )
                        : const SizedBox(),
              ),
            ),
            SizedBox(
              height: DimensionsManifest.PERCENT_1.h,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: context.headline()?.copyWith(
                    fontSize: DimensionsManifest.FONT_H2.sp,
                  ),
            ),
            SizedBox(
              height: DimensionsManifest.PERCENT_1.h,
            ),
            Text(
              description,
              textAlign: TextAlign.center,
              style: context.body1()?.copyWith(
                    fontSize: DimensionsManifest.FONT_B0.sp,
                  ),
            ),
            SizedBox(
              height: DimensionsManifest.PERCENT_2_5.h,
            ),
          ],
        ),
      ),
    );
  }
}
