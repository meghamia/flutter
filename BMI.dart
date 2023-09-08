

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'ResultPage.dart';

class BMIcalculator extends StatefulWidget{
  BMIcalculator({Key? key}): super(key: key);
  State<BMIcalculator> createState()=> _BMIcalculatorState();

}

class _BMIcalculatorState extends State<BMIcalculator> {
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();

  //double? bmi;
  double? _bmi = null;

  String _message = 'enter you weight';
  void _calculate(){
    final double? height = double.tryParse(_heightController.value.text);
    final double? weight = double.tryParse(_weightController.value.text);

    if (height== null||height<0||weight==null||weight<=0){
      setState((){
        _message = "Your height and weight must be in the positive numbers";
      });
      return;
    }
    setState((){
      _bmi = weight/(height/100*height/100);
      if(_bmi! < 18.5){
        _message = "you are underweight";
        Navigator.of(context).pop();
      }else if(_bmi!  < 25){
        _message = "your weight is fine";
        Navigator.of(context).pop();
      }else if(_bmi! < 30){
        _message = "you are overweight";
        Navigator.of(context).pop();
      }else {
        _message = "obsese";
      }
      Navigator.of(context).pop();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultPage(bmi: _bmi!, message: _message),
        ),
      );


    });
  }


  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      body: Center(
        child: SizedBox(
          width: 320,
          child: Card(
            color: Colors.blue,
            elevation: 10,
            child: Padding(
              padding: EdgeInsets.all(5),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                    decoration:
                    const InputDecoration(labelText: 'Height(m)'),
                    controller: _heightController,
                  ),
                  TextField(
                    keyboardType:
                       const TextInputType.numberWithOptions(decimal: true),
                    decoration: const InputDecoration(
                      labelText: 'Weight(kg)',
                    ),
                    controller: _weightController,
                  ),
                  ElevatedButton(onPressed: _calculate,
                    child: const Text('calculate'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    _bmi == null? 'no result': _bmi!.toStringAsFixed(2),
                      style: const TextStyle(fontSize: 50),
                        textAlign: TextAlign.center,
                  ),
                      const SizedBox(height:20,),
                   Text(
                    _message,
                      textAlign: TextAlign.center,
              )

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}





