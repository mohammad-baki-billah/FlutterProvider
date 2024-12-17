import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rest_api_with_provider_part_2/home_screen.dart';
import 'package:rest_api_with_provider_part_2/provider.dart';
import 'package:rest_api_with_provider_part_2/without_model_home_screen.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_)=> userProvider(),)
  ],
  child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: WithoutModelHomeScreen(),
    );
  }
}
