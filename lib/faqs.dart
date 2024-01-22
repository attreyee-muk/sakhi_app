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
    Item(heading: "What are the symptoms of PCOS", body: "Polycystic ovary syndrome is caused by an imbalance of androgens. Common symptoms include ovarian cysts, irregular menstrual periods, and hair on the face and body."),
    Item(heading: "What are the symptoms of Endometriosis", body: "Endometriosis is a chronic condition where tissue similar to the lining of the uterus, called endometrium, grows outside the uterus. Common symptoms of endometriosis include debilitating pelvic pain, especially during menstruation, intercourse, or bowel movements. Women with endometriosis often experience heavy menstrual bleeding, irregular periods, and may have difficulty conceiving. Chronic pelvic pain can significantly impact daily activities and quality of life. In some cases, endometriosis may lead to the formation of scar tissue and adhesions, potentially causing organs to stick together."),
    Item(heading: "What are the symptoms of UTI", body: "Urinary Tract Infection (UTI) is characterized by various symptoms stemming from the inflammation of the urinary tract, commonly caused by bacteria. The hallmark symptom is a persistent, burning sensation during urination. Individuals with UTIs may experience increased urgency and frequency of urination, often accompanied by lower abdominal pain or discomfort. The urine may appear cloudy or have a strong, unpleasant odor."),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      );
  }
}
