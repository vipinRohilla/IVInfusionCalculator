String getSuffixText(String unitSelected){
  String myFromValue = "";
  switch (unitSelected) {
        case "Meter" :
            myFromValue = "m";
          break;
          case "Millimeter" :
            myFromValue = "mm";
          break;
          case "Centimeter" :
            myFromValue = "cm";
          break;
          case "Kilometer" :
            myFromValue = "Km";
          break;
          case "Inch" :
            myFromValue = "in";
          break;
          case "Foot" :
            myFromValue = "ft";
          break;
          case "Yard" :
            myFromValue = "yd";
          break;
          case "Mile" :
            myFromValue = "mi";
          break;



//Area
          case "Meter squared" :
            myFromValue = "m^2";
          break;
          case "Kilometer squared" :
            myFromValue = "Km^2";
          break;
          case "Square inch" :
            myFromValue = "in^2";
          break;
          case "Square foot" :
            myFromValue = "ft^2";
          break;
          case "Square yard" :
            myFromValue = "yd^2";
          break;
          case "Acre" :
            myFromValue = "ac";
          break;
          case "Hectare" :
            myFromValue = "ha";
          break;





//Volume

          case "Cubic meter" :
            myFromValue = "m^3";
          break;
          case "US legal cup" :
            myFromValue = "cup(US)";
          break;
          case "US fluid ounce" :
            myFromValue = "fl oz (US)";
          break;
          case "US tablespoon" :
            myFromValue = "tablespoon(US)";
          break;
          case "US teaspoon" :
            myFromValue = "teaspoon(US)";
          break;
          case "Imperial cup" :
            myFromValue = "cup(Im)";
          break;
          case "Imperial fluid ounce" :
            myFromValue = "fl oz (Im)";
          break;
          case "Imperial tablespoon" :
            myFromValue = "tablespoon(Im)";
          break;
          case "Imperial teaspoon" :
            myFromValue = "teaspoon(Im)";
          break;



//mass

          case "Kilogram" :
            myFromValue = "Kg";
          break;
          case "Gram" :
            myFromValue = "g";
          break;
          case "Ounce" :
            myFromValue = "oz";
          break;
          case "Pound" :
            myFromValue = "lbs";
          break;
          case "Stone" :
            myFromValue = "stone(US)";
          break;
          case "US ton" :
            myFromValue = "ton(US)";
          break;
          case "Metric ton" :
            myFromValue = "t";
          break;


 //time


          case "Second" :
            myFromValue = "sec";
          break;
          case "Millisecond" :
            myFromValue = "ms";
          break;
          case "Minute" :
            myFromValue = "min";
          break;
          case "Hour" :
            myFromValue = "hr";
          break;
          case "Day" :
            myFromValue = "day";
          break;
          case "Week" :
            myFromValue = "week";
          break;
          case "Fortnight" :
            myFromValue = "fortnight";
          break;   



//Digital storage

          case "Megabyte" :
            myFromValue = "MB";
          break;
          case "Megabit" :
            myFromValue = "Mb";
          break;
          case "Mebibyte" :
            myFromValue = "MiB";
          break;
          case "Byte" :
            myFromValue = "B";
          break;
          case "Kilobyte" :
            myFromValue = "KB";
          break;
          case "Gigabyte" :
            myFromValue = "GB";
          break;
          case "Terabyte" :
            myFromValue = "TB";
          break;
          case "Petabyte" :
            myFromValue = "PB";
          break;     
          
//Energy

          case "Joule" :
            myFromValue = "J";
          break;
          case "Kilojoule" :
            myFromValue = "KJ";
          break;
          case "Gram calorie" :
            myFromValue = "g cal";
          break;
          case "Kilocalorie (Calorie)" :
            myFromValue = "K cal";
          break;
          case "Watt hour" :
            myFromValue = "Wh";
          break;
          case "British thermal unit" :
            myFromValue = "therm(British)";
          break;
          case "US therm" :
            myFromValue = "therm(US)";
          break;





        
        default:
      }
  return myFromValue;
}