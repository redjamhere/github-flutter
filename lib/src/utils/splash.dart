import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class Splash extends StatefulWidget {
  Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  _buildCard({
    Config? config,
    Color backgroundColor = Colors.transparent,
    DecorationImage? backgroundImage,
    double height = 152.0,
  }) {
    return Container(
        height: height,
        width: MediaQuery.of(context).size.width,
        child: WaveWidget(
          config: config!,
          backgroundColor: backgroundColor,
          size: Size(double.infinity, double.infinity),
          waveAmplitude: 0,
        )
    );
  }

  MaskFilter? _blur;

  final List<MaskFilter?> _blurs = [
    null,
    MaskFilter.blur(BlurStyle.normal, 10.0),
    MaskFilter.blur(BlurStyle.inner, 10.0),
    MaskFilter.blur(BlurStyle.outer, 10.0),
  ];

  int _blurIndex = 0;

  MaskFilter _nextBlur() {
    if (_blurIndex == _blurs.length - 1) {
      _blurIndex = 0;
    } else {
      _blurIndex = _blurIndex + 1;
    }
    _blur = _blurs[_blurIndex]!;
    return _blurs[_blurIndex]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Positioned(
                top: 0,
                right: 0,
                left: 0,
                child: Center(
                  child: Image.asset("assets/png/splash_arrows.png"),
                )
            ),
            const Center(
                child: Text("Routeam", style: TextStyle(
                    fontSize: 32,
                    color: Color.fromRGBO(44, 62, 80,1.0),
                    fontWeight: FontWeight.bold
                )),
            ),
            Positioned(
              bottom: 0,
              child:
              _buildCard(
                height: MediaQuery.of(context).size.height / 2,
                config: CustomConfig(
                  colors: [
                    Color.fromRGBO(241, 245, 251, 1),
                    Color.fromRGBO(221,244,255, 1),
                    Color.fromRGBO(115,169,234, 1),
                  ],
                  durations: [1, 8000, 5000],
                  heightPercentages: [0.60, 0.65, 0.7],
                  blur: _blur,
                ),
              ),
            )
          ],
        )
    );
  }
}


