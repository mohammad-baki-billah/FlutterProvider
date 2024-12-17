import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_provider_part_1/home_screen.dart';
import 'package:state_management_provider_part_1/peovider.dart';

void main() {
  runApp(MultiProvider
  (providers: [
    ChangeNotifierProvider(create: (_) => counterPeovider(),)
  ],
  child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return 
    MaterialApp(
      
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home:  HomeScreen(),
    );
  }
}

