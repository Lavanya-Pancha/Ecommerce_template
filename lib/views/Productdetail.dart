import 'package:expandable_widget/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../ProductModel.dart';

class ProductDetail extends StatefulWidget{
  int id;

  ProductDetail(this.id);

  @override
  _ProductDetailState createState() => _ProductDetailState();
}
class _ProductDetailState extends State<ProductDetail>{
  bool isLiked = true;
  ProductList pList= new ProductList();
  var result;



  _buildArrow(bool expanded) {
    return Container(
      height: 10,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black,
              offset: Offset(1.0, 6.0),
              blurRadius: 40.0,
            ),
          ],
        ),
      alignment: Alignment.center,
      child: IconButton(
        icon: Icon(expanded ?Icons.keyboard_arrow_down:Icons.keyboard_arrow_up,color: Colors.black,size: 30,
        ),
      )

    );
  }
 /* _buildArrow(bool expanded) {
    return Container(
      height: 10,
      alignment: Alignment.center,
      child: Text(
        expanded ? "hide" : "show",
        style: TextStyle(color: Colors.blueAccent),
      ),
    );
  }*/
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    result = pList.productList[widget.id-1];
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent, //No more green
        elevation:0,
        leading:Padding(
          padding: const EdgeInsets.only(left:20.0),
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right:20.0),
            child: IconButton(
              icon: Icon(Icons.favorite_border,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height/1.7,
              width:  MediaQuery.of(context).size.width,
              child: Image.asset(
                result['image'],
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left:20.0,bottom: 10),
                        child: Text(result['name'],
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                color: Colors.black87,
                                fontFamily: 'Roboto-Light.ttf',
                                fontSize: 20,
                                fontWeight: FontWeight.w400)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right:15.0),
                        child: Text('\$'+result['price'],
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Roboto-Light.ttf',
                                fontSize: 20,
                                fontWeight: FontWeight.w700)),
                      ),
                    ],
                  ),
                  Spacer(),
                  Container(
                    width: 150.0,
                    height: 65.0,
                    child: RaisedButton(
                      shape:  RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16.0))),
                      color: Colors.black,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: <Widget>[
                            Text('Cart', style: TextStyle(fontSize:22,color: Colors.white),),
                            Spacer(),
                            Material(
                                type: MaterialType.transparency, //Makes it usable on any background color, thanks @IanSmith
                                child: Ink(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.white,
                                        width: 2.0
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                    // color: Colors.indigo[900],
                                    // shape:  RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16.0))),
                                  ),
                                  child: InkWell(
                                    //This keeps the splash effect within the circle
                                    borderRadius: BorderRadius.circular(10.0), //Something large to ensure a circle
                                    onTap: (){},
                                    child: Padding(
                                        padding:EdgeInsets.all(10.0),
                                        child:Text("+",style: TextStyle(color: Colors.white,fontSize: 20),)
                                    ),
                                  ),
                                )
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child:Text(result['Description'],
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Roboto-Light.ttf',
              ),
              ),
            ),
           /* Padding(
              padding: const EdgeInsets.all(8.0),
              child: ExpandableText.lines(

                //expand: true,
                lines: 2,
                arrowWidgetBuilder: (expanded) => _buildArrow(expanded),
              ),
            ),*/
     /* Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: <Widget>[

            ExpandText(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam suscipit risus pulvinar, hendrerit nisi quis, vehicula ante. Morbi ut diam elit. Praesent non justo sodales, auctor lacus id, congue massa. Duis ac odio dui. Sed sed egestas metus. Donec hendrerit velit magna. Vivamus elementum, nulla ac tempor euismod, erat nunc mollis diam, nec consequat nisl ex eu tellus. Curabitur fringilla enim at lorem pulvinar, id ornare tellus aliquam. Cras eget nibh tempor lacus aliquam rutrum.',
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      )*/

          ],
        ),
      ),
      bottomNavigationBar: new Stack(
        overflow: Overflow.visible,
        alignment: new FractionalOffset(.5, 1.0),
        children: [
          new Container(
            height: MediaQuery.of(context).size.height/14,
            width: MediaQuery.of(context).size.width,
            color: Colors.black,
            child: Padding(
              padding: const EdgeInsets.only(top:23.0),
              child: GestureDetector(
                child: Text("BUY NOW",
                textAlign: TextAlign.center,
                style:  TextStyle(
                    color: Colors.white,
                    fontFamily: 'Roboto-Light.ttf',
                    fontSize: 22,
                    fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ),
         /* new Padding(
            padding: const EdgeInsets.only(bottom: 40.0),
            child: new FloatingActionButton(
              // notchMargin: 24.0,
              elevation: 0.0,
              backgroundColor: Colors.white,
              onPressed: (){
                ExpandableText.lines(
                  result['Description'],
                  //expand: true,
                  lines: 4,
                  arrowWidgetBuilder: (expanded) => _buildArrow(expanded),
                );
              },
              child: new Icon(Icons.keyboard_arrow_down),
            ),
          ),*/
        ],
      ),
    );
  }
}