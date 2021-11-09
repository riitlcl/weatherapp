import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/controllers/weather_retriever.dart';
import 'package:weather_app/integrations/weather_api.dart';
import 'package:weather_app/models/weather.dart';

class WeatherInfoWidget extends StatelessWidget {
  final Future<WeatherInfo> weatherInfo;

  const WeatherInfoWidget(this.weatherInfo,{Key? key,}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(child: Padding(padding: const EdgeInsets.only(top: 58),
        child: FutureBuilder<WeatherInfo>(
          future: weatherInfo,
          builder: (BuildContext context, AsyncSnapshot<WeatherInfo> snapshot){
    if(snapshot.connectionState == ConnectionState.waiting){
    return Text("Loading...");
    }
    else if(snapshot.connectionState == ConnectionState.done && snapshot.hasData)
    {
    return Column(
    children: [
    Text(snapshot.data?.location ?? "",style: Theme.of(context).textTheme.bodyText2),
    Text(snapshot.data?.temperature.toString() ?? "",style: Theme.of(context).textTheme.headline1),
    Text(snapshot.data?.condition.text ?? "",style: Theme.of(context).textTheme.headline6)
    ],
    );
    }
    return Text("Error getting weather data");
    }
    ),
    ),
    )
    ],
    );
  }
}
