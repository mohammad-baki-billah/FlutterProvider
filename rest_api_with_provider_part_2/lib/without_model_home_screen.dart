import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rest_api_with_provider_part_2/provider.dart';

class WithoutModelHomeScreen extends StatefulWidget {
  const WithoutModelHomeScreen({super.key});

  @override
  State<WithoutModelHomeScreen> createState() => _WithoutModelHomeScreenState();
}

class _WithoutModelHomeScreenState extends State<WithoutModelHomeScreen> {
  @override
  void initState() {
    Provider.of<userProvider>(context, listen: false).getUserDataWithoutModel();
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
            : ListView.builder(
                itemCount: provider.userData['data'].length,
                itemBuilder: (context, indext) {
                  return Card(
                    elevation: 5,
                    color: Colors.green.shade50,
                    child: ListTile(
                      leading: CircleAvatar(
                          radius: 20,
                          backgroundImage: NetworkImage(
                              Provider.of<userProvider>(context)
                                  .userData['data'][indext]['avatar']
                                  .toString(),),),
                                  title: Row(
                                    children: [
                                      Text('${Provider.of<userProvider>(context).userData['data'][indext]['first_name']} ', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                                      Text(Provider.of<userProvider>(context).userData['data'][indext]['last_name'], style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                                    ],
                                  ),
                                  subtitle: Text(Provider.of<userProvider>(context).userData['data'][indext]['email'], style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
                    ),
                  );
                }));
  }
}
