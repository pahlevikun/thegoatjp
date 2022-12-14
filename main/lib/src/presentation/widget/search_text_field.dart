import 'package:thegoatjp/src/h.dart';

class SearchTextField extends StatelessWidget {
  final ValueChanged<String>? onTextChanged;
  final ValueChanged<String>? onSubmitted;
  final FocusNode? focusNode;
  final bool isEnabled;
  final String keyword;

  const SearchTextField({
    Key? key,
    this.onTextChanged,
    this.onSubmitted,
    this.focusNode,
    this.keyword = "",
    this.isEnabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = ColorManifest.LIGHT_GREY_COLOR.toColor();
    return ClipRRect(
      borderRadius: BorderRadius.all(extraRadius()),
      child: Container(
        color: color,
        height: DimensionsManifest.PERCENT_5.h,
        child: TextFormField(
          enabled: isEnabled,
          onChanged: onTextChanged,
          onFieldSubmitted: onSubmitted,
          focusNode: focusNode,
          autofocus: true,
          maxLines: 1,
          style: context.body1(),
          initialValue: keyword,
          textInputAction: TextInputAction.search,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(
              top: DimensionsManifest.UNIT_0,
              bottom: DimensionsManifest.UNIT_0,
              left: DimensionsManifest.PERCENT_3_5.w,
            ),
            isDense: true,
            fillColor: Colors.transparent,
            suffixIcon: Icon(
              FontAwesome.search,
              size: DimensionsManifest.PERCENT_2.h,
              color: context.lightTextColor(),
            ),
            errorStyle: context.caption(
              color: context.primaryColor()?.toHex(),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(standardRadius()),
              borderSide: BorderSide(color: color),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(standardRadius()),
              borderSide: BorderSide(color: color),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(standardRadius()),
              borderSide: BorderSide(color: color),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(standardRadius()),
              borderSide: BorderSide(color: color),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(standardRadius()),
              borderSide: BorderSide(color: color),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(standardRadius()),
              borderSide: BorderSide(color: color),
            ),
          ),
        ),
      ),
    );
  }
}
