import 'package:flutter/material.dart';

Widget userDetailsCard(String title, String value, BuildContext context,
    {double? width1,
    double? width,
    Function()? onTap,
    double? topPad,
    TextStyle? tStyle,
    TextStyle? vStyle,
    FontWeight? valWeight,
    Color? titleColor,
    FontWeight? titleWeight,
    Color? valueColor,
    int? maxlines}) {
  return Padding(
    padding: EdgeInsets.only(top: topPad ?? 10.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: width ?? 120,
          child: Text(
            title,
            style: tStyle ??
                Theme.of(context).textTheme.headlineLarge!.copyWith(
                    fontWeight: titleWeight ?? FontWeight.w600,
                    fontSize: 14,
                    color: titleColor ?? Colors.black),
          ),
        ),
        InkWell(
          onTap: onTap,
          child: SizedBox(
            width: width1 ?? 220,
            child: Text(
              value,
              maxLines: maxlines,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              style: vStyle ??
                  Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: valWeight ?? FontWeight.normal,
                      fontSize: 14,
                      color: valueColor ?? Colors.black),
            ),
          ),
        )
      ],
    ),
  );
}
