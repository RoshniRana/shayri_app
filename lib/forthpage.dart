import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shayri_app/StoregeClass.dart';
import 'package:shayri_app/secondpage.dart';
import 'package:shayri_app/thirdpage.dart';

class forthpage extends StatefulWidget {
  String shayri;
  String emoji;

  forthpage(this.emoji, this.shayri);

  @override
  State<forthpage> createState() => _forthpageState();
}

class _forthpageState extends State<forthpage> {
  Color bgcolor = Colors.orange;
  Color currentfontcolor = Colors.black;
  double currentFontsize = 25;
  String curentFontStyle = "Roboto";
  int emojiIndex = 0;
  List fontList = [
    "Abril_Fatface",
    "Bree_Serif",
    "Bungee_Shade",
    "Fredericka_the_Great",
    "Great_Vibes",
    "Henny_Penny",
    "Lobster",
    "Pacifico",
    "Roboto",
    "Rye",
    "Sacramento",
    "Satisfy",
    "Stint_Ultra_Condensed",
    "Trocchi",
    "Updock"
  ];
  List<Color> colorlist = [
    Colors.blueGrey,
    Colors.black12,
    Colors.brown,
    Colors.indigo,
    Colors.deepOrangeAccent,
    Colors.purple,
    Colors.white,
    Colors.black,
    Colors.green,
    Colors.yellow,
    Colors.redAccent,
    Colors.deepOrange,
    Colors.blueGrey,
    Colors.black12,
    Colors.brown,
    Colors.indigo,
    Colors.deepOrangeAccent,
    Colors.purple,
    Colors.green,
    Colors.yellow,
    Colors.redAccent,
    Colors.deepOrange,
    Colors.blueGrey,
    Colors.black12,
    Colors.brown,
    Colors.indigo,
    Colors.deepOrangeAccent,
    Colors.purple,
    Colors.green,
    Colors.yellow,
    Colors.redAccent,
    Colors.deepOrange,
    Colors.blueGrey,
    Colors.black12,
    Colors.brown,
    Colors.indigo,
    Colors.deepOrangeAccent,
    Colors.purple
  ];
  GlobalKey gb = GlobalKey();
  String folderpath = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${secondpage.globleTos[secondpage.global_index]}")),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: RepaintBoundary(
                key: gb,
                child: Container(
                    decoration: BoxDecoration(color: bgcolor),
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.center,
                    child: Text(
                      style: TextStyle(
                          fontSize: currentFontsize,
                          color: currentfontcolor,
                          // fontWeight: FontWeight.bold,
                          fontFamily: curentFontStyle,
                          ),
                      ("${widget.emoji} \n ${widget.shayri} \n ${widget.emoji}"),
                      textAlign: TextAlign.center,
                    )),
              ),
            ),
            Column(
              children: [
                Container(
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                            child: TextButton(
                                onPressed: () {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return Container(
                                        height: 150,
                                        child: Stack(
                                          children: [
                                            GridView.builder(
                                                itemCount: colorlist.length,
                                                gridDelegate:
                                                    SliverGridDelegateWithFixedCrossAxisCount(
                                                        crossAxisCount: 7),
                                                itemBuilder: (context, index) {
                                                  if (index % 7 == 6) {
                                                    return Container(
                                                      color: Colors.white,
                                                    );
                                                  } else {
                                                    return InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          print("===$index");
                                                          bgcolor =
                                                              colorlist[index];
                                                        });
                                                      },
                                                      child: Container(
                                                        color: colorlist[index],
                                                        margin:
                                                            EdgeInsetsDirectional
                                                                .all(5),
                                                      ),
                                                    );
                                                  }
                                                }),
                                            Positioned(
                                              right: 1,
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Icon(Icons.close),
                                                style: ButtonStyle(
                                                    shape:
                                                        MaterialStatePropertyAll(
                                                            CircleBorder()),
                                                    backgroundColor:
                                                        MaterialStatePropertyAll(
                                                            Colors.red)),
                                              ),
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: Text("Backgroung"))),
                      ),
                      Expanded(
                        child: Container(
                            child: TextButton(
                                onPressed: () {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return Stack(
                                        alignment: Alignment.topRight,
                                        children: [
                                          Container(
                                            height: 150,
                                            child: GridView.builder(
                                              itemCount: colorlist.length,
                                              gridDelegate:
                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: 7),
                                              itemBuilder: (context, index) {
                                                if (index % 7 == 6) {
                                                  return Container(
                                                    color: Colors.white,
                                                  );
                                                }
                                                return InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        currentfontcolor =
                                                            colorlist[index];
                                                      });
                                                    },
                                                    child: Container(
                                                      color: colorlist[index],
                                                      margin:
                                                          EdgeInsetsDirectional
                                                              .all(5),
                                                    ));
                                              },
                                            ),
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Icon(Icons.close),
                                            style: ButtonStyle(
                                                fixedSize: //(meanigless)
                                                    MaterialStatePropertyAll(
                                                        Size(5, 5)),
                                                shape: MaterialStatePropertyAll(
                                                    CircleBorder()),
                                                backgroundColor:
                                                    MaterialStatePropertyAll(
                                                        Colors.red)),
                                          )
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: Text("Text Color"))),
                      ),
                      Expanded(
                        child: Container(
                            child: TextButton(
                                onPressed: () {
                                  _createFolder();
                                  _capturePng().then((value) {
                                    String imgName =
                                        "image${Random().nextInt(100)}.jpg";
                                    String imgPath = "$folderpath/$imgName";
                                    File file = File(imgPath);
                                    file.writeAsBytes(value);
                                    print("future val ==== $value");
                                    file.create();
                                    // Share.shareFiles(['${file.path}'], text: 'Great picture');
                                    Share.shareFiles(['${file.path}'],
                                        text: 'Great picture');
                                  });
                                },
                                child: Text("Share"))),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                            child: TextButton(
                                onPressed: () {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return Container(
                                        child: Stack(
                                          alignment:
                                              AlignmentDirectional.topEnd,
                                          children: [
                                            ListView.builder(
                                              itemCount: fontList.length,
                                              scrollDirection: Axis.horizontal,
                                              itemBuilder: (context, index) {
                                                return InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      curentFontStyle =
                                                          fontList[index];
                                                    });
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        15),
                                                                topRight: Radius
                                                                    .circular(
                                                                        15)),
                                                        color: Colors.blueGrey),
                                                    alignment: Alignment.center,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .all(5),
                                                    child: Text("Shayari",
                                                        style: TextStyle(
                                                            fontFamily:
                                                                fontList[index],
                                                            fontSize: 20)),
                                                    //fontList[index]

                                                    width: 100,
                                                    margin:
                                                        EdgeInsetsDirectional
                                                            .only(
                                                                bottom: 30,
                                                                start: 20,
                                                                top: 30),
                                                  ),
                                                );
                                              },
                                            ),
                                            ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    shape: CircleBorder()),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Icon(Icons.close))
                                          ],
                                        ),
                                        height: 120,
                                        color: Colors.black26,
                                      );
                                    },
                                  );
                                },
                                child: Text("Font"))),
                      ),
                      Expanded(
                        child: Container(
                            child: TextButton(
                                onPressed: () {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return Container(
                                        height: 200,
                                        child: Stack(
                                          alignment: Alignment.topRight,
                                          children: [
                                            ListView.separated(
                                              itemBuilder: (context, index) {
                                                return InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      widget.emoji = modelClass.emoji[index];
                                                    });
                                                  },
                                                  child: ListTile(
                                                    title: Center(
                                                        child: Text(modelClass
                                                            .emoji[index])),
                                                  ),
                                                );
                                              },
                                              separatorBuilder:
                                                  (context, index) {
                                                return Divider(
                                                  thickness: 2,
                                                  height: 1,
                                                );
                                              },
                                              itemCount: 10,
                                            ),
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Icon(Icons.close),
                                              style: ButtonStyle(
                                                  shape:
                                                      MaterialStatePropertyAll(
                                                          CircleBorder()),
                                                  backgroundColor:
                                                      MaterialStatePropertyAll(
                                                          Colors.red)),
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: Text("Emoji"))),
                      ),
                      Expanded(
                        child: Container(
                            child: TextButton(
                                onPressed: () {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return StatefulBuilder(
                                        builder: (context, setStateslider) {
                                          return Container(
                                            height: 150,
                                            color: Colors.black12,
                                            child: Stack(
                                              alignment: Alignment.topRight,
                                              children: [
                                                Slider(
                                                  min: 10,
                                                  max: 60,
                                                  divisions: 4,
                                                  label:
                                                      "${currentFontsize.toInt()}",
                                                  value: currentFontsize,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      print(
                                                          "fontvalue===$value");
                                                      setStateslider(() {
                                                        currentFontsize = value;
                                                      });
                                                    });
                                                  },
                                                ),
                                                ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Icon(Icons.close),
                                                  style: ButtonStyle(
                                                      shape:
                                                          MaterialStatePropertyAll(
                                                              CircleBorder()),
                                                      backgroundColor:
                                                          MaterialStatePropertyAll(
                                                              Colors.red)),
                                                )
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  );
                                },
                                child: Text("Text Size"))),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  _createFolder() async {
    final folderName = "Shayri Images";
    final path = Directory("storage/emulated/0/DCIM/$folderName");
    if ((await path.exists())) {
      // TODO:
      print("exist");
    } else {
      // TODO:
      print("not exist");
      path.create();
    }
    setState(() {
      folderpath = path.path;
    });
  }

  Future<Uint8List> _capturePng() async {
    try {
      print('inside');
      RenderRepaintBoundary? boundary =
          gb.currentContext!.findRenderObject() as RenderRepaintBoundary?;
      ui.Image image = await boundary!.toImage(pixelRatio: 3.0);
      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      var pngBytes = byteData!.buffer.asUint8List();
      var bs64 = base64Encode(pngBytes);
      print(pngBytes);
      print(bs64);
      setState(() {});
      return pngBytes;
    } catch (e) {
      print(e);
      return Future.value();
    }
  }
}
