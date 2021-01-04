import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toggle_bar/toggle_bar.dart';
import 'DisplayCard.dart';
import '../data.dart';

class HomePage extends StatefulWidget {
  HomePage({this.indData});
  final indData;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> labels = [
    'India',
    'World',
  ];
  int currentIndex = 0;
  String active;
  String cases;
  String todayCases;
  String recovered;
  String todayRecovered;
  String deaths;
  String todayDeaths;

  void updateUI(var covidData) {
    setState(() {
      active = covidData['active'].toString();
      cases = covidData['cases'].toString();
      todayCases = covidData['todayCases'].toString();
      recovered = covidData['recovered'].toString();
      todayRecovered = covidData['todayRecovered'].toString();
      deaths = covidData['deaths'].toString();
      todayDeaths = covidData['todayDeaths'].toString();
    });
  }

  void updateCard(int currentIndex) async {
    var covidData = await CovidData().getData(currentIndex);
    setState(() {
      active = covidData['active'].toString();
      cases = covidData['cases'].toString();
      todayCases = covidData['todayCases'].toString();
      recovered = covidData['recovered'].toString();
      todayRecovered = covidData['todayRecovered'].toString();
      deaths = covidData['deaths'].toString();
      todayDeaths = covidData['todayDeaths'].toString();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    updateUI(widget.indData);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: Text(
                'Covid-19 Tracker',
                style: TextStyle(
                  fontFamily: 'Spartan MB',
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffC8815A),
                ),
              ),
            ),
            ToggleBar(
              labels: labels,
              backgroundColor: Color(0xFFFBD8C5),
              selectedTabColor: Colors.white,
              selectedTextColor: Colors.black,
              textColor: Color(0xffC8815A),
              onSelectionUpdated: (index) {
                print(index);
                setState(() {
                  currentIndex = index;
                });
                updateCard(currentIndex);
              },
            ),
            DisplayCard(
              title: 'Confirmed',
              color: Color(0xFFFFE7EC),
              textColor: Color(0xFFFA1845),
              today: '▲ $todayCases',
              total: cases,
            ),
            DisplayCard(
              title: 'Active',
              color: Color(0xFFE8F2FF),
              textColor: Color(0xFF157FFB),
              total: active,
              today: '',
            ),
            DisplayCard(
              title: 'Recovered',
              color: Color(0xFFEAF6ED),
              textColor: Color(0xFF30A54A),
              total: recovered,
              today: '▲ $todayRecovered',
            ),
            DisplayCard(
              title: 'Deceased',
              color: Color(0xFFF0F1F2),
              textColor: Color(0xFF6D757D),
              total: deaths,
              today: '▲ $todayDeaths',
            )
          ],
        ),
      ),
    );
  }
}
