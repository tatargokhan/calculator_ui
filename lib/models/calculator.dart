import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

  Widget budon(String btnText,Color btnColor, Color txtColor){
    return ElevatedButton(
      onPressed: () {
        calculation(btnText);
      },
      style: ElevatedButton.styleFrom(
      padding: EdgeInsets.all(20),
      backgroundColor: btnColor
      ),
      child: Center(child: Text(btnText , style: TextStyle(color: txtColor, fontSize: 35),)),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(40),
                child: Container(
                  child: Text(text,textAlign: TextAlign.left,style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 100,decorationColor: Colors.black),),
                ),
              ),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              budon("AC", Colors.grey.shade500, Colors.black),
              budon("+/-", Colors.grey.shade500, Colors.black),
              budon("%", Colors.grey.shade500, Colors.black),
              budon("÷", Colors.amber.shade700, Colors.white),
            ],
          ),
          SizedBox(height: 10,),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              budon("7", Colors.grey.shade800, Colors.white),
              budon("8", Colors.grey.shade800, Colors.white),
              budon("9", Colors.grey.shade800, Colors.white),
              budon("x", Colors.amber.shade700, Colors.white),
            ],
          ),
          SizedBox(height: 10,),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              budon("4", Colors.grey.shade800, Colors.white),
              budon("5", Colors.grey.shade800, Colors.white),
              budon("6", Colors.grey.shade800, Colors.white),
              budon("-", Colors.amber.shade700, Colors.white),
            ],
          ),
          SizedBox(height: 10,),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              budon("1", Colors.grey.shade800, Colors.white),
              budon("2", Colors.grey.shade800, Colors.white),
              budon("3", Colors.grey.shade800, Colors.white),
              budon("+", Colors.amber.shade700, Colors.white),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed: () {
                
              },
              child: Text("0",
              style: TextStyle(
                color: Colors.white,
                fontSize: 35,
              ),
                ),
                style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                  backgroundColor: Colors.grey.shade800,
                  padding: EdgeInsets.fromLTRB(34, 20, 128, 20)
                )
              ),
              budon(",", Colors.grey.shade800, Colors.white),
              budon("=", Colors.amber.shade700, Colors.white),
            ],
          ),
        ],
      ),
    );
  }




  dynamic text ='0';
  double numOne = 0;
  double numTwo = 0;

  dynamic result = '';
  dynamic finalResult = '';
  dynamic opr = '';
  dynamic preOpr = '';
   void calculation(btnText) {


    if(btnText  == 'AC') {
      text ='0';
      numOne = 0;
      numTwo = 0;
      result = '';
      finalResult = '0';
      opr = '';
      preOpr = '';
    
    } else if( opr == '=' && btnText == '=') {

      if(preOpr == '+') {
         finalResult = add();
      } else if( preOpr == '-') {
          finalResult = sub();
      } else if( preOpr == 'x') {
          finalResult = mul();
      } else if( preOpr == '/') {
          finalResult = div();
      } 

    } else if(btnText == '+' || btnText == '-' || btnText == 'x' || btnText == '/' || btnText == '=') {

      if(numOne == 0) {
          numOne = double.parse(result);
      } else {
          numTwo = double.parse(result);
      }

      if(opr == '+') {
          finalResult = add();
      } else if( opr == '-') {
          finalResult = sub();
      } else if( opr == 'x') {
          finalResult = mul();
      } else if( opr == '/') {
          finalResult = div();
      } 
      preOpr = opr;
      opr = btnText;
      result = '';
    }
    else if(btnText == '%') {
     result = numOne / 100;
     finalResult = doesContainDecimal(result);
    } else if(btnText == '.') {
      if(!result.toString().contains('.')) {
        result = result.toString()+'.';
      }
      finalResult = result;
    }
    
    else if(btnText == '+/-') {
        result.toString().startsWith('-') ? result = result.toString().substring(1): result = '-'+result.toString();        
        finalResult = result;        
    
    } 
    
    else {
        result = result + btnText;
        finalResult = result;        
    }


    setState(() {
          text = finalResult;
        });

  }


  String add() {
         result = (numOne + numTwo).toString();
         numOne = double.parse(result);           
         return doesContainDecimal(result);
  }

  String sub() {
         result = (numOne - numTwo).toString();
         numOne = double.parse(result);
         return doesContainDecimal(result);
  }
  String mul() {
         result = (numOne * numTwo).toString();
         numOne = double.parse(result);
         return doesContainDecimal(result);
  }
  String div() {
          result = (numOne / numTwo).toString();
          numOne = double.parse(result);
          return doesContainDecimal(result);
  }


  String doesContainDecimal(dynamic result) {
    
    if(result.toString().contains('.')) {
        List<String> splitDecimal = result.toString().split('.');
        if(!(int.parse(splitDecimal[1]) > 0))
         return result = splitDecimal[0].toString();
    }
    return result; 
  }

}