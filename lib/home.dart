import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> liste = ["Üçgen", "Kare", "Çember"];

  bool isAccepted = false;
  var skor = 0;
  @override
  Widget build(BuildContext context) {
    liste.shuffle();

    var ucgen = Image.asset(
      "images/triangle.png",
      width: 50,
      color: Colors.amber,
    );
    var dik = Image.asset(
      "images/rectangle.png",
      width: 50,
      color: Colors.redAccent,
    );
    var cember = Image.asset(
      "images/circle.png",
      width: 50,
      color: Colors.blue,
    );



    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff21cdc0),
        title: Text(
          "Draggable Example",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Draggable(
                    data: "Üçgen",
                    child: ucgen,
                    feedback: ucgen,
                  ),
                  Draggable(
                    data: "Kare",
                    child: dik,
                    feedback: dik,
                  ),
                  Draggable(
                    data: "Çember",
                    child: cember,
                    feedback: cember,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text("${liste[0]}"),
            SizedBox(
              height: 30,
            ),
            Container(
              width: 200,
              height: 200,
              color: Colors.amber,
              child: DragTarget(
                builder: (context, List<String> candidateData, rejectData) {

                  if (isAccepted) {
                    return Center(

                      child: Text(
                        "Başarılı",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  } else {
                    return Center(
                      child: Text(
                        "Error",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  }
                },

                onWillAccept: (data) {
                  if (data == "${liste[0]}") {
                    isAccepted = true;
                    skor = skor+1;
                    setState(() {

                      print(skor);
                    });
                    return true;
                  } else {
                    isAccepted = false;
                    setState(() {
                    });
                    return false;
                  }
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Material(
        elevation: 10,

        child: Container(
          decoration: BoxDecoration(
              color: Color(0xff21cdc0),

              boxShadow: [
                new BoxShadow(
                  offset: new Offset(1.0, 4.0),
                  blurRadius: 10.0,
                  spreadRadius: 0.8,
                )
              ]
          ),
          height: 80,
          child: Center(
              child: Text(

                "SKOR\($skor) ",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              )),
        ),
      ),
    );
  }
}
