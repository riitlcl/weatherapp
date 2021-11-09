import 'package:enum_to_string/enum_to_string.dart';

class WeatherInfo {
  double temperature;
  String location;
  Condition condition;
  Wind wind;

  WeatherInfo(this.temperature, this.wind, this.location, this.condition);
}
class Wind {
  double speed;
  Direction direction;
  Wind(this.speed, this.direction);
}

enum Direction {
N, S, E, W, NNE, NE, ENE,ESE,SE, SSE,SSW,SW,WSW,WNW, NW, NNW, UNKOWN
}

Direction directionFromString (String dir){
 return EnumToString.fromString(Direction.values, dir) ?? Direction.UNKOWN;
}

class Condition {
  String text;
  Condition(this.text);
}
