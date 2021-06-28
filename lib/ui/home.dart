import 'package:flutter/material.dart';

class ScaffoldExample extends StatelessWidget {


  _tapButton(){
    debugPrint ("Tapped button");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scaffold"),
        centerTitle: true,
        backgroundColor: Colors.amberAccent.shade400,
        actions: <Widget> [
          IconButton(icon: Icon(Icons.email), onPressed: () => debugPrint ("Tapped")),
          IconButton(icon: Icon (Icons.access_alarms), onPressed: _tapButton ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightGreen,
        child: Icon(Icons.add),
        onPressed: () => debugPrint ("Floating button")
      ),
      backgroundColor: Colors.redAccent.shade100,
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet), title: Text("First")),
        BottomNavigationBarItem(icon: Icon(Icons.ac_unit_rounded), title: Text("Second")),
        BottomNavigationBarItem(icon: Icon(Icons.access_alarm), title: Text("Third"))

      ], onTap: (int index) => debugPrint("Tapped item : $index"),),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            // InkWell(
            //   child: Text("Tap me",
            //   style: TextStyle(fontSize: 23.4),),
            //
            //   onTap: () => debugPrint ("Tapped"),
            // )
            CustomButton()
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        final snackBar = SnackBar(content: Text("Hello snackbar"),
        backgroundColor: Colors.amberAccent.shade700,);

        Scaffold.of(context).showSnackBar(snackBar);
      },

      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: Colors.pinkAccent,
            borderRadius: BorderRadius.circular(8.0)
        ),
        child: Text("Button"),

      ),
    );
  }
}


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.deepOrange,
      child: Center(
          child: Text(
        "Hello there",
        textDirection: TextDirection.ltr,
        style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 23.4,
            fontStyle: FontStyle.italic),
      )),
    );
    // return Center(
    //   child: Text("Hello there", textDirection: TextDirection.ltr,),
    // );
  }
}
