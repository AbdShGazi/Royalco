import 'package:flutter/material.dart';
import 'package:royalco/widgets/custom_app_bar.dart';
import 'package:royalco/features/orders/presentation/widgets/order_card.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  bool showCurrentOrders = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(),
      body: Column(
        children: [
          const SizedBox(height: 20),
          const Text(
            'الطلبيات',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF00B6F1),
            ),
          ),
          const SizedBox(height: 20),
          // Tab buttons
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ElevatedButton(
                    onPressed: () => setState(() => showCurrentOrders = false),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: !showCurrentOrders 
                          ? const Color(0xFFF5F5F5)
                          : Colors.white,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'أرشيف الطلبيات',
                      style: TextStyle(
                        color: !showCurrentOrders 
                            ? Colors.black
                            : Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ElevatedButton(
                    onPressed: () => setState(() => showCurrentOrders = true),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: showCurrentOrders 
                          ? const Color(0xFF00B6F1)
                          : Colors.white,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'الطلبيات الحالية',
                      style: TextStyle(
                        color: showCurrentOrders 
                            ? Colors.white
                            : Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Orders list
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (context, index) {
                return OrderCard(
                  orderId: '5022201',
                  date: '12/12/2022',
                  itemCount: 28,
                  status: 'حالة الطلبية',
                );
              },
            ),
          ),
        ],
      ),
    );
  }
} 