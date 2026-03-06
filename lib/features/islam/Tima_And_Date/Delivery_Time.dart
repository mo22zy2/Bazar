import 'package:bazar/core/widgets/MainBtn.dart';
import 'package:bazar/features/islam/Tima_And_Date/Select_Boxs.dart';
import 'package:flutter/material.dart';

class DeliveryTimeSheet extends StatefulWidget {
  final List<String> dates;
  final List<String> times;

  const DeliveryTimeSheet({
    super.key,
    required this.dates,
    required this.times,
  });

  @override
  State<DeliveryTimeSheet> createState() => _DeliveryTimeSheetState();
}

class _DeliveryTimeSheetState extends State<DeliveryTimeSheet> {
  int selectedDateIndex = 0;
  int selectedTimeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: MediaQuery.of(context).size.height * .6,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Drag line
          Center(
            child: Container(
              width: 60,
              height: 6,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 20),

          const Text(
            "Delivery date",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),

          /// Dates row
          Row(
            children: List.generate(
              widget.dates.length,
              (index) => Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: SelectBox(
                    title: widget.dates[index],
                    selected: selectedDateIndex == index,
                    onTap: () {
                      setState(() {
                        selectedDateIndex = index;
                      });
                    },
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 30),

          const Text(
            "Delivery time",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),

          /// Times row
          Row(
            children: List.generate(
              widget.times.length,
              (index) => Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: SelectBox(
                    title: widget.times[index],
                    selected: selectedTimeIndex == index,
                    onTap: () {
                      setState(() {
                        selectedTimeIndex = index;
                      });
                    },
                  ),
                ),
              ),
            ),
          ),

          const Spacer(),

          /// Confirm button
          Center(
            child: MainBtm(txt: "Confirm", radius: 30, onPressed: () {}),
          ),
        ],
      ),
    );
  }
}
