import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  void _goToPage(BuildContext context, String page) {
    Navigator.of(context).pushNamed(page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('Set State'),
              onPressed: () {
                _goToPage(context, '/set_state');
              },
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Value Notifier'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Change Notifier'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Bloc Pattern'),
            ),
          ],
        ),
      ),
    );
  }
}
