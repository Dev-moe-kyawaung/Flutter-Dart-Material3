import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/colors.dart';

class SkillItem {
  final String name;
  final int percentage;
  final Color color;

  SkillItem({
    required this.name,
    required this.percentage,
    required this.color,
  });
}

class SkillsSection extends StatelessWidget {
  final List<SkillItem> skills;

  const SkillsSection({
    super.key,
    required this.skills,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Text(
            'Technical Skills',
            style: GoogleFonts.inter(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: NeonColors.textPrimary,
            ),
          ).animate().fadeIn(duration: 400.ms),
          
          const SizedBox(height: 24),
          
          ...skills.map((skill) => _SkillProgress(skill: skill)),
        ],
      ),
    );
  }
}

class _SkillProgress extends StatefulWidget {
  final SkillItem skill;

  const _SkillProgress({required this.skill});

  @override
  State<_SkillProgress> createState() => _SkillProgressState();
}

class _SkillProgressState extends State<_SkillProgress> {
  double _currentPercentage = 0;

  @override
  void initState() {
    super.initState();
    _animateProgress();
  }

  void _animateProgress() {
    Future.delayed(Duration(milliseconds: 100), () {
      setState(() {
        _currentPercentage = widget.skill.percentage / 100;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  widget.skill.name,
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: NeonColors.textPrimary,
                  ),
                ),
              ),
              Text(
                '${widget.skill.percentage}%',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: widget.skill.color,
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 8),
          
          // Progress Bar
          Container(
            height: 8,
            decoration: BoxDecoration(
              color: NeonColors.surfaceDark2,
              borderRadius: BorderRadius.circular(4),
            ),
            child: AnimatedPadding(
              padding: EdgeInsets.only(
                right: 100 - (widget.skill.percentage * 1),
              ),
              duration: Duration(seconds: 1),
              curve: Curves.easeOut,
              child: Container(
                width: widget.skill.percentage.toDouble(),
                decoration: BoxDecoration(
                  color: widget.skill.color,
                  borderRadius: BorderRadius.circular(4),
                  boxShadow: [
                    BoxShadow(
                      color: widget.skill.color.withOpacity(0.5),
                      blurRadius: 8,
                      spreadRadius: 1,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ).animate().fadeIn(duration: 400.ms).slideX(begin: 0.3, end: 0);
  }
}
