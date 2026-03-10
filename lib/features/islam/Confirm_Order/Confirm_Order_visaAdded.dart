import 'package:bazar/core/widgets/MainBtn.dart';

import 'package:bazar/features/islam/Confirm_Order/widgets/Details_Card.dart';
import 'package:bazar/features/islam/Notifications/notifications_empty.dart';
import 'package:bazar/features/islam/Payment_Detils/Summary_Bottom_Sheets.dart';
import 'package:bazar/features/islam/Payment_Detils/Summary_Card.dart';
import 'package:bazar/features/islam/Tima_And_Date/Time_Bottom_Sheet.dart';
import 'package:bazar/features/islam/set_location/set_Location.dart';
import 'package:bazar/features/islam/set_location/widgets/address_controller.dart';
import 'package:flutter/material.dart';
import 'package:bazar/core/utils/colors/maincolors.dart';
import 'package:provider/provider.dart';

class ConfirmOrderVisaadded extends StatefulWidget {
  const ConfirmOrderVisaadded({super.key});

  @override
  State<ConfirmOrderVisaadded> createState() => _ConfirmOrderVisaaddedState();
}

class _ConfirmOrderVisaaddedState extends State<ConfirmOrderVisaadded> {
  final double shipping = 2;

  String? selectedDate;
  String? selectedTime;

  final List<String> deliveryDates = [
    "Today\n12 Jan",
    "Tomorrow\n13 Jan",
    "Pick\na date",
  ];

  final List<String> deliveryTimes = [
    "Between\n10PM : 11PM",
    "Between\n11PM : 12PM",
  ];

  final List<Map<String, String>> orderItems = [
    {"name": "Squid Sweet and Sour Salad", "price": "\$19.99"},
    {"name": "Japan Hainanese Sashimi", "price": "\$39.99"},
    {"name": "Black Pepper Beef Lumpia", "price": "\$27.12"},
  ];

  double get price {
    double total = 0;
    for (var item in orderItems) {
      total += double.parse(item["price"]!.replaceAll("\$", ""));
    }
    return total;
  }

  double get total => price + shipping;

  @override
  Widget build(BuildContext context) {
    final addressController = Provider.of<AddressController>(context);

    return Scaffold(
      backgroundColor: MainColors.mainWhite,
      appBar: AppBar(
        backgroundColor: MainColors.mainWhite,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
            color: MainColors.mainBlack,
            size: 30,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Confirm Order",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        actions: [
          Stack(
            children: [
              IconButton(
                icon: Icon(
                  Icons.notifications_none_rounded,
                  color: MainColors.mainBlack,
                  size: 30,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NotificationsEmpty(),
                    ),
                  );
                },
              ),
              Positioned(
                top: 12,
                right: 12,
                child: CircleAvatar(
                  radius: 6,
                  backgroundColor: MainColors.mainWhite,
                  child: CircleAvatar(
                    radius: 4,
                    backgroundColor: MainColors.mainRed,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 10),

              const SizedBox(height: 20),

              Expanded(
                child: ListView(
                  children: [
                    DetailsCard(
                      title: "Address",
                      icon: Icons.location_on,
                      mainText: addressController.address == null
                          ? "Add Address"
                          : "${addressController.address!.street}",
                      subText: addressController.address == null
                          ? "Choose your address"
                          : "Bld ${addressController.address!.building}, Floor ${addressController.address!.floor}, Flat ${addressController.address!.flat} • ${addressController.address!.city}, ${addressController.address!.governorate}",
                      trailingIcon: Icons.arrow_forward_ios,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => SetLocation()),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Summary Card
                    SummaryCard(
                      price: price,
                      shipping: shipping,
                      total: total,
                      onTap: () => showSummarySheet(
                        context,
                        orderItems,
                        shipping: shipping,
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Date & Time
                    DetailsCard(
                      title: "Date and time",
                      icon: Icons.calendar_month_sharp,
                      mainText: selectedDate ?? "Date & time",
                      subText: selectedTime ?? "Choose date and time",
                      trailingIcon: Icons.arrow_forward_ios,
                      onTap: () {
                        showTimeSheet(
                          context,
                          dates: deliveryDates,
                          times: deliveryTimes,
                          onSelect: (date, time) {
                            setState(() {
                              selectedDate = date;
                              selectedTime = time;
                            });
                          },
                        );
                      },
                    ),
                    const SizedBox(height: 16),

                    // Payment Details
                    DetailsCard(
                      title: "Payment Details",
                      icon: Icons.credit_card_rounded,
                      mainText: "Payment",
                      subText: "Choose your payment",
                      trailingIcon: Icons.arrow_forward_ios,
                      onTap: () => showSummarySheet(
                        context,
                        orderItems,
                        shipping: shipping,
                      ),
                    ),
                  ],
                ),
              ),

              // Order Button
              MainBtm(txt: "Order", radius: 30, onPressed: () {}),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
