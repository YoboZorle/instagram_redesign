import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:math';
import 'package:flutter/services.dart';

var image1 = Image.asset("assets/kylie1.jpg");
var image2 = Image.asset("assets/kylie2.jpg");
var image3 = Image.asset("assets/kylie3.jpg");
var image4 = Image.asset("assets/kylie4.jpg");
var image5 = Image.asset("assets/kylie5.jpg");
var image6 = Image.asset("assets/kylie6.jpg");
var image7 = Image.asset("assets/kylie7.jpg");
var image8 = Image.asset("assets/kylie8.jpg");
var image9 = Image.asset("assets/kylie9.jpg");

List<Widget> bottomNavIconList = [
    Icon(
      Icons.home,
      size: 28.0,
      color: Colors.black,
    ),
    Icon(
      Icons.search,
      size: 28.0,
      color: Colors.black,
    ),
    Icon(
      Icons.favorite,
      size: 28.0,
      color: Colors.black,
    ),
    Icon(
      Icons.perm_identity,
      size: 28.0,
      color: Colors.black,
      )
      
  ];

void main() {

  SystemChrome.setEnabledSystemUIOverlays([]);

  runApp(MaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    ));
} 

class _MyAppState extends State<MyApp>{

  List<ClipRRect> images = new List();
  var kylies = [
  {"nombre" : "kylie1", "imagen" : "kylie1.jpg"},
  {"nombre" : "kylie2", "imagen" : "kylie2.jpg"},
  {"nombre" : "kylie3", "imagen" : "kylie3.jpg"},
  {"nombre" : "kylie4", "imagen" : "kylie4.jpg"},
  {"nombre" : "kylie5", "imagen" : "kylie5.jpg"},
  {"nombre" : "kylie6", "imagen" : "kylie6.jpg"},
  {"nombre" : "kylie7", "imagen" : "kylie7.jpg"},
  {"nombre" : "kylie8", "imagen" : "kylie8.jpg"},
  {"nombre" : "kylie9", "imagen" : "kylie9.jpg"},
];
  getListImagesData() async {
  for (var i = 0; i < kylies.length; i++) {
    final nombre = kylies[i];
    final String imagen = nombre["imagen"];
    images.add(
      ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: new Padding(
          padding: const EdgeInsets.all(2.0),
          child: new Hero(
           tag: nombre["nombre"],
           child: new Material(
             child: InkWell(
               child: new Image.asset("assets/$imagen", fit: BoxFit.cover,),
               onTap: ()=> Navigator.of(context).push(new MaterialPageRoute(
                 builder: (BuildContext context) => new ImageView(nombre: nombre["nombre"],imagen: imagen,),
               )),
             ), 
           ),
          ),
        ),
      )
    );
  }
}
@override
void initState(){
  getListImagesData();
  super.initState();
}
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.only(top:5.0, right: 5.0, left: 5.0),
          child: SingleChildScrollView(
            child: Column( 
              children: <Widget>[
                AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0.0,
                    leading: IconButton(
                      splashColor: Colors.transparent,
                      icon: Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: (){},
                    ),
                    title: Text("kylie jenner", 
                        style: TextStyle(color: Colors.black, fontFamily: "Sultan", fontSize: 25,)
                    ),
                    actions: <Widget>[
                      IconButton(
                        splashColor: Colors.transparent,
                        icon: Icon(Icons.more_horiz, color: Colors.black),
                        onPressed: () {},
                      )
                    ],
                  ),
                Container(
                  height: 103,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                       child:Padding(padding: EdgeInsets.only(bottom:5.0, left: 10.0, right: 5.0),
                        child: Center(
                          child: ClipOval(
                            child: Container(
                              width: 70.0,
                              height: 70.0,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: image5.image,
                                  fit: BoxFit.cover
                                )
                              ),
                            ),
                          ),
                        ) 
                      )
                      ),
                       Expanded(
                        flex: 2,
                        child: Column(
                          children: <Widget>[
                            Container(
                              child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                  "kylie jenner",
                                  style: TextStyle(
                                    color: Colors.black, fontFamily: "Sultan", fontSize: 22
                                  )
                                ),
                              ),
                            ),
                            Container(
                              child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                  "Fashion",
                                  style: TextStyle(
                                    color: Colors.black26, fontFamily: "Sultan", fontSize: 17
                                  )
                                ),
                              ),
                            ),
                            Container(
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Model",
                                  style: TextStyle(
                                    color: Colors.black38, fontFamily: "Sultan", fontSize: 16
                                  )
                                ),
                              ),
                            ),
                            Container(
                              child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Linkify(
                                    onOpen: (link) async {
                                      if (await canLaunch(link.url)) {
                                          await launch(link.url);
                                        } else {
                                          throw 'Could not launch $link';
                                        }
                                    },
                                    text: "Cosmetics: https://www.kyliecosmetics.com",
                                    style: TextStyle(color: Colors.black, fontFamily: "Sultan", fontSize: 16),
                                    linkStyle: TextStyle(color: Colors.blue[300]),
                                  )
                              ),
                            ),
                          ],
                        ),
                       ),
                     ],
                   ),
                 ),
                 Container(
                   height: 30,
                   child: Padding(
                     padding: const EdgeInsets.only(right:35.0),
                     child: Divider(
                       color: Colors.black54,
                       indent: 35,
                       ),
                     ),
                   ),
                 Padding(
                   padding: const EdgeInsets.only(right:12, left: 12,bottom: 13),
                   child: Container(
                     height: 80,
                     child: Row(
                       children: <Widget>[
                         Expanded(
                           child: Column(
                             children: <Widget>[
                               Expanded(
                                 child: Container(
                                   child: Align(
                                     alignment: Alignment.bottomCenter,
                                       child: Text(
                                       "5904",
                                       style: TextStyle(
                                         fontFamily: "Sultan", fontSize: 21, color: Colors.black
                                       ),
                                     ),
                                   ),
                                 ),
                               ),
                               Expanded(
                                 child: Container(
                                   child: Align(
                                     alignment: Alignment.topCenter,
                                     child: Text(
                                       "Posts",
                                       style: TextStyle(
                                         color: Colors.grey[400], fontFamily: "Sultan", fontSize: 16
                                       )
                                     ),
                                   ),
                                 ),
                               ),
                             ],
                           ),
                          ),
                          Expanded(
                           child: Column(
                             children: <Widget>[
                               Expanded(
                                 child: Container(
                                   child: Align(
                                     alignment: Alignment.bottomCenter,
                                       child: Text(
                                       "134M",
                                       style: TextStyle(
                                         fontFamily: "Sultan", fontSize: 21, color: Colors.black
                                       ),
                                     ),
                                   ),
                                 ),
                               ),
                               Expanded(
                                 child: Container(
                                   child: Align(
                                     alignment: Alignment.topCenter,
                                     child: Text(
                                       "Followers",
                                       style: TextStyle(
                                         color: Colors.grey[400], fontFamily: "Sultan", fontSize: 16
                                       )
                                     ),
                                   ),
                                 ),
                               ),
                             ],
                           ),
                          ),
                          Expanded(
                           child: Column(
                             children: <Widget>[
                               Expanded(
                                 child: Container(
                                   child: Align(
                                     alignment: Alignment.bottomCenter,
                                       child: Text(
                                       "126",
                                       style: TextStyle(
                                         fontFamily: "Sultan", fontSize: 21, color: Colors.black
                                       ),
                                     ),
                                   ),
                                 ),
                               ),
                               Expanded(
                                 child: Container(
                                   child: Align(
                                     alignment: Alignment.topCenter,
                                     child: Text(
                                       "Following",
                                       style: TextStyle(
                                         color: Colors.grey[400], fontFamily: "Sultan", fontSize: 16
                                       )
                                     ),
                                   ),
                                 ),
                               ),
                             ],
                           ),
                          ),
                        ],
                      ),
                    ),
                  ),
                 Container(
                   height: 0.1,
                   child: Padding(
                     padding: const EdgeInsets.only(right:35.0),
                     child: Divider(
                       color: Colors.black54,
                       indent: 35,
                       ),
                     ),
                   ),
                 Padding(
                   padding: const EdgeInsets.all(25.0),
                   child: Row(
                     children: <Widget>[
                       Container(
                         child: Padding(
                           padding: const EdgeInsets.only(left:5,right: 20.0),
                           child: RaisedGradientButton(
                             width: 210,
                            child: Text(
                              'Follow',
                              style: TextStyle(color: Colors.white, fontFamily: 'Sultan', fontSize: 16),
                            ),
                            gradient: LinearGradient(
                              colors: <Color>[Colors.blue[300], Colors.purple[300]],
                            ),
                            onPressed: (){
                            },
                            shapeBorder: 10,
                           ),
                         ),
                       ),
                       Container(
                         height: 50,
                         width: 60,
                         child: RaisedButton(
                           color: Colors.white,
                           elevation: 3,
                           shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),
                          child: Icon(
                            Icons.send,
                            color: Colors.black,
                          ),
                          onPressed: (){
                            print('button clicked');
                          }
                         ),
                       ),
                      ],
                    ),
                 ),
                 Container(
                  height: 80,
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: _getListStoriesData(),
                  ),
                ),
                Container(
                  height: 360,
                  child: new GridView.count(
                    physics: BouncingScrollPhysics(),
                    crossAxisCount: 3,
                    children: images
                    ),
                )
              ],
            ),
          ),
        ),
      bottomNavigationBar: Container(
        height: 60.0,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
           BoxShadow(
              color: Colors.black12.withOpacity(0.065),
              offset: Offset(0.0, -3.0),
              blurRadius: 10.0)
        ]),
        child: Row(
          children: bottomNavIconList.map((item) {
            var index = bottomNavIconList.indexOf(item);
            return Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                child: _bottomNavItem(item, index == _currentIndex),
              ),
            );
          }).toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink.shade300,
        onPressed: () {},
        isExtended: true,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
