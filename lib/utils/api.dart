import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stockl_scan_parser/models/scan_model.dart';

class ScanNotifier extends ChangeNotifier {
  List<Rule> _scanList = [];

  List<Rule> get scanList => _scanList;

  Future<void> getScans(bool notify) async {
    final String data = await rootBundle.loadString('assets/scans.json');
    final response = await json.decode(data);
    _scanList = List.from(
      response.map((e) => Rule.fromJson(e)),
    );
    notifyListeners();
  }
}
