import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:usercentrics_sdk/usercentrics_sdk.dart';

class GppTestingPage extends StatefulWidget {
  const GppTestingPage({super.key});

  @override
  State<GppTestingPage> createState() => _GppTestingPageState();
}

class _GppTestingPageState extends State<GppTestingPage> {
  String? _gppString;
  String _gppDataJson = '';
  String _lastEvent = 'No events yet';
  StreamSubscription<GppSectionChangePayload>? _subscription;

  @override
  void initState() {
    super.initState();
    _subscription = Usercentrics.onGppSectionChange.listen((payload) {
      setState(() {
        _lastEvent = payload.data;
      });
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  Future<void> _fetchGppString() async {
    try {
      final value = await Usercentrics.gppString;
      setState(() => _gppString = value);
    } catch (e) {
      setState(() => _gppString = 'Error: $e');
    }
  }

  Future<void> _fetchGppData() async {
    try {
      final value = await Usercentrics.gppData;
      final encoder = const JsonEncoder.withIndent('  ');
      final json = encoder.convert({
        'gppString': value.gppString,
        'applicableSections': value.applicableSections,
        'sections': value.sections,
      });
      setState(() => _gppDataJson = json);
    } catch (e) {
      setState(() => _gppDataJson = 'Error: $e');
    }
  }

  Future<void> _setUsNatSaleOptOut() async {
    try {
      await Usercentrics.setGPPConsent(
        sectionName: 'usnat',
        fieldName: 'SaleOptOut',
        value: 2,
      );
    } catch (e) {
      _showError(e);
    }
  }

  Future<void> _setUsFlSaleOptOut() async {
    try {
      await Usercentrics.setGPPConsent(
        sectionName: 'usfl',
        fieldName: 'SaleOptOut',
        value: 2,
      );
    } catch (e) {
      _showError(e);
    }
  }

  void _showError(Object e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error: $e')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GPP Testing')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: _fetchGppString,
              child: const Text('Get GPP String'),
            ),
            const SizedBox(height: 8),
            Text('GPP String: ${_gppString ?? "null"}'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _fetchGppData,
              child: const Text('Get GPP Data'),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                _gppDataJson.isEmpty ? 'Tap "Get GPP Data"' : _gppDataJson,
                style: const TextStyle(fontFamily: 'monospace', fontSize: 12),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _setUsNatSaleOptOut,
              child: const Text('Set usnat SaleOptOut = 2'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: _setUsFlSaleOptOut,
              child: const Text('Set usfl SaleOptOut = 2'),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Last onGppSectionChange event',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _lastEvent,
                    style: const TextStyle(fontFamily: 'monospace', fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
