import 'package:flutter/material.dart';
import 'package:stockl_scan_parser/helpers/list_container.dart';

class ListStocks extends StatelessWidget {
  const ListStocks({super.key, required this.values});
  final List<dynamic> values;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xfff0f0f0),
        appBar: AppBar(
          iconTheme:const IconThemeData(
            color: Colors.white,
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.deepPurpleAccent,
          title: Text(
            "Values",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: ListView.builder(
          itemCount: values.length,
          itemBuilder: (context, index) {
            return ListContainer(title: values[index].toString());
          },
        ));
  }
}
