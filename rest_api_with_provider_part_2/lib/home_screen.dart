import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rest_api_with_provider_part_2/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Provider.of<userProvider>(context, listen: false).getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<userProvider>(context);
    return Scaffold(
      backgroundColor: Colors.green.shade50,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        title: const Text(
          'HomeScreen',
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: provider.isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.green,
              ),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView.builder(
                itemCount: provider.userModel.data!.length,
                itemBuilder: (context, indext) {
                  return Card(
                    elevation: 5,
                    color: Colors.green.shade100,
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 25,
                        backgroundImage: NetworkImage(
                          provider.userModel.data![indext].avatar.toString(),
                        ),
                      ),
                      title: Row(
                        children: [
                          Text(
                            '${provider.userModel.data![indext].firstName.toString()} ',
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            provider.userModel.data![indext].lastName
                                .toString(),
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      subtitle: Text(
                        provider.userModel.data![indext].email.toString(),
                        style: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w400),
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
