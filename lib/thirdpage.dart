import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shayri_app/main.dart';
import 'package:shayri_app/secondpage.dart';
import 'StoregeClass.dart';
import 'forthpage.dart';

class thirdpage extends StatefulWidget {
  List emj;
  List balnkList;
  int index;
  static int sindex = 0;
  thirdpage(this.emj,this.balnkList, this.index);


  @override
  State<thirdpage> createState() => _thirdpageState();
}

class _thirdpageState extends State<thirdpage> {
  PageController pg = PageController();
  // bool rightButton = false;

  // Color bgcolor = ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    thirdpage.sindex = widget.index;
    pg = PageController(initialPage: widget.index);
    print("sindex=${thirdpage.sindex}");
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("${secondpage.globleTos[secondpage.global_index]}")),
        body: Card(
          color: Colors.grey,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: PageView.builder(
                  itemCount: widget.balnkList.length,
                  controller: pg,
                  onPageChanged: (value) {
                    setState(() {
                      print("page val==$value");
                      print("widget.index==${widget.index}");
                      // if (rightButton &&
                      //     widget.index < widget.balnkList.length - 1) {
                      //   // pg=PageController(initialPage: widget.index+1);
                      //   value = widget.index + 1;
                      // }
                      widget.index = value;
                      print("changed widget.index==${widget.index}");

                    });
                  },
                  itemBuilder: (context, index) {
                    return Container(
                        color: Colors.indigo,
                        margin: EdgeInsets.all(20),
                        alignment: Alignment.center,
                        child: Text(
                          "${widget.index} ${widget.emj[widget.index]} \n ${widget.balnkList[widget.index]} \n ${widget.emj[widget.index]}",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 30),
                        ));
                  },
                ),
              ),
              Container(
                color: Colors.red,
                margin: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                        onPressed: () {
                          FlutterClipboard.copy(widget.balnkList[widget.index])
                              .then(
                            (value) {
                              Fluttertoast.showToast(
                                  msg: "Copy",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 2,
                                  backgroundColor: Colors.black26,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            },
                          );
                        },
                        icon: Icon(Icons.copy)),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            print("buttonIndex===${widget.index}");
                            if (widget.index > 0) {
                              widget.index--;
                              pg.jumpToPage(widget.index);
                              // rightButton = true;
                            } else {
                              Fluttertoast.showToast(
                                  msg: "first shayri",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.black26,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            }
                          });
                        },
                        icon: Icon(Icons.keyboard_arrow_left)),
                    IconButton(
                        onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return forthpage(widget.emj[widget.index],widget.balnkList[widget.index]);
                        },));

                        },
                        icon: Icon(Icons.edit_note)),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            if (widget.index < widget.balnkList.length - 1) {
                              widget.index++;
                              print("widget index=====${widget.index}");
                              // rightButton = true;
                              pg.jumpToPage(widget.index);
                            } else {
                              Fluttertoast.showToast(
                                  msg: "last shayri",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.black26,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            }
                          });
                        },
                        icon: Icon(Icons.chevron_right)),
                    IconButton(
                        onPressed: () {
                          Share.share(widget.balnkList[widget.index]);
                        },
                        icon: Icon(Icons.share)),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
