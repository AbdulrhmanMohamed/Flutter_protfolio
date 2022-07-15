
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:portfolio/screens/bmiResult.dart';

class BMI extends StatefulWidget {
  const BMI({Key? key}) : super(key: key);

  @override
  State<BMI> createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  bool isMale=true;
  int height =80;
  int weight=60;
  double ?res;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("BMI CAlCULATOR")),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                      child: GestureDetector(
                        onTap: ()=>{
                          setState(() => {
                            isMale=false
                          })
                        },
                        child: Container(
                                          decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color:isMale?Colors.blue: Colors.grey[400],
                                          ),
                                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.male_outlined,
                            size: 70,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Male", style: TextStyle(fontSize: 35))
                        ],
                                          ),
                                        ),
                      )),
                  SizedBox(width: 10),
                  Expanded(
                      child: GestureDetector(
                        onTap: ()=>{
                          setState(() => {
                            isMale=true
                          },)
                        },
                        child: Container(
                                          decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color:!isMale?Colors.blue: Colors.grey[400],
                                          ),
                                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.female_outlined,
                            size: 70,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'FeMale',
                            style: TextStyle(fontSize: 35),
                          )
                        ],
                                          ),
                                        ),
                      )),
                ],
              ),
            )),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                     
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            height.toInt().toString(),
                            style: TextStyle(fontSize: 50),
                          ),
                          Text(
                            "cm",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Slider(
                        value: height.toDouble(),
                        onChanged: (value) => {
                          setState(()=>{
                            height=value.toInt()
                          })
                        },
                        min: 80,
                        max: 220,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  crossAxisAlignment:CrossAxisAlignment.center,
                  children: [
                  
                  Expanded(
                      child: Container(
                        decoration: BoxDecoration(color: Colors.grey[400],borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        Text("Height",style: TextStyle(fontSize: 40),),
                        Text(
                          "$height",
                          style: TextStyle(fontSize: 25),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(mini: true,onPressed:()=>{
                              setState(() =>{
                                height++
                              } ),
                            },child: Icon(Icons.add), heroTag: 'plusheight',),
                            FloatingActionButton(mini: true,onPressed:()=>{
                              setState(()=>{
                                height--
                              })
                            },child: Icon(Icons.minimize), heroTag: 'minusHeight',)
                          ],
                        )
                    ],
                  ),
                      )),
                  SizedBox(width:10),
                  Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(10),

                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        Text("Weight",style: TextStyle(fontSize: 40),),
                        Text(
                          "$weight",
                          style: TextStyle(fontSize: 25),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(mini: true,onPressed:()=>{
                              setState(()=>{
                                weight++,
                              
                                
                              })
                            },child: Icon(Icons.add), heroTag: 'plusWeight',),
                            FloatingActionButton(mini: true,onPressed:()=>{
                              setState(()=>{
                                weight--,
                              })
                            },child: Icon(Icons.minimize), heroTag: 'minusWeight',)
                          ],
                        )
                    ],
                  ),
                      ))
                ]),
              ),
            ),
            Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.pink,
                ),
                child: MaterialButton(
                  minWidth: double.infinity,
                  height: 60,
                  color: Colors.blue,
                  onPressed: () => {
                     res=weight/pow(height/100 ,2),
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>BMIResult(
                      Gender: isMale?'Male':'Female',
                      result: res?.round(),
                     )))
                  },
                  child: Text(
                    "CALCULATE",
                    style: TextStyle(color: Colors.white),
                  ),
                ))
          ],
        ));
  }
}
