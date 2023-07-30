import 'package:flutter/material.dart';
import 'package:shayri_app/thirdpage.dart';

import 'StoregeClass.dart';

class secondpage extends StatefulWidget {
  // static int findex = 0;
  static List globleTos = [];
  static int global_index=0;
  List tos;
  int index;
  secondpage(this.tos, this.index);


  // String s;
  // secondpage(String this.s);

  @override
  State<secondpage> createState() => _secondpageState();
}

class _secondpageState extends State<secondpage> {
  List balnkList = [];
  List emj = [];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    secondpage.globleTos=widget.tos;
    secondpage.global_index=widget.index;
    // secondpage.findex=widget.index;
    // print("findex=${secondpage.findex}");
    if (widget.index == 0) {
      balnkList = modelClass.love;
      emj = modelClass.lm[0]["Love Shayari"];
    } else if (widget.index == 1) {
      balnkList = modelClass.romantic;
      emj = modelClass.lm[1]["Romantic Shayari"];
    } else if (widget.index == 2) {
      balnkList = modelClass.hot;
      emj = modelClass.lm[2]["Hot Shayari"];
    }
    print("emj==$emj");
  }

  @override
  Widget build(BuildContext context) {
    print("lkh===${widget.tos[widget.index]}");
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.tos[widget.index]),
      ),
      body: ListView.builder(
        itemCount: balnkList.length,
        itemBuilder: (context, index) {
          print("index===$index");
          return ListTile(
            shape: BorderDirectional(
                bottom: BorderSide(
                    style: BorderStyle.solid, color: Colors.black12)),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return thirdpage(emj,balnkList, index);
                },
              ));
            },
            // title: Text("${modelClass.ll[0]}\n${balnkList[index]}\n${modelClass.ll[0]}",maxLines: 4),
            title: Text(

              // "${modelClass.lm[widget.index][widget.tos[widget.index]][0]}",
              // "${balnkList[index]}",
              "${emj[index]} \n ${balnkList[index]} \n ${emj[index]}",
              // "${balnkList[index]}",
              maxLines: 3,
            ),
            leading: Icon(Icons.perm_identity),
          );
        },
      ),
    );
  }
}
