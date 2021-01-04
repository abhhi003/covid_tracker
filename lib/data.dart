import 'networking.dart';

List<String> api = [
  'https://disease.sh/v3/covid-19/countries/India?yesterday=true&twoDaysAgo=false&strict=true&allowNull=false',
  'https://disease.sh/v3/covid-19/all?yesterday=true&twoDaysAgo=false&allowNull=false',
];

class CovidData {
  Future getData(int index) async {
    var url = api[index];
    NetworkHelper networkHelper = NetworkHelper(url);
    var covidData = await networkHelper.getData();
    return covidData;
  }
}
