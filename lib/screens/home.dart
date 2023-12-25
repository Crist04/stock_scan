import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stockl_scan_parser/helpers/list_container.dart';
import 'package:stockl_scan_parser/screens/plain_text.dart';
import 'package:stockl_scan_parser/utils/api.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<ScanNotifier>().getScans(false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: const Color(0xfff0f0f0),
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
        title: const Text(
          'Stock Scanner',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Consumer<ScanNotifier>(
        builder: (context, value, child) {
          return ListView.builder(
            itemCount: value.scanList.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PlainTextScans(scans: value.scanList[index])),
                  );
                },
                child: ListContainer(title: value.scanList[index].name,isicon: true,details: value.scanList[index].tag,secondary: value.scanList[index].color=="red"?Colors.red:Colors.green,),
              );
            },
          );
        },
      ),
    );
  }
}
