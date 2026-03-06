import 'package:bazar/core/widgets/MainBtn.dart';

import 'package:bazar/features/islam/Confirm_Order/widgets/Details_Card.dart';
import 'package:bazar/features/islam/Payment_Detils/Summary_Bottom_Sheets.dart';
import 'package:bazar/features/islam/Payment_Detils/Summary_Card.dart';
import 'package:bazar/features/islam/Tima_And_Date/Time_Bottom_Sheet.dart';
import 'package:bazar/features/islam/set_location/set_Location.dart';
import 'package:flutter/material.dart';
import 'package:bazar/core/utils/colors/maincolors.dart';
import 'package:bazar/core/widgets/app_bar.dart';

class ConfirmOrderVisaadded extends StatelessWidget {
  ConfirmOrderVisaadded({super.key});
  final double shipping = 2;

  double get price {
    double total = 0;
    for (var item in orderItems) {
      total += double.parse(item["price"]!.replaceAll("\$", ""));
    }
    return total;
  }

  double get total => price + shipping;
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColors.mainWhite,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 10),

              /// App Bar
              app_bar(
                iconDataLeft: Icons.arrow_back_rounded,
                namePage: "Confirm Order",
                iconDataRight: Icons.notifications_none_rounded,
              ),

              const SizedBox(height: 20),

              /// Content
              Expanded(
                child: ListView(
                  children: [
                    /// Address
                    DetailsCard(
                      title: "Address",
                      icon: Icons.location_on,
                      mainText: "Utama Street No.20",
                      subText:
                          " Dumbo Street No.20, Dumbo, New York 10001, United States",
                      trailingIcon: Icons.arrow_forward_ios,
                      showChange: true,
                      onChange: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => SetLocation()),
                        );
                      },
                    ),

                    const SizedBox(height: 16),

                    SummaryCard(
                      price: price,
                      shipping: shipping,
                      total: total,
                      onTap: () {
                        showSummarySheet(
                          context,
                          orderItems,
                          shipping: shipping,
                        );
                      },
                    ),
                    const SizedBox(height: 16),

                    /// Date & Time
                    DetailsCard(
                      title: "Date and time",
                      icon: Icons.calendar_month_sharp,
                      mainText: "Date & time",
                      subText: "Choose date and time",
                      trailingIcon: Icons.arrow_forward_ios,

                      onTap: () {
                        showTimeSheet(
                          context,
                          dates: deliveryDates,
                          times: deliveryTimes,
                        );
                      },
                    ),

                    const SizedBox(height: 16),

                    DetailsCard(
                      title: "Payment Details",
                      icon: Icons.credit_card_rounded,
                      mainText: "Payment",
                      subText: "Choose your payment",
                      trailingIcon: Icons.arrow_forward_ios,
                      onTap: () {},
                    ),
                  ],
                ),
              ),

              MainBtm(txt: "Order", radius: 30, onPressed: () {}),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
