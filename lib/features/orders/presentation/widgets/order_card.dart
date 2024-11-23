import 'package:flutter/material.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../../pages/order_details_page.dart' show OrderDetailsPage;

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
                  date,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                Text(
                  '#$orderId',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(AppSizes.paddingM),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: const Color(0xFF00B6F1),
                      radius: 15,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        icon: const Icon(Icons.edit, size: 15),
                        color: Colors.white,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OrderDetailsPage(orderId: orderId),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(width: AppSizes.paddingS),
                    CircleAvatar(
                      backgroundColor: const Color(0xFF00B6F1),
                      radius: 15,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        icon: const Icon(Icons.delete, size: 15),
                        color: Colors.white,
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '$itemCount صنف',
                      style: TextStyle(
                        fontSize: AppSizes.fontSizeM,
                        color: Colors.grey[700],
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.check_circle,
                          color: Colors.green,
                          size: 20,
                        ),
                        SizedBox(width: AppSizes.paddingXS),
                        Text(
                          status,
                          style: TextStyle(
                            fontSize: AppSizes.fontSizeS,
                            color: Colors.grey[600],
                          ),
                          textDirection: TextDirection.rtl,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
} 