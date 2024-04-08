import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/color.dart';
import '../utils/sizer_utils.dart';
import 'custom_text_widget.dart';

class DropDownWidget<T> extends StatelessWidget {
  const DropDownWidget({
    super.key,
    required this.items,
    this.title,
    this.value,
    this.onTap,
    this.hintText,
    this.fillColor,
  });

  final List<T> items;
  final String? title;
  final String? hintText;
  final T? value;
  final Function(T val)? onTap;
  final Color? fillColor;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.isDarkMode;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: title != null,
          child: Column(children: [
            TextWidget(
              title ?? "",
              fontSize: sp(16),
              fontWeight: FontWeight.w600,
            ),
            verticalSpace(5),
          ]),
        ),
        SizedBox(
          height: sp(55),
          child: DropdownButtonFormField<T>(
            isDense: true,
            borderRadius: BorderRadius.circular(sr(8.0)),
            value: value,
            icon: const Icon(Icons.keyboard_arrow_down),
            style: GoogleFonts.inter(
              color: Theme.of(context).textTheme.titleMedium!.color,
              fontWeight: FontWeight.w600,
              fontSize: sp(16),
            ),
            items: items.map((T items) {
              return DropdownMenuItem(
                value: items,
                child: TextWidget(items.toString()),
              );
            }).toList(),
            onChanged: (T? newValue) {
              if (newValue == null && onTap == null) return;

              onTap!(newValue as T);
            },
            iconEnabledColor: kcPrimaryColor,
            decoration: InputDecoration(
              filled: true,
              fillColor: context.isDarkMode
                  ? Colors.transparent
                  : const Color(0xFFF5F6F6),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: isDarkMode
                      ? kcGrey100.withOpacity(0.2)
                      : const Color(0xFFA0AFB4),
                ),
                borderRadius: BorderRadius.circular(sr(8)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: isDarkMode
                      ? kcGrey100.withOpacity(0.7)
                      : const Color(0xFFA0AFB4),
                ),
                borderRadius: BorderRadius.circular(sr(8)),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: kcErrorColor),
                borderRadius: BorderRadius.circular(sr(8)),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: isDarkMode
                      ? kcGrey100.withOpacity(0.2)
                      : const Color(0xFFA0AFB4),
                ),
                borderRadius: BorderRadius.circular(sr(8)),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: isDarkMode
                      ? kcGrey100.withOpacity(0.2)
                      : const Color(0xFFA0AFB4),
                ),
                borderRadius: BorderRadius.circular(sr(8)),
              ),
              hintText: hintText,
              hintStyle: GoogleFonts.inter(
                color: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .color!
                    .withOpacity(0.5),
                fontWeight: FontWeight.w300,
                fontSize: sp(13),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
