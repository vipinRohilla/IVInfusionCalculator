import 'dart:math';

double getNumberOfTablets(String data1, String data2) {
  return double.parse(data1) / double.parse(data2);
}

double getChildDose(String weight, String adultDose) {
  return (double.parse(weight) / 150) * double.parse(adultDose);
}

double getDose(String stockStrength, String stockVolume, String requiredDosage,
    String weight) {
  return ((double.parse(stockStrength) * double.parse(stockVolume)) /
      (double.parse(requiredDosage) * double.parse(weight)));
}

double getVolumeInLiquid(
    String stockVolume, String requiredDosage, String stockStrength) {
  return (double.parse(stockVolume) * double.parse(requiredDosage)) /
      double.parse(stockStrength);
}

double getTabletDosage(String requiredDosage, String weight) {
  return double.parse(requiredDosage) / double.parse(weight);
}

double getLiquidDosage(String requiredDosage, String weight) {
  return double.parse(requiredDosage) / double.parse(weight);
}

double getUnitDosage(String requiredDosage, String weight) {
  return double.parse(requiredDosage) / double.parse(weight);
}

double getInfusionByUnit(
    String requiredDosage, String ivBagVolume, String unitInIvBag) {
  return (double.parse(requiredDosage) * double.parse(ivBagVolume)) /
      double.parse(unitInIvBag);
}

double getInfusionByDose(
    String requiredDosage, String ivBagVolume, String unitInIvBag) {
  return (double.parse(requiredDosage) * double.parse(ivBagVolume)) /
      double.parse(unitInIvBag);
}

double getIvVolumeRate(String requiredDosage, String time) {
  return double.parse(requiredDosage) / double.parse(time);
}

double getIvDropRate(String requiredDosage, String time, String dropFactor) {
  return double.parse(requiredDosage) /
      (double.parse(time) * double.parse(dropFactor));
}

double getBMI(String weight, String height) {
  return double.parse(weight) / pow(double.parse(height), 2);
}

double getBSA(String weight, String height) {
  double total = (double.parse(height) * double.parse(weight)) / 3600;
  return sqrt(total);
}
