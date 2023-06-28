import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:graph/Graph/home_screen.dart';

void main() {
  runApp(ProviderScope(
    child: MyApp(),
  ));
}

// const actions = [
//   SlideAction(
//     color: Color(0xFFFE4A49),
//     icon: Icons.delete,
//     label: 'Delete',
//   ),
//   SlideAction(
//     color: Color(0xFF21B7CA),
//     icon: Icons.share,
//     label: 'Share',
//   ),
// ];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Slidable',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({
//     Key? key,
//   }) : super(key: key);

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage>
//     with SingleTickerProviderStateMixin {
//   AnimationController? controller;

//   @override
//   void initState() {
//     super.initState();
//     controller = AnimationController(
//       vsync: this,
//       // lowerBound: -0.0,
//       upperBound: 0.5,
//       duration: const Duration(milliseconds: 1000),
//     );
//     controller!.forward().then((value) {
//       controller!.reverse();
//     });
//     // Duration(milliseconds: 2000, );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Flutter Slidable'),
//       ),
//       body: SlidablePlayer(
//         animation: controller,
//         child: ListView(
//           children: const [
//             SizedBox(height: 20),
//             MySlidable(motion: BehindMotion()),
//             // MySlidable(motion: StretchMotion()),
//             // MySlidable(motion: ScrollMotion()),
//             // MySlidable(motion: DrawerMotion()),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           if (controller!.isCompleted) {
//             controller!.reverse();
//           } else if (controller!.isDismissed) {
//             controller!.forward();
//           }
//         },
//         child: const Icon(Icons.play_arrow),
//       ),
//     );
//   }
// }

// class SlidablePlayer extends StatefulWidget {
//   const SlidablePlayer({
//     Key? key,
//     required this.animation,
//     required this.child,
//   }) : super(key: key);

//   final Animation<double>? animation;
//   final Widget child;

//   @override
//   _SlidablePlayerState createState() => _SlidablePlayerState();

//   static _SlidablePlayerState? of(BuildContext context) {
//     // return context.findRootAncestorStateOfType<_SlidablePlayerState>();
//     return context.findAncestorStateOfType<_SlidablePlayerState>();
//   }
// }

// class _SlidablePlayerState extends State<SlidablePlayer> {
//   final Set<SlidableController?> controllers = <SlidableController?>{};

//   @override
//   void initState() {
//     super.initState();
//     widget.animation!.addListener(handleAnimationChanged);
//   }

//   @override
//   void dispose() {
//     widget.animation!.removeListener(handleAnimationChanged);
//     super.dispose();
//   }

//   void handleAnimationChanged() {
//     final value = -widget.animation!.value;
//     print(value);
//     controllers.forEach((controller) {
//       controller!.ratio = value;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return widget.child;
//   }
// }

// class SlidableControllerSender extends StatefulWidget {
//   const SlidableControllerSender({
//     Key? key,
//     this.child,
//   }) : super(key: key);

//   final Widget? child;

//   @override
//   _SlidableControllerSenderState createState() =>
//       _SlidableControllerSenderState();
// }

// class _SlidableControllerSenderState extends State<SlidableControllerSender> {
//   SlidableController? controller;
//   _SlidablePlayerState? playerState;

//   @override
//   void initState() {
//     super.initState();
//     controller = Slidable.of(context);
//     playerState = SlidablePlayer.of(context);
//     playerState!.controllers.add(controller);
//   }

//   @override
//   void dispose() {
//     playerState!.controllers.remove(controller);
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return widget.child!;
//   }
// }

// class MySlidable extends StatelessWidget {
//   const MySlidable({
//     Key? key,
//     required this.motion,
//   }) : super(key: key);

//   final Widget motion;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8),
//       child: Slidable(
//         direction: Axis.horizontal,
//         endActionPane: ActionPane(
//           motion: motion,
//           children: actions,
//         ),
//         child: SlidableControllerSender(
//           child: Tile(text: motion.runtimeType.toString()),
//         ),
//       ),
//     );
//   }
// }

// class SlideAction extends StatelessWidget {
//   const SlideAction({
//     Key? key,
//     required this.color,
//     required this.icon,
//     required this.label,
//     this.flex = 1,
//   }) : super(key: key);

//   final Color color;
//   final IconData icon;
//   final int flex;
//   final String label;

//   @override
//   Widget build(BuildContext context) {
//     return SlidableAction(
//       flex: flex,
//       backgroundColor: color,
//       foregroundColor: Colors.white,
//       onPressed: (_) {},
//       icon: icon,
//       label: label,
//     );
//   }
// }

// class Tile extends StatelessWidget {
//   const Tile({
//     Key? key,
//     this.color = const Color(0xFFF4F4F8),
//     required this.text,
//   }) : super(key: key);

//   final Color color;
//   final String text;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: color,
//       height: 100,
//       child: Center(child: Text(text)),
//     );
//   }
// }
