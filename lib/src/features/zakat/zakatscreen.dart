import 'package:flutter/material.dart';

class ZakatPage extends StatefulWidget {
  const ZakatPage({Key? key}) : super(key: key);

  @override
  State<ZakatPage> createState() => _ZakatPageState();
}

class _ZakatPageState extends State<ZakatPage> {
  TextEditingController savingsController = TextEditingController();
  TextEditingController debtController = TextEditingController();
  TextEditingController goldController = TextEditingController();
  bool isGoldNisabReached = false;
  double goldValue = 0;
  double zakatAmount = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: Text(
              "Zakat Calculator",
              // style: TextStyle(color: Colors.white),
            ),
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            // backgroundColor: Colors.purple,
            backgroundColor: Theme.of(context).colorScheme.primary),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Zakat Calculator',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  // color: Colors.purple,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              TextField(
                controller: savingsController,
                keyboardType: TextInputType.number,
                style: TextStyle(
                  color: Colors.cyan,
                ),
                decoration: InputDecoration(
                  labelText: 'Total Savings (BDT)',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple),
                  ),
                ),
              ),
              SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  text: 'Example: 100000 BDT',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12.0,
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: debtController,
                keyboardType: TextInputType.number,
                style: TextStyle(
                  color: Colors.cyan,
                ),
                decoration: InputDecoration(
                  labelText: 'Total Loan (BDT)',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple),
                  ),
                ),
              ),
              SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  text: 'Example: 5000 BDT',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12.0,
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: goldController,
                keyboardType: TextInputType.number,
                style: TextStyle(
                  color: Colors.cyan,
                ),
                decoration: InputDecoration(
                  labelText: 'Total Gold (in grams)',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple),
                  ),
                ),
              ),
              SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  text: 'Example: 150g',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12.0,
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: calculateZakat,
                style: ElevatedButton.styleFrom(
                  // primary: Colors.purple,
                  textStyle: TextStyle(fontSize: 16),
                ),
                child: Text('Calculate Zakat'),
              ),
              SizedBox(height: 20),
              Text(
                'Value of gold: ${goldValue.toStringAsFixed(2)} g',
                style: TextStyle(fontSize: 18.0),
              ),
              Text(
                'Amount of Zakat: ${zakatAmount.toStringAsFixed(2)} BDT',
                style: TextStyle(fontSize: 18.0),
              ),
              Text(
                'Nisab: ${isGoldNisabReached ? 'Yes' : 'No'}',
                style: TextStyle(fontSize: 18.0),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void calculateZakat() {
    double savings = double.tryParse(savingsController.text) ?? 0;
    double debt = double.tryParse(debtController.text) ?? 0;
    double totalGold = double.tryParse(goldController.text) ?? 0;

    // সোনার মূল্য হচ্ছে ৪৫০০ টাকা প্রতি গ্রাম (আপনি এটি প্রতিস্থানে সত্যিকারের মানে প্রতিস্থানে প্রতিস্থানে প্রতিস্থানে প্রতিস্থানে স্থাপন করতে পারেন)
    double goldPricePerGram = 4500;

    // সোনার মূল্য হিসেব
    goldValue = totalGold;

    // নিসাব পৌঁছানো হয়েছে কিনা চেক করুন (নিসাব হলো যাকাতের জন্য অবশ্যই একটি ন্যায্য পরিমাণ)
    isGoldNisabReached = goldValue >= 87.48; // নিসাব ২০২২ সালের

    zakatAmount = isGoldNisabReached ? (savings - debt) * 0.025 : 0;

    // ইউআই আপডেট করুন
    setState(() {});
  }
}
