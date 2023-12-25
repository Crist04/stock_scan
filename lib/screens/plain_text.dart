import 'package:flutter/material.dart';
import 'package:stockl_scan_parser/helpers/list_container.dart';
import 'package:stockl_scan_parser/models/scan_model.dart';
import 'package:stockl_scan_parser/screens/variable_criteria.dart';

class PlainTextScans extends StatelessWidget {
  const PlainTextScans({super.key, required this.scans});
  final Rule scans;
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
            scans.name,
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: ListView.builder(
          itemCount: scans.criteria.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                if (scans.criteria[index].type == 'plain_text') {
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => VariableCriteria(
                              variable: scans.criteria[index].variable,
                              title: scans.criteria[index].text,
                            )),
                  );
                }
              },
              child: ListContainer(title: scans.criteria[index].text),
            );
          },
        ));
  }
}
