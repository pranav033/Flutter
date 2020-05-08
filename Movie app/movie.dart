import 'package:flutter/material.dart';
import 'movielist.dart';

class movie extends StatefulWidget {
  @override
  _movieState createState() => _movieState();
}

class _movieState extends State<movie> {
  @override
  Widget build(BuildContext context) {

    List <Movielist> movielist = Movielist.ml();


    return Scaffold(
      appBar: AppBar(
        title: new Text("Movies",
          style: new  TextStyle(fontSize: 30,fontWeight: FontWeight.w600,color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.blueGrey.shade800,
      ),
      backgroundColor: Colors.blueGrey.shade800,
      body:
       ListView.builder(itemCount: movielist.length,itemBuilder: (BuildContext context,int index)
    {return
      Stack(children: <Widget>[

       moviecard(movielist[index], context),
        Positioned(
          top: 12,
         // left: 12,
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(left: 26,top: 12),

            height: 100,
            width:100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(image: NetworkImage(movielist[index].Images[0]),fit: BoxFit.cover),

            ),
          ),
        ),

        ]);}),



          
        );

  }

  Widget moviecard (Movielist movie,BuildContext context)
  {
    return InkWell(
      onTap:  (){
             Navigator.push(context, MaterialPageRoute(builder: (context)=>nextpage(mname: "${movie.Title}",ml: movie,)));
           },
      child: new Container(
        padding: EdgeInsets.only(left: 63) ,
        width: MediaQuery.of(context).size.width,
        height: 120.0,
        child: Card(

          color: Colors.black45,
          elevation: 3,
            child: Padding(
              padding: const EdgeInsets.only(left: 38),
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Text(movie.Title,style: new TextStyle(color: Colors.white,fontWeight: FontWeight.w800,fontSize: 18,fontStyle: FontStyle.italic),),
                      new Text("Rating ${movie.imdbRating}/10",style: new TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w100),),
                    ],
                    
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Released ${movie.Released}",style: new TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w100),),
                      Text(movie.Runtime,style: new TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w100),),
                      Text(movie.Rated,style: new TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w100),),
                      
                    ],
                  )
                ],
              ),
            ),
        ),
        
      ),
    );
  }
}

class nextpage extends StatefulWidget {
  @override
  final String mname;
  final Movielist ml;

  nextpage({this.mname, this.ml});

 // const nextpage({Key key, this.mname}) : super(key: key);
  _nextpageState createState() => _nextpageState(moivename:mname,movie: ml);
}

class _nextpageState extends State<nextpage> {

  final String moivename;

  final Movielist movie;

  _nextpageState({this.moivename, this.movie});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Next",
          style: new TextStyle(fontWeight: FontWeight.w600,fontSize: 26,color: Colors.white),),
        backgroundColor: Colors.blueGrey.shade800,
      ),
     body: new ListView(
       children: <Widget>[
         Stack(
           alignment: Alignment.topCenter,
           children: <Widget>[
             Container(
               height:240,
               width: 420,
               decoration: BoxDecoration(

                 image: DecorationImage(image: NetworkImage(movie.Images[0]),fit: BoxFit.cover),
               ),
             ),

            Stack(

              children: <Widget>[
                Stack(

                  alignment: Alignment.bottomCenter,
                  children: <Widget>[Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [Color(0x00f5f5f5),Color(0xfff5f5f5)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    height: 240,
                  ),
                    Container(
                      height: 200,
                      width: 200,
                      //color: Colors.white,
                      child: Icon(Icons.play_circle_outline,size: 124,color: Colors.white,),
                    )
                  ],
                ),

              ],
            )
            // Icon(Icons.play_circle_outline),
           ],
         ),
         Padding(
           padding: const EdgeInsets.symmetric(horizontal: 16.0),
           child: Row(
             children: <Widget>[
              Card(
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Container(
                    height: 160,
                    width: MediaQuery.of(context).size.width / 4,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: NetworkImage(movie.Images[0]),fit: BoxFit.cover)
                    ),
                  ),
                ),
              ),
               Padding(padding: EdgeInsets.only(left: 16)),
               Expanded(child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: <Widget>[
                   Text("${movie.Released} . ${movie.Genre}".toUpperCase(),
                     style: TextStyle(fontWeight: FontWeight.w600,color: Colors.lightBlue),),
                   Text("${movie.Title}",style: TextStyle(
                     fontWeight: FontWeight.w800,
                     fontSize: 36,
                     color: Colors.blueGrey.shade800
                   ),),
                   Text("${movie.Plot}",style: TextStyle(
                     fontWeight: FontWeight.w400,
                     color: Colors.black
                   ),)
                 ],
               ))
             ],
             
           ),
         ),
         Padding(padding: EdgeInsets.only(top: 12)),
         Padding(

           padding: const EdgeInsets.only(left: 16,right: 16),
           child: Container(
             height: 0.5,
             color: Colors.black45,
           ),
         ),
         Padding(padding: EdgeInsets.only(top: 12)),
         Padding(
           padding: const EdgeInsets.only(left: 16,right: 16),
           child: Column(
             children: <Widget>[
               Row(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: <Widget>[

                   Text("Cast :",style: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.w400),),
                   Padding(padding: EdgeInsets.only(left: 4)),
                   Expanded(child: Text("${movie.Actors}",))
                 ],
               ),
               Row(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: <Widget>[

                   Text("Directors :",style: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.w400),),
                   Padding(padding: EdgeInsets.only(left: 4)),
                   Expanded(child: Text("${movie.Director}",))
                 ],
               ),
               Row(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: <Widget>[

                   Text("Awards :",style: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.w400),),
                   Padding(padding: EdgeInsets.only(left: 4)),
                   Expanded(child: Text("${movie.Awards}",))
                 ],
               ),

             ],
           ),
         ),
         Padding(padding: EdgeInsets.only(top: 12)),
         Padding(

           padding: const EdgeInsets.only(left: 16,right: 16),
           child: Container(
             height: 0.5,
             color: Colors.black45,
           ),
         ),
         //Padding(padding: EdgeInsets.only(top: 12)),
         Padding(
           padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 16),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: <Widget>[
               Text("More Posters".toUpperCase(),
               style: TextStyle(fontSize: 12,color: Colors.black54),),
               Padding(padding: EdgeInsets.only(top: 12)),
               Container(
                 height: 200,
                 child: ListView.separated(
                 scrollDirection: Axis.horizontal,
                 itemBuilder: (context,index)=>(
                   ClipRRect(
                   borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: Container(
                     height: 160,
                     width: MediaQuery.of(context).size.width / 4,
                     decoration: BoxDecoration(
                       image: DecorationImage(image: NetworkImage(movie.Images[index]),fit: BoxFit.cover)
                     ),
                   ),
                 )
                 ),
                     separatorBuilder: (context,index)=>SizedBox(width: 8,),
                     itemCount: movie.Images.length),
               ),
             ],
           ),
         )


       ],
     ),
    );
  }
}
