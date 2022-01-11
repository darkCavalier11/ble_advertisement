import 'package:flutter/material.dart';
import 'package:ble_advertisement/ble_advertisement.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BleAdvertisementPluginExample(),
    );
  }
}

class BleAdvertisementPluginExample extends StatefulWidget {
  const BleAdvertisementPluginExample({Key? key}) : super(key: key);

  @override
  BleAdvertisementPluginExampleState createState() =>
      BleAdvertisementPluginExampleState();
}

class BleAdvertisementPluginExampleState
    extends State<BleAdvertisementPluginExample> {
  late final TextEditingController _boxAuthController;
  late final TextEditingController _orderIdController;

  @override
  void initState() {
    super.initState();
    _boxAuthController = TextEditingController();
    _orderIdController = TextEditingController();
  }

  @override
  void dispose() {
    _boxAuthController.dispose();
    _orderIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _boxAuthController,
              decoration: InputDecoration(
                labelText: 'boxAuth',
              ),
            ),
            TextField(
              controller: _orderIdController,
              decoration: InputDecoration(
                labelText: 'orderId',
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                await BleAdvertisement.startAdvertisement(
                    _orderIdController.text, _boxAuthController.text);
              },
              child: Text('Start Advertisement'),
            )
          ],
        ),
      ),
    );
  }
}
