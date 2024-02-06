import 'package:flutter/material.dart';

class FadeAnimation extends StatefulWidget {
  Duration time;
  Widget wid;
  FadeAnimation({Key? key, required this.time, required this.wid})
      : super(key: key);

  @override
  State<FadeAnimation> createState() => _FadeAnimationState();
}

class _FadeAnimationState extends State<FadeAnimation>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: widget.time,
  );
  late final Animation<double> _linearAnimation =
  Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.forward();
  }

  @override
  void dispose() {
    _controller
        .dispose(); // Dispose of the animation controller to avoid memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _linearAnimation,
      child: widget.wid,
    );
  }
}