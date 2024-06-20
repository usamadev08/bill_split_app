import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultPage extends StatefulWidget {
  final String bill;
  final String tax;
  final double friends;
  final double tip;

  const ResultPage({
    Key? key,
    required this.bill,
    required this.tax,
    required this.friends,
    required this.tip,
  }) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  String dividedAmount = '';

  @override
  void initState() {
    super.initState();
    divideAmount();
  }

  void divideAmount() {
    try {
      double billAmount = double.parse(widget.bill);
      double taxPercent = double.parse(widget.tax);
      double taxAmount = billAmount * (taxPercent / 100);
      double finalBill = (billAmount + taxAmount + widget.tip) / widget.friends;

      setState(() {
        dividedAmount = finalBill.toStringAsFixed(2);
      });
    } catch (e) {
      setState(() {
        dividedAmount = "Error in calculation";
      });
    }
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
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.all(20),
              child: Text(
                "Result",
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 30,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Equally Divided",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 25,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Text(
                          "\$$dividedAmount",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 30,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    child: Padding(
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
                              Text(widget.friends.toInt().toString(),
                                  style: infoStyle),
                              Text("${widget.tax}%", style: infoStyle),
                              Text('\$${widget.tip.round().toString()}',
                                  style: infoStyle),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Everybody should pay \$$dividedAmount',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.height / 2,
              child: TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.orange),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Center(
                  child: Text(
                    'Calculate again ?',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
