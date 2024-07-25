import 'dart:math';
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class Loader extends StatelessWidget {
  final Color color;

  const Loader({super.key, this.color = AppColors.primary});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Transform.scale(
        scale: 0.4,
        child: CircularProgressIndicator(
          color: color,
          strokeWidth: 7,
        ),
      ),
    );
  }
}

class CustomLinearProgress extends StatelessWidget {
  const CustomLinearProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      color: AppColors.primary,
      minHeight: 5,
      backgroundColor: AppColors.primary.withOpacity(0.1),
    );
  }
}

class Shimmer extends StatefulWidget {
  final double width;
  final double height;

  const Shimmer({super.key, required this.width, required this.height});

  @override
  State<Shimmer> createState() => _ShimmerState();
}

class _ShimmerState extends State<Shimmer> with SingleTickerProviderStateMixin {
  AnimationController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
      lowerBound: 0.3,
      upperBound: 1.0,
      animationBehavior: AnimationBehavior.preserve,
    )..repeat(reverse: true, period: const Duration(milliseconds: 500));
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller!,
      builder: (context, child) {
        return Opacity(
          opacity: 0.5 + 0.5 * sin(_controller!.value * pi),
          child: Container(
            width: widget.width,
            height: widget.height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                begin: const Alignment(-1.0, -0.5),
                end: const Alignment(2.0, 0.5),
                stops: const [0.0, 1.0, 2.0],
                colors: [
                  Colors.grey[200]!,
                  Colors.grey[300]!,
                  Colors.grey[600]!,
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
