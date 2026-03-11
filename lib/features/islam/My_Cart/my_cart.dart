import 'package:bazar/core/utils/colors/maincolors.dart';
import 'package:bazar/core/utils/images/images.dart';
import 'package:bazar/features/islam/Notifications/notifications_empty.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CartsPage extends StatelessWidget {
  const CartsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "my Cart",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
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
                      builder: (context) => NotificationsEmpty(),
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
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("orders")
            .where("userId", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
            .snapshots(),

        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final orders = snapshot.data!.docs;

          if (orders.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(Images.Cart_products),
                  const SizedBox(height: 16),
                  const Text(
                    "There is no products",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            itemCount: orders.length,
            itemBuilder: (context, index) {
              final order = orders[index];

              return ListTile(
                leading: Image.network(order["image"], width: 55, height: 70),
                title: Text(
                  order["title"],
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
                ),
                subtitle: Text(
                  order["price"],
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
