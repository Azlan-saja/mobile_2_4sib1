import 'package:flutter/material.dart';

import 'package:master/providers/counter_provider.dart';
import 'package:provider/provider.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CounterProvider>(context);
    return Stack(
      alignment: Alignment.topRight,
      children: [
        const Icon(Icons.shopping_cart),
        Positioned(
          top: -5,
          left: -1,
          child: Container(
            padding: const EdgeInsets.all(3),
            decoration: const BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
            // constraints: const BoxConstraints(minWidth: 10, minHeight: 10),
            child: Center(
              child: Text(
                provider.hasil.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
