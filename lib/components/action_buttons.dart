import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/colors.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons();

  Future<void> _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () => _launchURL('https://github.com/Dev-moe-kyawaung'),
              style: ElevatedButton.styleFrom(
                backgroundColor: WidgetStateColor.resolveWith(
                  (state) => NeonColors.neonCyan,
                ),
                foregroundColor: WidgetStateColor.resolveWith(
                  (state) => NeonColors.backgroundDark,
                ),
                shape: WidgetStateColor.resolveWith(
                  (state) => RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.code, size: 20),
                  SizedBox(width: 8),
                  Text('View GitHub'),
                ],
              ),
            ),
          ),
          
          const SizedBox(width: 12),
          
          Expanded(
            child: OutlinedButton(
              onPressed: () => _launchURL('mailto:moekyawaung@programmer.net'),
              style: OutlinedButton.styleFrom(
                foregroundColor: WidgetStateColor.resolveWith(
                  (state) => NeonColors.textPrimary,
                ),
                shape: WidgetStateColor.resolveWith(
                  (state) => RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                    side: BorderSide(color: NeonColors.borderLight),
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.email, size: 20),
                  SizedBox(width: 8),
                  Text('Contact Me'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
