import 'package:flutter/cupertino.dart';
import 'dart:convert';  
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Predictions extends StatefulWidget {
  const Predictions({super.key});

  @override
  State<Predictions> createState() => _PredictionsState();
}

class _PredictionsState extends State<Predictions> {
  // This widget is the root of your application.

  // String url='http://127.0.0.1:5000/add';

  final TextEditingController age = TextEditingController();
  final TextEditingController weight = TextEditingController();
  final TextEditingController height = TextEditingController();
  final TextEditingController bmi = TextEditingController();
  final TextEditingController blood_g = TextEditingController();
  final TextEditingController pulse_rate = TextEditingController();
  final TextEditingController res_rate = TextEditingController();
  final TextEditingController haemob = TextEditingController();
  final TextEditingController cycle = TextEditingController();
  final TextEditingController cycle_len = TextEditingController();
  final TextEditingController marr_stat = TextEditingController();
  final TextEditingController preg = TextEditingController();
  final TextEditingController abor = TextEditingController();
  final TextEditingController ibeta = TextEditingController();
  final TextEditingController fsh = TextEditingController();
  final TextEditingController lh = TextEditingController();
  final TextEditingController fshlh = TextEditingController();
  final TextEditingController hip = TextEditingController();
  final TextEditingController waist = TextEditingController();
  final TextEditingController ratio = TextEditingController();
  final TextEditingController tsh = TextEditingController();
  final TextEditingController prl = TextEditingController();
  final TextEditingController vit_d3 = TextEditingController();
  final TextEditingController prg = TextEditingController();
  final TextEditingController rbs = TextEditingController();
  final TextEditingController weight_gain = TextEditingController();
  final TextEditingController hair_gro = TextEditingController();
  final TextEditingController skin_dark = TextEditingController();
  final TextEditingController hair_loss = TextEditingController();
  final TextEditingController pimples = TextEditingController();
  final TextEditingController ff = TextEditingController();
  final TextEditingController reg_ex = TextEditingController();
  final TextEditingController bp_sys = TextEditingController();
  final TextEditingController bp_dia = TextEditingController();
  final TextEditingController foll_l = TextEditingController();
  final TextEditingController foll_r = TextEditingController();
  final TextEditingController avg_F_size_l = TextEditingController();
  final TextEditingController avg_F_size_r = TextEditingController();
  final TextEditingController endo = TextEditingController();
  bool _isLoading=false;

  Map<String, dynamic> res = {};
  final borderprops = const InputDecoration(
    hintText: "Enter number 1",
    focusedBorder:
        OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
    enabledBorder:
        OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
  );

  Future<Map<String, dynamic>> sendDataToPythonServer() async {
    final Uri apiUrl = Uri.parse('http://192.168.29.140:5000/predict');

    Map<String, dynamic> dataToSend = {
      "age": age.text,
      "weight": weight.text,
      "height": height.text,
      "bmi": bmi.text,
      "blood_g": blood_g.text,
      "pulse_rate": pulse_rate.text,
      "res_rate": res_rate.text,
      "haemob": haemob.text,
      "cycle": cycle.text,
      "cycle_len": cycle_len.text,
      "marr_stat": marr_stat.text,
      "preg": preg.text,
      "abor": abor.text,
      "ibeta": ibeta.text,
      "fsh": fsh.text,
      "lh": lh.text,
      "fshlh": fshlh.text,
      "hip": hip.text,
      "waist": waist.text,
      "ratio": ratio.text,
      "tsh": tsh.text,
      "prl": prl.text,
      "vit_d3": vit_d3.text,
      "prg": prg.text,
      "rbs": rbs.text,
      "weight_gain": weight_gain.text,
      "hair_gro": hair_gro.text,
      "skin_dark": skin_dark.text,
      "hair_loss": hair_loss.text,
      "pimples": pimples.text,
      "ff": ff.text,
      "reg_ex": reg_ex.text,
      "bp_sys": bp_sys.text,
      "bp_dia": bp_dia.text,
      "foll_l": foll_l.text,
      "foll_r": foll_r.text,
      "avg_F_size_l": avg_F_size_l.text,
      "avg_F_size_r": avg_F_size_r.text,
      "endo": endo.text,
      // Add other data as needed
    };

    try {
      final http.Response response = await http.post(
        apiUrl,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(dataToSend),
      );

      if (response.statusCode == 200) {
        print('Data sent successfully');
        print('Response: ${response.body}');
        res = json.decode(response.body);
      } else {
        print('Failed to send data. Status code: ${response.statusCode}');
        print('Response: ${response.body}');
      }
    } catch (error) {
      print('Error sending data: $error');
    }
    setState(() {
      res["Prediction"] = res["Prediction"];
      res['decision']=res['decision'];
      _isLoading=true;
    });
    return res;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Prediction Page"),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Column(
                children: [
                  TextField(controller: age, decoration: borderprops),
                  TextField(controller: height, decoration: borderprops),
                  TextField(controller: weight, decoration: borderprops),
                  TextField(controller: bmi, decoration: borderprops),
                  TextField(controller: blood_g, decoration: borderprops),
                  TextField(controller: pulse_rate, decoration: borderprops),
                  TextField(controller: res_rate, decoration: borderprops),
                  TextField(controller: haemob, decoration: borderprops),
                  TextField(controller: cycle, decoration: borderprops),
                  TextField(controller: cycle_len, decoration: borderprops),
                  TextField(controller: marr_stat, decoration: borderprops),
                  TextField(controller: preg, decoration: borderprops),
                  TextField(controller: abor, decoration: borderprops),
                  TextField(controller: ibeta, decoration: borderprops),
                  TextField(controller: fsh, decoration: borderprops),
                  TextField(controller: lh, decoration: borderprops),
                  TextField(controller: fshlh, decoration: borderprops),
                  TextField(controller: hip, decoration: borderprops),
                  TextField(controller: waist, decoration: borderprops),
                  TextField(controller: ratio, decoration: borderprops),
                  TextField(controller: tsh, decoration: borderprops),
                  TextField(controller: prl, decoration: borderprops),
                  TextField(controller: vit_d3, decoration: borderprops),
                  TextField(controller: prg, decoration: borderprops),
                  TextField(controller: rbs, decoration: borderprops),
                  TextField(controller: weight_gain, decoration: borderprops),
                  TextField(controller: hair_gro, decoration: borderprops),
                  TextField(controller: skin_dark, decoration: borderprops),
                  TextField(controller: hair_loss, decoration: borderprops),
                  TextField(controller: pimples, decoration: borderprops),
                  TextField(controller: ff, decoration: borderprops),
                  TextField(controller: reg_ex, decoration: borderprops),
                  TextField(controller: bp_sys, decoration: borderprops),
                  TextField(controller: bp_dia, decoration: borderprops),
                  TextField(controller: foll_l, decoration: borderprops),
                  TextField(controller: foll_r, decoration: borderprops),
                  TextField(controller: avg_F_size_l, decoration: borderprops),
                  TextField(controller: avg_F_size_r, decoration: borderprops),
                  TextField(controller: endo, decoration: borderprops),
                  TextButton(
                      onPressed: sendDataToPythonServer, child: Text("Send")),
                  Container(
                      child: Column(
                    children: [
                      _isLoading?
                      Text(
                          "The prediction of the data is ${res["Prediction"]} i.e. ${res['decision']}"):
                          CircularProgressIndicator()
                    ],
                  )),
                ],
              ),
            ],
          ),
        ),
      );
  }
}