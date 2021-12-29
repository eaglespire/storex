import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(30.0),
            decoration: const BoxDecoration(
              color: Colors.purple,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0),
                  bottomRight: Radius.elliptical(10.0, 20.0),
                  topRight: Radius.elliptical(150.0, 45.0)),
            ),
            width: 200.0,
            height: 200.0,
          ),
          const SizedBox(
            height: 20.0,
          ),
          Container(
            color: Colors.red,
            width: 200.0,
            height: 200.0,
          ),
          // CustomPaint(
          //   size: Size(width * 0.4, 200),
          //   painter: RPSCustomPainter(),
          // ),
          const SizedBox(
            height: 100.0,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomPaint(
              size: Size(width * 0.8, 200.0),
              painter: SecondRPSCustomPainter(),
              child: Container(
                width: 400,
                height: 200,
              ),
            ),
          )
        ],
      ),
    );
  }
}

void getHelp() {
  int? a;
  int? b;
  int ans = a! + b!;
  print(a + b);

  List<String> _myStrings = ['one', 'two', 'three'];
  List<String?> _myStrings2 = ['one', null, 'three'];
  List<String>? _myStrings3;
  print(_myStrings3);
}

class SecondRPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;

    Path path0 = Path();
    path0.moveTo(size.width * -0.0012500, size.height * 0.9050000);
    path0.lineTo(size.width * -0.0012500, size.height * 0.1600000);
    path0.quadraticBezierTo(size.width * 0.2153125, size.height * 0.0562500,
        size.width * 0.2912500, size.height * 0.0100000);
    path0.cubicTo(
        size.width * 0.3700000,
        size.height * -0.0662500,
        size.width * 0.3709375,
        size.height * -0.0262500,
        size.width * 0.3737500,
        size.height * 0.1600000);
    path0.cubicTo(
        size.width * 0.4384375,
        size.height * 0.6837500,
        size.width * 0.6296875,
        size.height * 0.4325000,
        size.width * 0.6200000,
        size.height * 0.1500000);
    path0.cubicTo(
        size.width * 0.6368750,
        size.height * 0.0937500,
        size.width * 0.6300000,
        size.height * -0.0625000,
        size.width * 0.6875000,
        size.height * -0.0750000);
    path0.quadraticBezierTo(size.width * 0.7768750, size.height * -0.0137500,
        size.width * 0.9950000, size.height * 0.1700000);
    path0.lineTo(size.width * 0.9962500, size.height * 0.9050000);
    path0.lineTo(size.width * -0.0012500, size.height * 0.9050000);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    Path path0 = Path();
    path0.moveTo(0, size.height * 0.9950000);
    path0.lineTo(0, size.height * 0.2500000);
    path0.quadraticBezierTo(size.width * 0.2165625, size.height * 0.1462500,
        size.width * 0.2925000, size.height * 0.1000000);
    path0.cubicTo(
        size.width * 0.3712500,
        size.height * 0.0237500,
        size.width * 0.3721875,
        size.height * 0.0637500,
        size.width * 0.3750000,
        size.height * 0.2500000);
    path0.cubicTo(
        size.width * 0.4396875,
        size.height * 0.7737500,
        size.width * 0.6309375,
        size.height * 0.5225000,
        size.width * 0.6212500,
        size.height * 0.2400000);
    path0.cubicTo(
        size.width * 0.6381250,
        size.height * 0.1837500,
        size.width * 0.6312500,
        size.height * 0.0275000,
        size.width * 0.6887500,
        size.height * 0.0150000);
    path0.quadraticBezierTo(size.width * 0.7781250, size.height * 0.0762500,
        size.width * 0.9962500, size.height * 0.2600000);
    path0.lineTo(size.width * 0.9975000, size.height * 0.9950000);
    path0.lineTo(0, size.height * 0.9950000);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
