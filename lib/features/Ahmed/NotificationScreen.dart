import 'package:flutter/material.dart';
import 'package:bazar/core/utils/colors/maincolors.dart';
import 'package:bazar/core/widgets/app_bar.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColors.mainWhite,
      body: SafeArea(
        child: Column(
          children: [
            // الهيدر الموحد بتاع التيم
            const app_bar(
              iconDataLeft: Icons.arrow_back_ios_new,
              namePage: "Notification",
              iconDataRight: Icons.more_horiz, 
            ),
            
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  const SizedBox(height: 20),
                  _buildSectionHeader("Today"),
                                   
                  _buildNotificationItem(
                    title: "Order Completed",
                    desc: "Your order #12345 has been delivered successfully.",
                    time: "10:00 AM",
                    isRead: false,
                  ),
                  
                  _buildNotificationItem(
                    title: "Flash Sale!",
                    desc: "Don't miss the 50% discount on history books.",
                    time: "08:30 AM",
                    isRead: true,
                  ),

                  const SizedBox(height: 24),
                  _buildSectionHeader("October 2021"),
                  
                  _buildNotificationItem(
                    title: "New Arrival",
                    desc: "The new design collection is now available.",
                    time: "Oct 20",
                    isRead: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildNotificationItem({
    required String title,
    required String desc,
    required String time,
    required bool isRead,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
       
        color: isRead ? Colors.transparent : MainColors.mainGrey.withValues(alpha: 0.7),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: MainColors.mainDarkGrey.withValues(alpha: 0.3)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
          
            backgroundColor: MainColors.mainPurple.withValues(alpha: 0.1),
            child: Icon(Icons.notifications_none, color: MainColors.mainPurple),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 4),
                Text(desc, style: const TextStyle(color: Colors.black54, fontSize: 14)),
                const SizedBox(height: 8),
                Text(time, style: TextStyle(color: MainColors.mainDarkGrey, fontSize: 12)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}