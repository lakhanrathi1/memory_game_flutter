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


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    paisr = getPairs();
    paisr.shuffle();

    visiblepaisr = paisr;
    Future.delayed(const Duration(seconds: 5
    ),(){
      selected  = true;

      setState(() {
        selected  = false;
        visiblepaisr = getQuestionPairs();
        paisr = visiblepaisr;

      });

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 50,horizontal: 20),
        child: Column(
          children: <Widget>[
            SizedBox(height: 50,),
            Text("$points/800",style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w500
            ),),
            Text("False"),
            SizedBox(height: 20.0,),
            GridView(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    mainAxisSpacing:0.0,maxCrossAxisExtent: 100),
                children: List.generate(paisr.length, (index){
                  return Tile(
                    imagePath: paisr[index].getImagePath(),
                    tileIndex: index,
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
//  bool isSeleted;
  int tileIndex;
  _HomePageState parent;

  Tile({this.imagePath,this.parent,this.tileIndex});

  @override
  _TileState createState() => _TileState();
}

class _TileState extends State<Tile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(!selected){
          setState(() {
            paisr[widget.tileIndex].setIsSelected(true);
          });
          if(selectedImagePath != ""){

            if(selectedImagePath == paisr[widget.tileIndex].getImagePath()){

              Future.delayed(const Duration(seconds: 2),(){
                points = points + 100;
                setState(() {

                });

                widget.parent.setState(() {


                  paisr[widget.tileIndex].setImageAssetPath("");
                  paisr[selectedTileIndex].setImageAssetPath("");

                });
              });

            }else{


            }

          }else{

            selectedTileIndex = widget.tileIndex;
            selectedImagePath = paisr[widget.tileIndex].getImagePath();
          }
//          selected = true;
           }

      },
      child: Container(
        margin: EdgeInsets.all(5),
        child: Image.asset(paisr[widget.tileIndex].getIsSelected()
            ? paisr[widget.tileIndex].getImagePath(): widget.imagePath),
//        child: paisr[widget.tileIndex].getImagePath()!= "" ?
//        Image.asset(paisr[widget.tileIndex].getIsSelected() ? widget.imagePath
//            :paisr[widget.tileIndex].getImagePath()) : Image.asset("assets/correct.png")

      ),
    );
  }
}

