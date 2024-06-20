import 'package:bill_split_app/model/bill_split_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

import 'result.dart';

class BillSplitHome extends StatelessWidget {
  BillSplitHome({super.key});

  buildButton(String text, BuildContext context) {
    final model = Provider.of<BillSplitModel>(context, listen: false);
    return Expanded(
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.all(10),
          foregroundColor: Colors.black,
        ),
        onPressed: () {
          if (text == '-') {
            model.clearBill();
          } else {
            model.setBill(model.bill + text);
          }
        },
        child: Text(
          text,
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 25,
            ),
          ),
        ),
      ),
    );
  }

  final TextStyle infoStyle = GoogleFonts.poppins(
    textStyle: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 20,
      color: Colors.white,
    ),
  );

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<BillSplitModel>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(top: 50),
                child: Text(
                  "Bill Split",
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Total",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 25,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Text(
                            model.bill,
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 22,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Friends", style: infoStyle),
                              Text("Tax", style: infoStyle),
                              Text("Tip", style: infoStyle),
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(model.friendsValue.round().toString(),
                                  style: infoStyle),
                              Text("${model.tax}%", style: infoStyle),
                              Text('\$${model.tip.round().toString()}',
                                  style: infoStyle),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "How many friends",
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
              ),
              Slider(
                min: 0,
                max: 15,
                divisions: 15,
                activeColor: Colors.orange,
                inactiveColor: Colors.black,
                value: model.friendsValue,
                onChanged: (value) {
                  model.setFriendsValue(value);
                },
              ),
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Tip',
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                              onPressed: () {
                                model.setTip(model.tip + 1);
                              },
                              icon: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              '\$${model.tip.round().toString()}',
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                model.setTip(model.tip - 1);
                              },
                              icon: Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 3,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: TextFormField(
                        onChanged: (value) {
                          model.setTax(value);
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          focusColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          labelText: 'Tax in %',
                          labelStyle: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  buildButton('1', context),
                  buildButton('2', context),
                  buildButton('3', context),
                ],
              ),
              Row(
                children: [
                  buildButton('4', context),
                  buildButton('5', context),
                  buildButton('6', context),
                ],
              ),
              Row(
                children: [
                  buildButton('7', context),
                  buildButton('8', context),
                  buildButton('9', context),
                ],
              ),
              Row(
                children: [
                  buildButton('.', context),
                  buildButton('0', context),
                  buildButton('-', context),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.black),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultPage(
                        bill: model.bill.isNotEmpty ? model.bill : '0',
                        tax: model.tax.isNotEmpty ? model.tax : '0',
                        friends:
                            model.friendsValue < 1 ? 1 : model.friendsValue,
                        tip: model.tip,
                      ),
                    ),
                  );
                },
                child: Center(
                  child: Text(
                    'Split Bill',
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
