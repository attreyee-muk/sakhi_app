import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EndoInfo extends StatefulWidget {
  const EndoInfo({super.key});

  @override
  State<EndoInfo> createState() => _EndoInfoState();
}

class _EndoInfoState extends State<EndoInfo> {
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
            title: Text("About Endometriosis")),
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
                      "Endometriosis is a chronic gynecological condition that affects 5–10% of women of reproductive age. Women with endometriosis have endometrial-type tissue outside of the uterus."+
                       "In exceptional cases, endometriosis lesions may reach organs distant from the pelvis such as the membranes of"+
                       "the lungs, heart, limbs, and brain. As a result, and in response to the substances that this tissue produces, the immune system is activated, and a chronic inflammatory process is triggered, leading to the formation of adhesions, scars, and cysts between the pelvic and abdominal organs. Endometriosis tissue can also penetrate various organs in the body, including the"+
                       "digestive and urinary systems, and attach to nerves",
                          maxLines: maxLines,
                          overflow:overFlow,
                          ),
                  ),
                  TextButton(onPressed: readmore, 
                  child: Text(buttontext))
              ],
            ),
            Divider(),
            Text("Wanna tryout a test for detecting Endometriosis ?"),
            ElevatedButton(onPressed: (){}, 
            child: Text("Click here now"))
          ]),
        ));
  }
}
