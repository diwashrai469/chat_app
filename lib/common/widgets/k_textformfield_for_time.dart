import 'package:chat_app/common/constant/ui_helpers.dart';
import 'package:chat_app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget kTextformFieldForTime({
  required TextEditingController controller,
  required BuildContext context,
  String? label,
  String? hint,
}) {
  return Column(
    children: [
      if (label != null && label.isNotEmpty)
        Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Text.rich(
                    TextSpan(
                      text: label,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                      children: const <InlineSpan>[
                        TextSpan(
                          text: '* ',
                          style: TextStyle(color: Colors.red),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            sHeightSpan
          ],
        ),
      GestureDetector(
        onTap: () {
          _selectDate(context, controller);
        },
        child: AbsorbPointer(
          child: TextFormField(
            controller: controller,
            style: Theme.of(context).textTheme.bodyMedium,
            decoration: InputDecoration(
              suffixIcon: const Icon(
                Icons.calendar_month,
                color: Colors.grey,
              ),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: primaryColor),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              hintText: hint ?? "Select date",
              hintStyle: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: Colors.grey),
            ),
          ),
        ),
      ),
    ],
  );
}

void _selectDate(BuildContext context, TextEditingController controller) async {
  DateTime currentDate = DateTime.now();
  final localContext = context;

  TimeOfDay? selectedTime = await showTimePicker(
    builder: (context, child) {
      return Theme(
        data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme.light(
            primary: primaryColor,
            onPrimary: Colors.white,
            onSurface: Colors.black,
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              foregroundColor: primaryColor,
            ),
          ),
        ),
        child: child!,
      );
    },
    context: localContext,
    initialTime: TimeOfDay.fromDateTime(currentDate.toLocal()),
  );

  if (selectedTime != null) {
    final formattedTime = DateFormat('hh:mm a').format(
      DateTime(currentDate.year, currentDate.month, currentDate.day,
          selectedTime.hour, selectedTime.minute),
    );

    controller.text = formattedTime;
  }
}
