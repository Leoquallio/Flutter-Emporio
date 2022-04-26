import 'package:flutter/material.dart';
import 'package:flutter_emporio/src/home/components/custom_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool openDrawer = false;
  int indexWidget = 0;
  List<Widget> screens = [
    Container(
        color: Colors.red, height: double.infinity, width: double.infinity),
    Container(
        color: Colors.black, height: double.infinity, width: double.infinity),
    Container(
        color: Colors.blue, height: double.infinity, width: double.infinity),
    Container(
        color: Colors.purple, height: double.infinity, width: double.infinity),
    Container(
        color: Colors.yellow, height: double.infinity, width: double.infinity),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          screens[indexWidget],
          Visibility(
            visible: !openDrawer,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  setState(() {
                    openDrawer = true;
                  });
                },
              ),
            ),
          ),
          Visibility(
            visible: openDrawer,
            child: GestureDetector(
              onHorizontalDragUpdate: (details) {
                if (details.primaryDelta! < 0) {
                  setState(() {
                    openDrawer = false;
                  });
                }
              },
              child: CustomDrawer((int indexSelectedMenu) {
                setState(
                  () {
                    if (size.width <= 1000) {
                      openDrawer = false;
                    }
                    indexWidget = indexSelectedMenu;
                  },
                );
              }, indexWidget),
            ),
          ),
        ],
      ),
    );
  }
}
