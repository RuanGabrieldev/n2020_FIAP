import 'package:flutter/material.dart';
import 'package:n2020/screens/apresentation_screen.dart';
import 'package:get/get.dart';

class ApresentationTab extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final int page;

  ApresentationTab(
      {@required this.image,
      @required this.description,
      @required this.title,
      @required this.page});

  @override
  Widget build(BuildContext context) {


    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            child: Image.asset(
              image,
              width: MediaQuery.of(context).size.width * .9,
              height: MediaQuery.of(context).size.height * .4,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * .8,
            height: MediaQuery.of(context).size.height * .3,
            child: Column(
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    color: Colors.black,
                    fontSize: 30,
                    fontFamily: "Josefin",
                    letterSpacing: 2,
                  ),
                  textAlign: TextAlign.center,
                ),



                SizedBox(
                  height: 20,
                ),





                page != 3 ? 
                  Text(
                        description,
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          color: Colors.purple[200],
                          fontSize: 15,
                          fontFamily: "Josefin",
                          letterSpacing: 2,
                        ),
                        textAlign: TextAlign.center,
                      )
                    :
                    
                    
                    
                     Container(
                        width: MediaQuery.of(context).size.width * .8,
                        height: 50,
                        child: FlatButton(
                          shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                          color: Colors.purple[400],
                          onPressed: () {
                            Navigator.of(context).pushReplacementNamed("/home");
                          },
                          child: Text(
                            "Vamos lá!",
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              color: Colors.white,
                              fontSize: 30,
                              fontFamily: "Josefin",
                              letterSpacing: 2,
                            ),
                          ),
                        ),
                      ),



                SizedBox(
                  height: 60,
                ),


             
                SizedBox(
                  width: MediaQuery.of(context).size.width * .5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Icon(
                        Icons.album,
                        size: 15, 
                        color: page == 1 ? Colors.purple[400] : Colors.grey,
                      ),
                      Icon(Icons.album,
                          size: 15,
                          color: page == 2 ? Colors.purple[400] : Colors.grey),
                      Icon(Icons.album,
                          size: 15,
                          color: page == 3 ? Colors.purple[400] : Colors.grey),
                    ],
                  ),
                )

               
              ],
            ),
          )
        ],
      ),
    );
  }
}
