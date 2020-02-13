import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class LoadingAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width * .25,
      child: FlareActor(
        "animations/ElianaLoading.flr",
        animation: "Loading",
      ),
    );
  }
}
