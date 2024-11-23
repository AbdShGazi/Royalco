import 'package:flutter/material.dart';
import '../../../../core/constants/app_sizes.dart';

class OrderCard extends StatelessWidget {
  final String orderId;
  final String date;
  final int itemCount;
  final String status;

  const OrderCard({
    super.key,
    required this.orderId,
    required this.date,
    required this.itemCount,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSizes.paddingM),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppSizes.radiusS),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSizes.paddingM,
              vertical: AppSizes.paddingS,
            ),
            decoration: const BoxDecoration(
              color: Color(0xFF00B6F1),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(AppSizes.radiusS),
                topRight: Radius.circular(AppSizes.radiusS),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Order ID: $orderId',
                  style: TextStyle(
                    fontSize: AppSizes.fontSizeM,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Date: $date',
                  style: TextStyle(
                    fontSize: AppSizes.fontSizeM,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          // Add more widgets as needed
        ],
      ),
    );
  }
} 