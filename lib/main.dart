import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shayri_app/secondpage.dart';

void main() {
  runApp(MaterialApp(
    title: "gjklthl",// web ma run karavti vakhte localhost ni jagya par aa title aave.
    home: types_of_shayri(),
  ));
}

class types_of_shayri extends StatefulWidget {
  @override
  State<types_of_shayri> createState() => _types_of_shayriState();
}

class _types_of_shayriState extends State<types_of_shayri> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    showpermission();
  }

  Future<void> showpermission() async {
    var status = await Permission.storage.status;
    if (status.isDenied) {
      // We didn't ask for permission yet or the permission has been denied before but not permanently.

      await [
        // Permission.location,
        Permission.storage,
      ].request();
    }
    print("status===$status");
  }
  List tos = [
    "Love Shayari",
    "Romantic Shayari",
    "Hot Shayari",
    "Sad Shayari",
    "Dard Shayari",
    "Broken Heart Shayari",
    "BeWafa Shayari",
    "Happy Shayari",
    "Motivation Shayari",
    "Success Shayari",
    "Attitude Shayari",
    "Funny Shayari",
    "Friends Shayari",
    "Festival Shayari"
  ];
  // List img = ["1img.jpg", "2img.jpg", "3img.jpg", "4img.jpg", "5img.jpg"];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Shayari")),
      body: Container(color: Colors.grey.shade300,padding: EdgeInsets.all(10),
        child: ListView.builder(
          // itemCount: 5,  // if itemcount is not then infinity list are print index eg,1,2,3,....
          itemCount: tos.length,
          itemBuilder: (context, index) {
            print("i======$index");
            return Container(color: Colors.white,margin: EdgeInsets.symmetric(vertical: 5),padding: EdgeInsets.symmetric(vertical: 5),
              child: ListTile(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return secondpage(tos, index);
                      // return secondpage(tos[index]);
                    },
                  ));
                },
                // title: Text("index = $index"),
                title: (Text(tos[index])),
                // title: (Text("title")),
                // subtitle: Text("subtitle"),
                // leading: Icon(Icons.people_alt_rounded),
                leading: Image.asset(
                  "myimages/${index + 1}img.jpg",
                  fit: BoxFit.cover,
                  width: 70,
                  height: 500,
                ),
                // leading: Image.asset("myimages/${img[index]}"),
                trailing: Icon(Icons.arrow_forward_ios_rounded),
              ),
            );
          },
        ),
      ),
    );
  }


}
