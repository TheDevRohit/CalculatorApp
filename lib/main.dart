import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {

    var _controller1  = TextEditingController();
    var _controller2  = TextEditingController();
    var result;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Basic Calculator" ,style: TextStyle(fontSize: 24 , fontWeight: FontWeight.w500),),
            Icon(Icons.calculate_outlined,size: 35,),
          ],
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25 ,vertical: 30),
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children: [
            TextField(

              keyboardType: TextInputType.number,
              controller: _controller1,
              decoration: InputDecoration(
                hintText: "Enter First Number ",
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
             SizedBox(height: 30,),


               TextField(
                 keyboardType: TextInputType.number,
              controller: _controller2,
              decoration: InputDecoration(
                hintText: "Enter Second Number ",
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
            SizedBox(height: 30,),
          Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Buttons(text: "Add + ", callback: (){
                  setState(() {
                    result = int.parse( _controller1.text) +int.parse(_controller2.text);
                   });
                  }),

                  Buttons(text: "Sub - ", callback: (){
                     setState(() {
                       result = int.parse( _controller1.text) - int.parse(_controller2.text);
                     });

                  }),

                  Buttons(text: "Mul * ", callback: (){
                    setState(() {
                      result = int.parse( _controller1.text) * int.parse(_controller2.text);
                    });

                  }),

                   Buttons(text: "Div / ", callback: (){
                     setState(() {
                       result = int.parse( _controller1.text) / int.parse(_controller2.text);

                     });

                  })
             ],
            ),
            SizedBox(height: 40,),
           Container(
             height: 70,
             width: double.infinity,
             color: Colors.blue,
             child: Column(
               children: [
                 Padding(
                   padding: const EdgeInsets.only(top: 8 ,bottom: 10),
                   child: Text("Your Result is ",style: TextStyle(fontSize: 23 ,color: Colors.white ,fontWeight: FontWeight.bold),),
                 ),
                 Text("${result}",style: TextStyle(fontSize: 17 ,color: Colors.white) ,),
               ],
             ),
           )
          ],
        ),
      ),
      drawer: Drawer(),
    );
  }
}

class Buttons extends StatelessWidget {

   String text;
   VoidCallback ? callback;
   Color bgcolor;

  Buttons({required this.text , required this.callback,this.bgcolor=Colors.black26});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){
      callback!();
    }, child: Text(text) );
  }
}

