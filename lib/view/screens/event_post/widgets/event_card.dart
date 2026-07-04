import 'package:flutter/material.dart';
import 'package:test_project/config/theme/app_colors.dart';

import 'info_row.dart';

class EventCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String distance;
  final String time;
  final int interestedCount;
  final int goingCount;
  final String attending;
  final bool isInterested;
  final Gradient gradient;
  final VoidCallback onInterestedTap;
  final VoidCallback onDropdownTap;

  const EventCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.distance,
    required this.time,
    required this.interestedCount,
    required this.goingCount,
    required this.attending,
    required this.isInterested,
    required this.gradient,
    required this.onInterestedTap,
    required this.onDropdownTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: AspectRatio(
                aspectRatio: 16 / 10.2,
                child: Image.asset(
                  imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: AppColors.textPrimary,
                    );
                  },
                )
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.black,
                  ),
                ),
                const SizedBox(height: 8),
                InfoRow(icon: Icons.location_on_outlined, text: distance),
                const SizedBox(height: 6),
                InfoRow(icon: Icons.calendar_today_outlined, text: time),
                const SizedBox(height: 6),
                InfoRow(
                  icon: Icons.people_alt_outlined,
                  text: '$interestedCount Interested  •  $goingCount Going',
                ),
                const SizedBox(height: 6),
                InfoRow(icon: Icons.groups_outlined, text: attending),
                const SizedBox(height: 14),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: onInterestedTap,
                        child: Container(
                          height: 48,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            gradient: isInterested ? gradient : null,
                            color: isInterested
                                ? null
                                : AppColors.surfaceChipInactive,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            'Interested',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: isInterested ? AppColors.white : AppColors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: onDropdownTap,
                      child: Container(
                        width: 48,
                        height: 48,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: AppColors.surfaceChipInactive,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Icons.keyboard_arrow_down,
                          color: AppColors.textBlackPrimary,
                          size: 22,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}