import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PCOSInfo extends StatefulWidget {
  const PCOSInfo({super.key});

  @override
  State<PCOSInfo> createState() => _PCOSInfoState();
}

class _PCOSInfoState extends State<PCOSInfo> {
  var overFlow=TextOverflow.fade;
  var maxLines=3;
  var buttontext="Read More";
  void tohomepage() {
    Navigator.of(context).pop();
  }

  void readmore(){
    if(buttontext=="Read More"){
      setState(() {
        overFlow=TextOverflow.visible;
        maxLines=100;
        buttontext="Read Less";
      });
    }
    else{
      setState(() {
        overFlow=TextOverflow.fade;
        maxLines=3;
        buttontext="Read More";
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.blue,
            leading:
                IconButton(onPressed: tohomepage, icon: Icon(Icons.arrow_back)),
            title: Text("About PCOS")),
        body: Center(
          child: Column(children: [
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.red,
                //image: ,//Image of PCOS
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Divider(),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                      "Polycystic Ovary Syndrome (PCOS) is a medical condition that causes hormonal disorders in women in their childbearing years. The hormonal imbalance leads to a delayed or even absent menstrual cycle. Women with PCOS majorly suffer from excessive weight gain, facial hair growth, acne, hair loss, skin darkening, and irregular periods leading to infertility in rare cases " +
                          "Polycystic Ovary Disease (PCOD) is a common disorder among women with no exact cure known to date. It shows various symptoms and may even contribute to long-term health problems. It is largely ignored, due to a lack of awareness and usually detected when women try for conception. The existing methodologies and treatments are insufficient for early-stage detection and prediction. To confirm the diagnosis various hormonal blood tests along with an ultrasound scan are required which leads to multiple trips to well-equipped hospitals in urban areas.",
                          maxLines: maxLines,
                          overflow:overFlow,
                          ),
                  ),
                  TextButton(onPressed: readmore, 
                  child: Text(buttontext))
              ],
            ),
            Divider(),
            Text("Wanna tryout a test for detecting PCOS ?"),
            ElevatedButton(onPressed: (){}, 
            child: Text("Click here now"))
          ]),
        ));
  }
}
