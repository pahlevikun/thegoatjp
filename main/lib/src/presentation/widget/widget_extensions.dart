import 'package:thegoatjp/src/h.dart';

extension ContextExt on BuildContext {
  bool isDialogShown() => ModalRoute.of(this)?.isCurrent != true;

  Widget genericError({Function? onClick}) => ErrorView(
        lottieAsset: LottieManifest.lottieGenericError,
        title: getString(StringManifest.ERROR_VIEW_GENERIC_TITLE),
        description: getString(StringManifest.ERROR_VIEW_GENERIC_DESCRIPTION),
        onClick: onClick,
      );

  Widget connectionError({Function? onClick}) => ErrorView(
        lottieAsset: LottieManifest.lottieNetworkError,
        title: getString(StringManifest.ERROR_VIEW_CONNECTION_TITLE),
        description:
            getString(StringManifest.ERROR_VIEW_CONNECTION_DESCRIPTION),
        onClick: onClick,
      );

  Widget emptyError() => ErrorView(
        lottieAsset: LottieManifest.lottieEmptyError,
        title: getString(StringManifest.ERROR_VIEW_EMPTY_TITLE),
        description: getString(StringManifest.ERROR_VIEW_EMPTY_DESCRIPTION),
      );
}
