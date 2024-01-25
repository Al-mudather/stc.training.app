import 'package:flutter/material.dart';

class InstructorAvatarUtil extends StatelessWidget {
  const InstructorAvatarUtil({
    super.key,
    this.size = 40,
    required this.imagePath,
  });
  final double size;
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 1,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          Container(
            color: const Color(0xFFFCC74C).withOpacity(0.5),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
