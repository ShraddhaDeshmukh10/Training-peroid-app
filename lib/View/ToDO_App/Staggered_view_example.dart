import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Staggered_View_Example extends StatelessWidget {
  const Staggered_View_Example({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: StaggeredGrid.count(
        crossAxisCount: 4,
        axisDirection: AxisDirection.down,
        mainAxisSpacing: 2,
        crossAxisSpacing: 2,
        children: [
          StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 20,
              child: Container(
                color: Colors.green,
              )),
          StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 1,
              child: Container(
                color: Colors.blue,
              )),
          StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 2,
              child: Container(
                color: Colors.yellow,
              )),
          StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 1,
              child: Container(
                color: Colors.red,
              )),
          StaggeredGridTile.count(
              crossAxisCellCount: 3,
              mainAxisCellCount: 1,
              child: Container(
                color: Colors.pink,
              )),
          StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 4,
              child: Container(
                color: const Color.fromARGB(255, 108, 176, 39),
              )),
          StaggeredGridTile.count(
              crossAxisCellCount: 4,
              mainAxisCellCount: 1,
              child: Container(
                color: Color.fromARGB(255, 94, 39, 176),
              )),
        ],
      ),
    ));
  }
}
