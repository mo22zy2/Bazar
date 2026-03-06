import 'package:bazar/features/islam/Tima_And_Date/Delivery_Time.dart';
import 'package:flutter/material.dart';

void showTimeSheet(
  BuildContext context, {
  required List<String> dates,
  required List<String> times,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
    ),
    builder: (context) {
      return DeliveryTimeSheet(dates: dates, times: times);
    },
  );
}
