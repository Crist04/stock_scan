import 'package:flutter/material.dart';

class ListContainer extends StatelessWidget {
  const ListContainer(
      {super.key, required this.title, this.details = "", this.isicon = false});
  final String title;
  final String details;
  final bool isicon;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
      ),
      width: double.infinity,
      height: height * 0.15,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 50,
            height: 50,
            margin: const EdgeInsets.only(right: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(width: 3, color: Colors.deepPurpleAccent),
            ),
            child: Icon(Icons.show_chart),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                      color: Color(0xff696b9e),
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
                const SizedBox(
                  height: 6,
                ),
                isicon
                    ? Row(
                        children: <Widget>[
                          Icon(
                            Icons.add_chart_sharp,
                            color: Color(0xfff29a94),
                            size: 20,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(details,
                              style: TextStyle(
                                  color: Color(0xff696b9e),
                                  fontSize: 13,
                                  letterSpacing: .3)),
                        ],
                      )
                    : SizedBox(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
