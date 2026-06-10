import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/colors.dart';

class HeroSection extends StatefulWidget {
  final String name;
  final String tagline;
  final List<String> roles;

  const HeroSection({
    super.key,
    required this.name,
    required this.tagline,
    required this.roles,
  });

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection> {
  int _currentIndex = 0;
  String _currentText = '';
  bool _isDeleting = false;

  @override
  void initState() {
    super.initState();
    _startTypingEffect();
  }

  void _startTypingEffect() {
    Future.delayed(Duration(milliseconds: 500), () {
      _typingLoop();
    });
  }

  void _typingLoop() async {
    while (true) {
      final currentRole = widget.roles[_currentIndex];
      
      if (!_isDeleting) {
        // Typing
        if (_currentText.length < currentRole.length) {
          _currentText = currentRole.substring(0, _currentText.length + 1);
          setState(() {});
          await Future.delayed(Duration(milliseconds: 70));
        } else {
          // Pause at end
          _isDeleting = true;
          await Future.delayed(Duration(milliseconds: 900));
        }
      } else {
        // Deleting
        if (_currentText.length > 0) {
          _currentText = currentRole.substring(0, _currentText.length - 1);
          setState(() {});
          await Future.delayed(Duration(milliseconds: 45));
        } else {
          _isDeleting = false;
          _currentIndex = (_currentIndex + 1) % widget.roles.length;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          // Tagline
          Text(
            widget.tagline,
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: NeonColors.neonYellow,
              letterSpacing: 2,
            ),
          ).animate().fadeIn(duration: 400.ms),
          
          const SizedBox(height: 16),
          
          // Avatar with glowing ring
          Container(
            width: 180,
            height: 180,
            child: Stack(
              children: [
                // Glowing ring
                Container(
                  width: 180,
                  height: 180,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: NeonColors.neonCyan.withOpacity(0.3),
                        blurRadius: 30,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                ).animate(onPlay: (controller) => controller.repeat())
                  .rotate(duration: 3000.ms),
                
                // Inner ring
                Container(
                  width: 160,
                  height: 160,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: NeonColors.neonCyan.withOpacity(0.5),
                      width: 2,
                    ),
                  ),
                ),
                
                // Avatar Image
                ClipOval(
                  child: Image.asset(
                    'assets/images/avatar.png',
                    width: 140,
                    height: 140,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ).animate().fadeIn(duration: 600.ms).scale(begin: Offset(0.8, 0.8)),
          
          const SizedBox(height: 24),
          
          // Name with gradient
          Text(
            widget.name,
            style: GoogleFonts.inter(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              letterSpacing: -1,
              background: Paint()
                .shader(
                  LinearGradient(
                    colors: [
                      NeonColors.neonCyan,
                      NeonColors.neonPink,
                      NeonColors.neonYellow,
                    ],
                  ).createShader(Rect.fromLTWH(0, 0, 400, 60)),
                ),
            ),
            textAlign: TextAlign.center,
          ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.3, end: 0),
          
          const SizedBox(height: 24),
          
          // Animated typing text
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.star,
                color: NeonColors.neonYellow,
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                _currentText + '▍',
                style: GoogleFonts.inter(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: NeonColors.neonCyan,
                ),
              ),
              const SizedBox(width: 8),
              Icon(
                Icons.star,
                color: NeonColors.neonYellow,
                size: 20,
              ),
            ],
          ).animate().fadeIn(duration: 800.ms),
        ],
      ),
    );
  }
}
