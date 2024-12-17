import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_provider_part_1/peovider.dart';

class Counter extends StatelessWidget {
  const Counter({super.key});

  @override
  Widget build(BuildContext context) {
    final myProvider = context.watch<counterPeovider>();
    // ignore: deprecated_member_use
    return Text(myProvider.count.toString(), textScaleFactor: 5,);
  }
}
