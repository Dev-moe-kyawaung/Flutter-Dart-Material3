import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/colors.dart';

class StatsSection extends StatelessWidget {
  final String years;
  final String apps;
  final String repos;
  final String satisfaction;

  const StatsSection({
    super.key,
    required this.years,
    required this.apps,
    required this.repos,
    required this.satisfaction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _StatItem(value: years, label: 'Years Experience'),
          _StatItem(value: apps, label: 'Apps Built'),
          _StatItem(value: repos, label: 'Repositories'),
          _StatItem(value: satisfaction, label: 'Satisfaction'),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String value;
  final String label;

  const _StatItem({
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: NeonColors.surfaceDark.withOpacity(0.7),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: NeonColors.borderLight,
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: GoogleFonts.inter(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: NeonColors.neonCyan,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 12,
              color: NeonColors.textMuted,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
