import 'package:flutter/material.dart';
import 'package:test_project/config/theme/app_colors.dart';

import '../../community_details_page/community_details_page.dart';
import '../../event_post/widgets/info_row.dart';
import 'attending_avatars.dart';

class CommunityCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final String location;
  final String distance;
  final String time;
  final int interestedCount;
  final String aboutEvent;
  final int goingCount;
  final String attending;
  final bool isInterested;
  final Gradient gradient;
  final VoidCallback onInterestedTap;
  final VoidCallback onDropdownTap;
  final List<String> attendingAvatars;

  const CommunityCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.location,
    required this.distance,
    required this.aboutEvent,
    required this.time,
    required this.interestedCount,
    required this.goingCount,
    required this.attending,
    required this.isInterested,
    required this.gradient,
    required this.onInterestedTap,
    required this.onDropdownTap,
    required this.attendingAvatars,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EventDetailsPage(imageUrl: imageUrl, time: time, distance: distance, location: location, subtitle: subtitle, aboutEvent: aboutEvent, attendingAvatars: attendingAvatars, title: title)),
        );
      },
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
                    return Container(color: AppColors.textPrimary);
                  },
                ),
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
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textSecondary,
                  ),
                ),
                InfoRow(
                  icon: Icons.location_on_outlined,
                  text: '$location  •  $distance',
                ),

                const SizedBox(height: 12),

                InfoRow(icon: Icons.calendar_today_outlined, text: time),

                const SizedBox(height: 12),

                InfoRow(icon: Icons.people_outline, text: attending),
                const SizedBox(height: 14),
                Row(
                  children: [
                    AttendingAvatars(
                      images: attendingAvatars,
                      extraCount: 5,
                    ),
                  ],
                ),

                const SizedBox(height: 16),
                GestureDetector(
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
                      'Request',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: isInterested ? AppColors.white : AppColors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
