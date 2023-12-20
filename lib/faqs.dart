import 'package:flutter/material.dart';

class Item {
  final String heading;
  final String body;
  bool isExpanded;

  Item({
    required this.heading,
    required this.body,
    this.isExpanded = false,
  });
}

class InsightsPage extends StatefulWidget {
  const InsightsPage({super.key});

  @override
  State<InsightsPage> createState() => _InsightsPageState();
}

class _InsightsPageState extends State<InsightsPage> {
  final List<Item> items = [
    Item(heading: "HIhi", body: "hello"),
    Item(heading: "HsdfsI", body: "hellohi"),
    Item(heading: "HsdfsdfsI", body: "hellohihello"),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Insights Page"),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          //mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text("Frequently asked questions",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.yellow,
            ),),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: ExpansionPanelList(
                  expansionCallback: (index, isExpanded) {
                    setState(() {
                    
                      items[index].isExpanded = !items[index].isExpanded;
                    
                    });
                  },
                  children: [
                    ...items.map((item) => ExpansionPanel(
                        canTapOnHeader: true,
                        isExpanded: item.isExpanded,
                        headerBuilder: (context, isExpanded) {
                          return ListTile(
                            title: Text(item.heading),
                          );
                        },
                        body: ListTile(
                          title: Text(item.body),
                        )))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
