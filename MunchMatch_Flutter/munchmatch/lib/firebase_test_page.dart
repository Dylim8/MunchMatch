import 'package:flutter/material.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'dart:convert';

class FirebaseTestPage extends StatefulWidget {
  const FirebaseTestPage({super.key});

  @override
  State<FirebaseTestPage> createState() => _FirebaseTestPageState();
}

class _FirebaseTestPageState extends State<FirebaseTestPage> {
  List<dynamic> _restaurants = [];
  bool _loading = false;

  Future<void> _fetchRestaurants() async {
    setState(() {
      _loading = true;
    });

    try {
      HttpsCallable callable = FirebaseFunctions.instance.httpsCallable('fetchRestaurants');
      final results = await callable.call(<String, dynamic>{
        'location': 'San Francisco',
      });

      setState(() {
        _restaurants = json.decode(results.data);
        _loading = false;
      });
    } catch (e) {
      setState(() {
        _loading = false;
      });
      print(e.toString());
      throw Exception('Failed to load restaurants');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase Test Page'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: _loading
            ? const CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: _fetchRestaurants,
                    child: const Text('Fetch Restaurants'),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: _restaurants.length,
                      itemBuilder: (context, index) {
                        final restaurant = _restaurants[index];
                        return ListTile(
                          title: Text(restaurant['name']),
                          subtitle: Text('Rating: ${restaurant['rating']}'),
                        );
                      },
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
