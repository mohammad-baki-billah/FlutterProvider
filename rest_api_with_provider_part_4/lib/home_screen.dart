import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rest_api_with_provider_part_4/api_provider.dart';
import 'package:rest_api_with_provider_part_4/details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Provider.of<ApiProvider>(context, listen: false).getUserRespnse();
    super.initState();
  }

  final provider = Provider.of<ApiProvider>;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.green,
        title: const Text(
          'HomeScreen',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Provider.of<ApiProvider>(context).isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.green,
              ),
            )
          : Center(
              child: ListView.builder(
                  itemCount: provider(context).userLIst.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 5,
                      color: Colors.green.shade100,
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailsScreen(
                                name:  provider(context)
                                    .userLIst[index]
                                    .name
                                    .toString(),
                                    email: provider(context).userLIst[index].email.toString(),
                                    body: provider(context).userLIst[index].body.toString(),
                              ),
                            ),
                          );
                        },
                        title: Text(
                          provider(context).userLIst[index].name.toString(),
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        subtitle: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              provider(context)
                                  .userLIst[index]
                                  .email
                                  .toString(),
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                            Text(
                              textDirection: TextDirection.ltr,
                              maxLines: 3,
                              overflow: TextOverflow.clip,
                              provider(context).userLIst[index].body.toString(),
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
    );
  }
}
