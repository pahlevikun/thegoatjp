import 'package:thegoatjp/src/h.dart';

extension ContextExt on BuildContext {
  bool isDialogShown() => ModalRoute.of(this)?.isCurrent != true;

  Widget genericError() => ErrorView(
        lottieAsset: LottieManifest.lottieGenericError,
        title: getString(StringManifest.ERROR_VIEW_GENERIC_TITLE),
        description: getString(StringManifest.ERROR_VIEW_GENERIC_DESCRIPTION),
      );

  Widget connectionError() => ErrorView(
        lottieAsset: LottieManifest.lottieNetworkError,
        title: getString(StringManifest.ERROR_VIEW_CONNECTION_TITLE),
        description:
            getString(StringManifest.ERROR_VIEW_CONNECTION_DESCRIPTION),
      );

  Widget emptyError() => ErrorView(
        lottieAsset: LottieManifest.lottieEmptyError,
        title: getString(StringManifest.ERROR_VIEW_EMPTY_TITLE),
        description: getString(StringManifest.ERROR_VIEW_EMPTY_DESCRIPTION),
      );
}
