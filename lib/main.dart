import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}


class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter BMI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? Key}) : super(key: Key);

  @override
  State <MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();
  var result = "";
  var bgColor = Colors.indigo.shade200;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('YOUR  BMI'),
        ),
        
        body: Container(
          color: bgColor,
          child: Center(
            child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('BMI', style: TextStyle(
                  fontSize: 34, fontWeight: FontWeight.w700,
                ) ,),

                SizedBox(height: 21),
               TextField(
                 controller: wtController,
                 decoration: InputDecoration(
                   label: Text('Enter your Weight in Kg'),
                   prefixIcon: Icon(Icons.line_weight)
                 ),
                 keyboardType: TextInputType.number,
               ),

                SizedBox(height: 11),
                TextField(
                  controller: ftController,
                  decoration: InputDecoration(
                      label: Text('Enter your Height in ft'),
                      prefixIcon: Icon(Icons.height)
                  ),
                  keyboardType: TextInputType.number,
                ),
                   SizedBox(height: 11),



                TextField(
                  controller: inController,
                  decoration: InputDecoration(
                      label: Text('Enter your Height in inch'),
                      prefixIcon: Icon(Icons.height)
                  ),
                  keyboardType: TextInputType.number,
                ),

                SizedBox(height: 16),
               ElevatedButton(onPressed: (){

                   var wt = wtController.text.toString();
                   var ft = ftController.text.toString();
                   var inch = inController.text.toString();
                  if(wt!="" && inch!=""){
                     var iWt = int.parse(wt);
                     var iFt = int.parse(ft);
                     var iInch = int.parse(inch);

                    var tInch = (iFt*12) + iInch;
                    var tCm = tInch*2.54;
                    var tM = tCm/100;
                    var bmi = iWt/(tM*tM);
                       var msg = "";

                        if(bmi>25){
                         msg = "You're OverWeight!!";
                         bgColor = Colors.orange.shade200;
    } else if(bmi<18){
       msg = "You're UnderWeight!!";
        bgColor = Colors.red.shade200;
    } else {
       msg = "You're Healthy!!";
        bgColor = Colors.green.shade200;
    }

                    setState(() {
                      result = "$msg \n Your BMI is: ${bmi.toStringAsFixed(4)}";
                    });

                  }else {
                     setState(() {
                       result = "Please fill all the required blanks!!";
                     });
                  }

               }, child: Text('Calculate')),

                SizedBox(height: 11,),

                Text(result, style: TextStyle(fontSize: 19), )
              ],
            ),
          ),
        )
        )
    );
  }
}