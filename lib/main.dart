import 'package:flutter/material.dart';
import 'package:memory_game/data/Data.dart';
import 'package:memory_game/model/TileModule.dart';

//import 'model/TileModule.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<TileModel> paisr = new List<TileModel>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    paisr = getPairs();
    paisr.shuffle();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Text("0/800"),
            Text("False"),
            SizedBox(height: 20.0,),
            GridView(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    mainAxisSpacing:0.0,maxCrossAxisExtent: 100),
                children: List.generate(paisr.length, (index){
                  return Tile(
                    imagePath: paisr[index].getImagePath(),
                    isSeleted: paisr[index].getIsSelected(),
                  );
                })
            ),

          ],
        ),
      ),
    );
  }
}

class Tile extends StatefulWidget {

  String imagePath;
  bool isSeleted;
  _HomePageState parent;

  Tile({this.imagePath,this.isSeleted,this.parent});

  @override
  _TileState createState() => _TileState();
}

class _TileState extends State<Tile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: Image.asset(widget.imagePath),
    );
  }
}

