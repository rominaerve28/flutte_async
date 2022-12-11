import 'package:flutter/material.dart';
import 'package:flutte_async/services/mockapi.dart';
import 'package:flutter/services.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> with TickerProviderStateMixin {
  late AnimationController controller, controller2, controller3;
  late Animation colorAnimation, colorAnimation2, colorAnimation3;
  late Animation sizeAnimation, sizeAnimation2, sizeAnimation3;

  var obtenernum1 = 0, obtenernum2 = 0, obtenernum3 = 0;

  final height = 20;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    controller2 =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    controller3 =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    colorAnimation =
        ColorTween(begin: Colors.white, end: Colors.red).animate(controller);
    colorAnimation2 =
        ColorTween(begin: Colors.white, end: Colors.red).animate(controller2);
    colorAnimation3 =
        ColorTween(begin: Colors.white, end: Colors.red).animate(controller3);

    sizeAnimation = Tween<double>(begin: 20, end: 300).animate(controller);
    sizeAnimation2 = Tween<double>(begin: 20, end: 300).animate(controller2);
    sizeAnimation3 = Tween<double>(begin: 20, end: 300).animate(controller3);

    controller.addListener(() {
      setState(() {});
    });
    controller2.addListener(() {
      setState(() {});
    });
    controller3.addListener(() {
      setState(() {});
    });
  }

  Widget botonVerde() {
    return GestureDetector(
      child: FloatingActionButton(
        backgroundColor: Colors.green,
        foregroundColor: Colors.black,
        onPressed: () {
          sizeAnimation = Tween<double>(begin: 1, end: 500).animate(controller);

          controller.reset();
          colorAnimation = ColorTween(begin: Colors.green, end: Colors.white)
              .animate(controller);

          controller.forward();

          MockApi().getFerrariInteger().then((value) => {
                setState((() {
                  obtenernum1 = value;
                })),
              });
        },
        child: const Icon(Icons.flash_on),
      ),
    );
  }

  Widget botonOrange() {
    return GestureDetector(
      child: FloatingActionButton(
        backgroundColor: Colors.orange,
        foregroundColor: Colors.black,
        onPressed: () {
          sizeAnimation2 =
              Tween<double>(begin: 1, end: 500).animate(controller2);

          controller2.reset();
          colorAnimation2 = ColorTween(begin: Colors.orange, end: Colors.white)
              .animate(controller2);

          controller2.forward();

          MockApi().getFerrariInteger().then((value) => {
                setState((() {
                  obtenernum2 = value;
                }))
              });
        },
        child: const Icon(Icons.airport_shuttle),
      ),
    );
  }

  Widget botonRed() {
    return GestureDetector(
      child: FloatingActionButton(
        backgroundColor: Colors.red,
        foregroundColor: Colors.black,
        onPressed: () {
          sizeAnimation3 =
              Tween<double>(begin: 1, end: 500).animate(controller3);

          controller3.reset();
          colorAnimation3 = ColorTween(begin: Colors.red, end: Colors.white)
              .animate(controller3);

          controller3.forward();
          MockApi().getFerrariInteger().then((value) => {
                setState((() {
                  obtenernum3 = value;
                }))
              });
        },
        child: const Icon(Icons.directions_walk),
      ),
    );
  }

  Widget box() {
    return Center(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 60),
        curve: Curves.fastLinearToSlowEaseIn,
        height: height.toDouble(),
        width: sizeAnimation.value,
        color: colorAnimation.value,
      ),
    );
  }

  Widget boxorange() {
    return Center(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 75),
        curve: Curves.fastLinearToSlowEaseIn,
        height: 20,
        width: sizeAnimation2.value,
        color: colorAnimation2.value,
      ),
    );
  }

  Widget boxred() {
    return Center(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        curve: Curves.fastLinearToSlowEaseIn,
        height: 20,
        width: sizeAnimation3.value,
        color: colorAnimation3.value,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
              child: const Text('Asynchronous calls',
                  textAlign: TextAlign.center))),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(children: <Widget>[
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Color.fromARGB(255, 255, 255, 255),
                    Color.fromARGB(255, 255, 255, 255),
                    Color.fromARGB(255, 255, 255, 255),
                    Color.fromARGB(255, 255, 255, 255),
                  ])),
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(height: 40),
                    botonVerde(),
                    const SizedBox(height: 6),
                    box(),
                    Text(
                      "$obtenernum1",
                      style: const TextStyle(
                        color: Colors.green,
                        fontSize: 50,
                      ),
                    ),
                    const SizedBox(height: 6),
                    botonOrange(),
                    const SizedBox(height: 6),
                    boxorange(),
                    Text(
                      "$obtenernum2",
                      style: const TextStyle(
                        color: Colors.orange,
                        fontSize: 50,
                      ),
                    ),
                    const SizedBox(height: 6),
                    botonRed(),
                    const SizedBox(height: 6),
                    boxred(),
                    Text(
                      "$obtenernum3",
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 50,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
