import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rest_post_api_with_provider_part_5/api_provider.dart';
import 'package:rest_post_api_with_provider_part_5/api_services.dart';
import 'package:rest_post_api_with_provider_part_5/login_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ApiProvider(apiServices: ApiServices()),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}
