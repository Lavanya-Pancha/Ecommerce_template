import 'package:ecommerce/ProductModel.dart';
import 'package:ecommerce/widgets/GridTile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class homePage extends StatefulWidget{
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage>{
  ProductList pList= new ProductList();
  int _itemCount = 10;
  var controller = ScrollController();
  var results,fullResult;
  bool show=false;
  TextEditingController _controller=new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fullResult= pList.productList;
    results=fullResult;

  }
  @override
  void dispose() {
    super.dispose();
  }

  Widget productlistView(BuildContext context) {

    return GridView.count(
      controller: controller,
      shrinkWrap: true,
      crossAxisCount: 2,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.all(1.0),
      childAspectRatio: 8.0 / 12.0,
      children: List<Widget>.generate(results.length, (index) {
        return GridTile(
            child: GridTiles(
              id:results[index]['id'],
              name: results[index]['name'],
              imageUrl: results[index]['image'],
              price: results[index]["price"],
            )
        );
      }),
    );
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
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right:20.0),
              child: IconButton(
                icon: ImageIcon(
                  AssetImage('assets/images/four-icon.png'),
                ),
                onPressed: () {
                  // do something
                },
              ),
            )
          ],

        ),
        body:SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Material(
                        type: MaterialType.transparency, //Makes it usable on any background color, thanks @IanSmith
                        child: Ink(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 4.0
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                            // color: Colors.indigo[900],
                            // shape:  RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16.0))),
                          ),
                          child: InkWell(
                            //This keeps the splash effect within the circle
                            borderRadius: BorderRadius.circular(20.0), //Something large to ensure a circle
                            onTap: (){
                              setState(() {
                                show = show?false:true;
                                _controller.clear;
                              });
                            },
                            child: Padding(
                              padding:EdgeInsets.all(10.0),
                              child: Icon(
                                Icons.search,
                                size: 40.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        )
                    ), Material(
                        type: MaterialType.transparency, //Makes it usable on any background color, thanks @IanSmith
                        child: Ink(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 4.0
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                            // color: Colors.indigo[900],
                            // shape:  RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16.0))),
                          ),
                          child: InkWell(
                            //This keeps the splash effect within the circle
                            borderRadius: BorderRadius.circular(20.0), //Something large to ensure a circle
                            onTap: (){},
                            child: Padding(
                              padding:EdgeInsets.all(10.0),
                              child: Icon(
                                MdiIcons.tuneVertical,
                                size: 40.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        )
                    ),
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
                                        child:Text("2",style: TextStyle(color: Colors.white,fontSize: 20),)
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
              show?Padding(
                padding: EdgeInsets.only(left: 20, right: 20,bottom:10),
                child:TextFormField(
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  controller: _controller,
                  onChanged: (value){
                    if(value.isNotEmpty){
                     List item=[];
                     results.forEach((j){
                       if(j['name'].toLowerCase().contains(value.toLowerCase())){
                         item.add(j);
                       }
                     });
                      setState(() {
                        results=item;
                      });
                    }
                    else{
                      setState((){
                        results=fullResult;
                      });
                    }
                  },
                  decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding:
                        EdgeInsets.only(left: 5, right: 10),
                        child:
                        Icon(Icons.search_rounded, color: Colors.black, size: 32.0),
                      ),
                      suffixIcon: IconButton(
                        onPressed: (){
                          _controller.clear();
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => payment(widget.job_id,widget.total_amtt)));
                        },
                        icon: Icon(Icons.clear),
                      ),
                      errorStyle: TextStyle(color: Colors.red,fontSize: 13,fontWeight: FontWeight.w400,),
                      contentPadding: EdgeInsets.all(12),
                      labelText: "Search Products"),
                ),
              ):Container(),
              Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: productlistView(context)
              ),
            ],
          ),
        )
    );
  }
}