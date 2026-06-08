import 'package:flutter/material.dart';

class TopSlideandFade extends StatelessWidget {
  final Widget child;
  const TopSlideandFade({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    // We calculate the total time including the delay

    return TweenAnimationBuilder<double>(
      tween: Tween(begin: -30, end: 0),
      duration: Duration(seconds: 2),
      curve: Curves.easeInOut,
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(0, value), // Slide horizontally
          child: child,
        );
      },
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: 0, end: 1),
        duration: Duration(seconds: 3),
        curve: Curves.easeInOut,
        builder: (context, value, child) {
          return Opacity(
            opacity: value, // Slide horizontally
            child: child,
          );
        },
        child: child,
      ),
    );
  }
}

class CascadingTopSlideandFade extends StatefulWidget {
  final Widget child;
  final Duration delay; // Added this parameter
  const CascadingTopSlideandFade({
    required this.child,
    required this.delay,
    super.key,
  });

  @override
  State<CascadingTopSlideandFade> createState() =>
      _CascadingTopSlideandFadeState();
}

class _CascadingTopSlideandFadeState extends State<CascadingTopSlideandFade> {
  bool _startAnimation = false;
  @override
  void initState() {
    super.initState();
    Future.delayed(widget.delay, () {
      // Wait for the delay duration
      if (mounted) {
        // Safety check: is widget still on screen?
        setState(() {
          _startAnimation = true; // TRIGGER: Start the animation!
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // We calculate the total time including the delay

    return TweenAnimationBuilder<double>(
      tween: Tween(begin: -30, end: _startAnimation ? 0 : -30),
      duration: Duration(seconds: 2),
      curve: Curves.easeInOut,
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(0, value), // Slide horizontally
          child: child,
        );
      },
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: 0, end: 1),
        duration: Duration(seconds: 3),
        curve: Curves.easeInOut,
        builder: (context, value, child) {
          return Opacity(
            opacity: value, // Slide horizontally
            child: child,
          );
        },
        child: widget.child,
      ),
    );
  }
}

class LeftSlideandFade extends StatelessWidget {
  final Widget child;
  const LeftSlideandFade({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    // We calculate the total time including the delay

    return TweenAnimationBuilder<double>(
      tween: Tween(begin: -30, end: 0),
      duration: Duration(seconds: 2),
      curve: Curves.easeInOut,
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(value, 0), // Slide horizontally
          child: child,
        );
      },
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: 0, end: 1),
        duration: Duration(seconds: 3),
        curve: Curves.easeInOut,
        builder: (context, value, child) {
          return Opacity(
            opacity: value, // Slide horizontally
            child: child,
          );
        },
        child: child,
      ),
    );
  }
}

class CascadingLeftSlideandFade extends StatefulWidget {
  final Widget child;
  final Duration delay; // Added this parameter
  const CascadingLeftSlideandFade({
    required this.child,
    required this.delay,
    super.key,
  });

  @override
  State<CascadingLeftSlideandFade> createState() =>
      _CascadingLeftSlideandFadeState();
}

class _CascadingLeftSlideandFadeState extends State<CascadingLeftSlideandFade> {
  bool _startAnimation = false;
  @override
  void initState() {
    super.initState();
    Future.delayed(widget.delay, () {
      // Wait for the delay duration
      if (mounted) {
        // Safety check: is widget still on screen?
        setState(() {
          _startAnimation = true; // TRIGGER: Start the animation!
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // We calculate the total time including the delay

    return TweenAnimationBuilder<double>(
      tween: Tween(begin: -30, end: _startAnimation ? 0 : -30),
      duration: Duration(seconds: 2),
      curve: Curves.easeInOut,
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(value, 0), // Slide horizontally
          child: child,
        );
      },
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: 0, end: 1),
        duration: Duration(seconds: 3),
        curve: Curves.easeInOut,
        builder: (context, value, child) {
          return Opacity(
            opacity: value, // Slide horizontally
            child: child,
          );
        },
        child: widget.child,
      ),
    );
  }
}

class LongerCascadingLeftSlideandFade extends StatefulWidget {
  final Widget child;
  final Duration delay; // Added this parameter
  const LongerCascadingLeftSlideandFade({
    required this.child,
    required this.delay,
    super.key,
  });

  @override
  State<LongerCascadingLeftSlideandFade> createState() =>
      _LongerCascadingLeftSlideandFadeState();
}

class _LongerCascadingLeftSlideandFadeState
    extends State<LongerCascadingLeftSlideandFade> {
  bool _startAnimation = false;
  @override
  void initState() {
    super.initState();
    Future.delayed(widget.delay, () {
      // Wait for the delay duration
      if (mounted) {
        // Safety check: is widget still on screen?
        setState(() {
          _startAnimation = true; // TRIGGER: Start the animation!
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // We calculate the total time including the delay

    return TweenAnimationBuilder<double>(
      tween: Tween(begin: -60, end: _startAnimation ? 0 : -60),
      duration: Duration(seconds: 3),
      curve: Curves.easeInOut,
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(value, 0), // Slide horizontally
          child: child,
        );
      },
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: 0, end: 1),
        duration: Duration(seconds: 4),
        curve: Curves.easeInOut,
        builder: (context, value, child) {
          return Opacity(
            opacity: value, // Slide horizontally
            child: child,
          );
        },
        child: widget.child,
      ),
    );
  }
}

class StudentListCascadingLeftSlideandFade extends StatefulWidget {
  final Widget child;
  final Duration delay; // Added this parameter
  const StudentListCascadingLeftSlideandFade({
    required this.child,
    required this.delay,
    super.key,
  });

  @override
  State<StudentListCascadingLeftSlideandFade> createState() =>
      _StudentListCascadingLeftSlideandFadeState();
}

class _StudentListCascadingLeftSlideandFadeState
    extends State<StudentListCascadingLeftSlideandFade> {
  bool _startAnimation = false;
  @override
  void initState() {
    super.initState();
    Future.delayed(widget.delay, () {
      // Wait for the delay duration
      if (mounted) {
        // Safety check: is widget still on screen?
        setState(() {
          _startAnimation = true; // TRIGGER: Start the animation!
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // We calculate the total time including the delay

    return TweenAnimationBuilder<double>(
      tween: Tween(begin: -30, end: _startAnimation ? 0 : -30),
      duration: Duration(seconds: 2),
      curve: Curves.easeInOut,
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(value, 0), // Slide horizontally
          child: child,
        );
      },
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: 0, end: 1),
        duration: Duration(seconds: 3),
        curve: Curves.easeInOut,
        builder: (context, value, child) {
          return Opacity(
            opacity: value, // Slide horizontally
            child: child,
          );
        },
        child: widget.child,
      ),
    );
  }
}

class RightSlideandFade extends StatelessWidget {
  final Widget child;
  const RightSlideandFade({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    // We calculate the total time including the delay

    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 30, end: 0),
      duration: Duration(seconds: 2),
      curve: Curves.easeInOut,
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(value, 0), // Slide horizontally
          child: child,
        );
      },
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: 0, end: 1),
        duration: Duration(seconds: 3),
        curve: Curves.easeInOut,
        builder: (context, value, child) {
          return Opacity(
            opacity: value, // Slide horizontally
            child: child,
          );
        },
        child: child,
      ),
    );
  }
}
