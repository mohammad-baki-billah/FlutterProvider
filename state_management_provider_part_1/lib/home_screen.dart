import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_provider_part_1/counter.dart';
import 'package:state_management_provider_part_1/peovider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        title: const Text(
          'HomeScreen',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
        ),
      ),
      body: Column(
        children: [
          const Center(child: Counter()),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    context.read<counterPeovider>().increment();
                  },
                  child: const Text('Increment')),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    context.read<counterPeovider>().derement();
                  },
                  child: const Text('Decrement')),
            ],
          )
        ],
      ),
    );
  }
}