class RaisedGradientButton extends StatelessWidget {
  final Widget child;
  final Gradient gradient;
  final double width;
  final double height;
  final Function onPressed;
  final double shapeBorder;

  const RaisedGradientButton({
    Key key,
    @required this.child,
    this.gradient,
    this.width = double.infinity,
    this.height = 50.0,
    this.onPressed,
    this.shapeBorder
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 50.0,
      decoration: BoxDecoration(borderRadius:BorderRadius.circular(shapeBorder),gradient: gradient, boxShadow: [
        BoxShadow(
          color: Colors.grey[500],
          offset: Offset(0.0, 1.5),
          blurRadius: 1.5,
        ),
      ]),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
            onTap: onPressed,
            child: Center(
              child: child,
            )),
      ),
    );
  }
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}
class ImageView extends StatelessWidget {
  
  ImageView({
    this.nombre, this.imagen
  });

  final String nombre;
  final String imagen;
  @override
  Widget build(BuildContext context) {
  return Scaffold(
      body: 
      Container(
        color: Colors.black,
        child: Column(
          children: <Widget>[
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom:8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(bottomLeft:Radius.circular(35), bottomRight: Radius.circular(35)),
                    child: new Container(
                      height: 470,
                      decoration: new BoxDecoration(
                        image: new DecorationImage(
                          image: Image.asset("assets/$imagen").image,
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: new BackdropFilter(
                        filter: new ImageFilter.blur(sigmaX: 35.0, sigmaY: 35.0),
                        child: new Container(
                          decoration: new BoxDecoration(color: Colors.white.withOpacity(0.0)),
                          child: Column(
                            children: <Widget>[
                              AppBar(
                                  backgroundColor: Colors.transparent,
                                  elevation: 0.0,
                                  leading: Padding(
                                    padding: const EdgeInsets.only(top:25.0),
                                    child: IconButton(
                                      splashColor: Colors.transparent,
                                      icon: Icon(Icons.arrow_back, color: Colors.white),
                                      onPressed: (){
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ),
                                  title: Padding(
                                    padding: const EdgeInsets.only(top:25.0),
                                    child: Center(
                                      child: ClipOval(
                                        child: Container(
                                          width: 30.0,
                                          height: 30.0,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: image5.image,
                                              fit: BoxFit.cover
                                            )
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  actions: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(top:25.0),
                                      child: IconButton(
                                        splashColor: Colors.transparent,
                                        icon: Icon(Icons.more_horiz, color: Colors.white),
                                        onPressed: () {},
                                      ),
                                    )
                                  ],
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(35), bottomRight: Radius.circular(35)),
                                  ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left:8.0,right:8.0,bottom:8.0,top:20.0),
                                  child: Column(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(bottom:8.0),
                                        child: Container(
                                          height: 300,
                                          width: 300,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(25),
                                            boxShadow: [
                                              new BoxShadow(
                                                color: Colors.black45,
                                                blurRadius: 20,
                                                offset: new Offset(10.0, 10.0),
                                              )
                                            ],
                                            image: DecorationImage(
                                              image: Image.asset("assets/$imagen").image,
                                              fit: BoxFit.cover
                                            )
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(bottom:4.0),
                                        child: Row(
                                          children: <Widget>[
                                            Container(
                                              child: IconButton(
                                                icon: Icon(
                                                  Icons.favorite_border, color: Colors.white,
                                                ), onPressed: () {},
                                              ),
                                            ),
                                            Container(
                                              child: Text(
                                                "1209",
                                                style: TextStyle(
                                                    color: Colors.white
                                                  ),
                                              ),
                                            ),
                                            Container(
                                              child: IconButton(
                                                icon: Icon(
                                                  Icons.comment, color: Colors.white,
                                                ), onPressed: () {},
                                              ),
                                            ),
                                            Expanded(
                                              flex: 2,
                                              child: Container(
                                                child: Text(
                                                  "15",
                                                  style: TextStyle(
                                                    color: Colors.white
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              child: IconButton(
                                                icon: Icon(
                                                  Icons.save_alt, color: Colors.white
                                                ), onPressed: () {},
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              alignment: Alignment.topLeft,
              height: 150,
              width: 400,
              child: ListView(
                scrollDirection: Axis.vertical,
                children: _commentList()
              )
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 30, right: 30),
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Row(
                    children: <Widget>[
                      Container(
                        height: 50,
                        width: 9,
                        padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                        color: Colors.white,
                        child: TextField(
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.text,
                          textCapitalization: TextCapitalization.characters,
                          style: TextStyle(
                            fontFamily: "Sultan",
                              color: Colors.black,
                              fontSize: 19
                          ),
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(
                            borderRadius:BorderRadius.circular(5.0)),
                            hintText: 'Add a comment...',
                            hintStyle: TextStyle(
                              fontFamily: "Sultan",
                              color: Colors.black,
                              fontSize: 19
                            )
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
_bottomNavItem(Widget item, bool isSelected) => Container(
  decoration: BoxDecoration(
    boxShadow: isSelected
    ? [
        BoxShadow(
          color: Colors.black12,
          offset: Offset(0.0, 5.0),
          blurRadius: 20.0)
      ]:[]
  ),
    child: item,
);
_commentList(){
  List<Widget> widgets = [];
  for(int i = 0; i < 8; i++){
    widgets.add(
      Padding(
        padding: const EdgeInsets.only(bottom:8.0),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left:30.0,right: 20),
              child: Center(
                child: ClipOval(
                  child: Container(
                    width: 30.0,
                    height: 30.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: image2.image,
                        fit: BoxFit.cover
                      )
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right:30.0),
              child: Column(
                children: <Widget>[
                  Container(
                    child: Text(
                      "Derek Durán", style: TextStyle(
                        color: Colors.grey, fontFamily: 'Sultan', fontSize: 18
                      ),
                    ),
                  ),
                  Container(
                    width: 75,
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Derek Durán", style: TextStyle(
                        color: Colors.white, fontFamily: 'Sultan', fontSize: 17
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:110.0),
              child: Container(
                alignment: Alignment.topLeft,
                child: IconButton(
                  color: Colors.white,
                  iconSize: 20,
                  icon: Icon(
                    Icons.favorite_border
                  ), onPressed: () {},
                ),
              ),
            )
          ],
        ),
      )
    );
  }
  return widgets;
}
_getListStoriesData() {
  List<Widget> widgets = [];
  for (int i = 0; i < 8; i++) {
    if(i == 0){
       widgets.add(
        Padding(padding: EdgeInsets.symmetric(horizontal:20, vertical: 15),
          child: Center(
            child: ClipOval(
              child: Container(
                width: 50.0,
                height: 50.0,
                child: RaisedButton(
                  color: Colors.black87,
                  onPressed: () {},
                  child: Icon(Icons.add,color: Colors.pink[200],size: 19,),
                ),
              ),
            ),
          ) 
        )
      );
    }
    else{
      var rng = new Random();
      int a = (rng.nextInt(8)) + 1;
      widgets.add(
        Padding(padding: EdgeInsets.symmetric(horizontal:20, vertical: 15),
          child: Center(
            child: ClipOval(
              child: Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: Image.asset("assets/kylie" + a.toString()+ ".jpg").image,
                    fit: BoxFit.cover
                  )
                ),
                child: FlatButton(
                  onPressed: () {},
                  child: null,
                  ),
                ),
              ),
            ) 
          )
        );
      }
    }
return widgets;
}
