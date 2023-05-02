import 'package:flutter/material.dart';

void main()
{
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: mycla(),
    ),
  );
}
class mycla extends StatefulWidget {
  const mycla({Key? key}) : super(key: key);

  @override
  State<mycla> createState() => _myclaState();
}
class _myclaState extends State<mycla> {

  int firstnum = 0;
  int secondnum = 0;
  String display = "";
  String total = "";
  String operator = "";

  void clicke(String val)
  {
    if(val == "AC")
    {
      display = "";
      firstnum = 0;
      secondnum = 0;
      total = "";
    }
    else if(val == "+" || val == "-" ||  val == "*" ||  val == "/" ||  val == "%")
    {
      firstnum = int.parse(display);
      total = "";
      operator = val;
    }
    else if(val == "=")
    {
      secondnum = int.parse(display);
      if(operator == "+")
      {
        total = (firstnum + secondnum).toString();
      }
      if(operator == "-")
      {
        total = (firstnum - secondnum).toString();
      }
      if(operator == "*")
      {
        total = (firstnum * secondnum).toString();
      }
      if(operator == "/")
      {
        total = (firstnum ~/ secondnum).toString();
      }
      if(operator == "%")
      {
        total = (firstnum  % secondnum).toString();
      }
    }
    else
    {
      total = int.parse(display + val).toString();
    }
    setState((){
      display = total;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [

            Expanded(
              child: Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.bottomRight,
                child: Text("$display",style: TextStyle(fontSize: 50,color: Colors.white),),
              ),
            ),

            Row(
              children: [
                b("AC"),
                a("%"),
                key("/"),
              ],
            ),

            Row(
              children: [
                button("7"),
                button("8"),
                button("9"),
                key("*"),
              ],
            ),

            Row(
              children: [
                button("4"),
                button("5"),
                button("6"),
                key("-"),
              ],
            ),

            Row(
              children: [
                button("1"),
                button("2"),
                button("3"),
                key("+"),
              ],
            ),


            Row(
              children: [
                button("00"),
                button("0"),
                button("."),
                move("="),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
  Widget button(String val)
  {
    return Expanded(
      child: InkWell(
        onTap: (){
          clicke(val);
        },
        child: Container(
          height: 80,
          width: 200,
          child:Center(
            child:Text("$val",style: TextStyle(
                fontSize: 30,color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
  Widget key(String val)
  {
    return  Expanded(
      child: InkWell(
        onTap: (){
          clicke(val);
        },
        child: Container(
          height: 70,
          width: 200,
          child:Center(
            child:Text("$val",style: TextStyle(
                fontSize: 30,color: Colors.blue),
            ),
          ),
        ),
      ),
    );
  }
  Widget move(String val)
  {
    return   Expanded(
      child: InkWell(
        onTap: (){
          clicke(val);
        },
        child: Container(
          alignment: Alignment.center,
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            color: Colors.blue,
            shape: BoxShape.circle,
          ),
          child: InkWell(
              onTap: (){
                clicke;
              },
              child: Text("$val",style: TextStyle(color: Colors.white,fontSize: 30),)),
        ),
      ),
    );
  }
  Widget a(String val)
  {
    return Expanded(
      flex: 1,
      child: InkWell(
        onTap: (){
          clicke(val);
        },
        child: Container(
          height: 80,
          width: 200,
          child:Center(
            child:Text("$val",style: TextStyle(
                fontSize: 30,color: Colors.blue),
            ),
          ),
        ),
      ),
    );
  }
  Widget b(String val)
  {
    return Expanded(
      flex: 2,
      child: InkWell(
        onTap: (){
          clicke(val);
        },
        child: Container(
          alignment: Alignment.center,
          child: Container(
            height: 70,
            width: 150,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(50),
            ),
            child:  Center(child: Text("$val",style: TextStyle(color: Colors.white,fontSize: 30),)),
          ),
        ),
      ),
    );
  }
}
