import 'package:flutter/material.dart';

class BizCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text ("Bizcard"),
        centerTitle: true,
      ),

      body: Container(
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
           _getCard(),
            _getAvatar()
          ],
        ),
      ),
    );
  }



  Container _getCard() {
    return Container(
      width: 350,
      height: 200,
      margin: EdgeInsets.all(50.0),
      decoration: BoxDecoration(
        color: Colors.indigoAccent,
        borderRadius: BorderRadius.circular(4.5)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Kiiru Maina",
          style: TextStyle ( fontSize: 20,
          color: Colors.white,
          fontWeight: FontWeight.w500),),
          Text("kiiru@kiiru.com"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.account_circle),
              Text("Twitter: @kiiru4reals")
            ],
          )
        ],
      ),
    );
  }

  Container _getAvatar() {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(50.0)),
        border: Border.all(color: Colors.redAccent),
          image: DecorationImage (image: NetworkImage("https://picsum.photos/300/300"),
    fit: BoxFit.cover
    )
      ),
    );
  }
}