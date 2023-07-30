// child: Card(
//     color: Colors.blueGrey,
//     child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Expanded(
//           child: Container(
//               color: Colors.green,
//               alignment: Alignment.center,
//               margin: EdgeInsets.all(20),
//               child: Text(widget.balnkList[widget.index])),
//         ),
//         Row(
//           children: [
//             Expanded(
//                 child: Container(
//               child: Icon(Icons.copy),
//             )),
//             Expanded(
//                 child: Container(
//                   child: Icon(Icons.copy),
//                 )),
//             Expanded(
//                 child: Container(
//                   child: Icon(Icons.copy),
//                 )),
//             Expanded(
//                 child: Container(
//                   child: Icon(Icons.copy),
//                 )),
//             Expanded(
//                 child: Container(
//                   child: Icon(Icons.copy),
//                 )),
//           ],
//         )
//       ],
//     )),

//
// showModalBottomSheet(
// context: context,
// builder: (context) {
// return Container(
// height: 150,
// child: GridView.builder(
// itemCount: 25,
// gridDelegate:
// SliverGridDelegateWithFixedCrossAxisCount(
// crossAxisCount: 7),
// itemBuilder: (context, index) {
// return Container(
// width: 3,
// height: 3,
// color: Colors.red,
// margin: EdgeInsets.all(2),
// );
// },
// ),
// );
// },
// );

// Future<void> showPermission() async {
//   var status = await Permission.storage.status;
//   if(status.isDenied){
//     Map<Permission, PermissionStatus> statuses = await [
//       Permission.storage,
//     ].request();
//   }
// }

// ElevatedButton(onPressed: () {
//
// }, child: Icon(Icons.close))


// GridView.builder(
// itemCount: colorlist.length,
// gridDelegate:
// SliverGridDelegateWithFixedCrossAxisCount(
// crossAxisCount: 7),
// itemBuilder: (context, index) {
// return InkWell(
// onTap: () {
// setState(() {
// print("===$index");
// bgcolor = colorlist[index];
// });
// },
// child: Container(
// color: colorlist[index],
// margin:
// EdgeInsetsDirectional.all(
// 5),
// ),
// );
// },
// ),



// child: TextButton(
// onPressed: () {
// showModalBottomSheet(
// context: context,
// builder: (context) {
// return Container(
// height: 150,
// child: Stack(
// children: [
// GridView.builder(
// itemCount: colorlist.length,
// gridDelegate:
// SliverGridDelegateWithFixedCrossAxisCount(
// crossAxisCount: 7),
// itemBuilder: (context, index) {
// if(index!=6)
// {
// return InkWell(
// onTap: () {
// setState(() {
// print("===$index");
// bgcolor =
// colorlist[index];
// });
// },
// child: Container(
// color: colorlist[index],
// margin:
// EdgeInsetsDirectional
//     .all(
// 5),
// ),
// );
// }
// else
// {
// return Container();
// }
// }
// ),
// Positioned(right: 1,
// child: ElevatedButton(
// onPressed: () {
// Navigator.pop(context);
// },
// child: Icon(Icons.close),
// style: ButtonStyle(
// shape: MaterialStatePropertyAll(
// CircleBorder())),),
// )
// ],
// ),
// );
// },
// );
// },
// child: Text("Backgroung"))