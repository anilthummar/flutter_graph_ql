
const String fetchVehicleColor = r'''
query{
  fetchVehicleColors {
    data {
      ColorsData {
        color_name
      }
    }
  }
}
''';
