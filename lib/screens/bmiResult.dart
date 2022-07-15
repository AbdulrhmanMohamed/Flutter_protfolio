import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class BMIResult extends StatelessWidget {
 final result;
 final Gender;
  
  BMIResult({
    Key? key,
    this.result,
    this.Gender
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Result"),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("RESULT:${result}",style: TextStyle(fontSize: 50),),

          SizedBox(height: 30,),
          Text("Gender: $Gender",style: TextStyle(fontSize: 50),)

          
        ],
      )),
    );
  }
}
