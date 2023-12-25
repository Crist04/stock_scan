import 'package:flutter/material.dart';
import 'package:stockl_scan_parser/helpers/list_container.dart';
import 'package:stockl_scan_parser/screens/widgets/indicator.dart';
import 'package:stockl_scan_parser/screens/widgets/values.dart';

class VariableCriteria extends StatelessWidget {
  const VariableCriteria(
      {super.key, required this.variable, required this.title});
  final String title;
  final Map<String, dynamic>? variable;
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
            title,
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: ListView.builder(
          itemCount: variable!.length,
          itemBuilder: (context, index) {
            print(variable!["\$${index + 1}"]);
            return InkWell(
              onTap: () {
                if (variable!["\$${index + 1}"]['type'] == 'value') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ListStocks(
                            values: variable!["\$${index + 1}"]['values'])),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => IndicatorStocks(
                              value: variable!["\$${index + 1}"]
                                  ['default_value'],
                              type: variable!["\$${index + 1}"]['study_type'],
                              min: variable!["\$${index + 1}"]['min_value'],
                              max: variable!["\$${index + 1}"]['max_value'],
                            )),
                  );
                }
              },
              child: ListContainer(title: variable!["\$${index + 1}"]['type']),
            );
          },
        ));
  }
}
