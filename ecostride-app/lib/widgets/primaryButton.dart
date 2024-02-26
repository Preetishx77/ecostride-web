// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, file_names

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PrimaryButton extends StatefulWidget {
  final String text;
  final bool isValid;
  final double height;
  final AsyncCallback? onPressed;
  final Color backgroundColor;
  final bool animateAfterChanges = true;
  const PrimaryButton({
    super.key,
    required this.isValid,
    required this.text,
    required this.height,
    this.onPressed,
    required this.backgroundColor,
  });

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1200));
    _animationController!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController!.forward(from: 0);
      }
    });

    _animationController!.addListener(() {
      setState(() {
        if (isLoading == true) {
          _animationController!.repeat();
        }
      });
    });
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      enableFeedback: widget.isValid,
      onTap: () async {
        if (widget.isValid && !isLoading) {
          HapticFeedback.mediumImpact();
          setState(() {
            isLoading = true;
            _animationController!.forward();
          });
          try {
            await widget.onPressed!();
          } finally {
            setState(() {
              isLoading = false;
              _animationController!.stop();
              _animationController!.reset();
            });
          }
        }
      },
      child: Container(
        height: 80,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: SweepGradient(
                startAngle: 4,
                colors: [Colors.white, widget.backgroundColor],
                transform: GradientRotation(_animationController!.value * 6))),
        padding: EdgeInsets.all(2),
        child: Container(
          padding: const EdgeInsets.all(4.0),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(12)),
          child: Container(
            padding: EdgeInsets.all(16),
            height: widget.height,
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: widget.isValid
                    ? widget.backgroundColor
                    : widget.backgroundColor.withOpacity(0.4),
                borderRadius: BorderRadius.circular(12)),
            child: Text(widget.text,
                style: TextStyle(
                    fontSize: 16,
                    height: 24 / 16,
                    fontFamily: "Poppins",
                    color: widget.isValid ? Colors.white : Colors.white70,
                    fontWeight: FontWeight.w700)),
          ),
        ),
      ),
    );
  }
}

class SecondaryButton extends StatefulWidget {
  final String text;
  final bool isValid;
  final double height;
  final AsyncCallback? onPressed;
  final Color borderColors;
  final bool animateAfterChanges = true;
  const SecondaryButton({
    super.key,
    required this.isValid,
    required this.text,
    required this.height,
    this.onPressed,
    required this.borderColors,
  });

  @override
  State<SecondaryButton> createState() => _SecondaryButtonState();
}

class _SecondaryButtonState extends State<SecondaryButton>
    with SingleTickerProviderStateMixin {
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      enableFeedback: widget.isValid,
      onTap: () async {
        if (widget.isValid) {
          HapticFeedback.mediumImpact();
          try {
            await widget.onPressed!();
          } finally {}
        }
      },
      child: Container(
        padding: EdgeInsets.all(16),
        height: widget.height,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(width: 0.4, color: widget.borderColors)),
        child: Text(widget.text,
            style: TextStyle(
                fontSize: 16,
                height: 24 / 16,
                fontFamily: "Poppins",
                color: widget.borderColors,
                fontWeight: FontWeight.w700)),
      ),
    );
  }
}
