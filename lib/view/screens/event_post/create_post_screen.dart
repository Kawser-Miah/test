
import 'package:flutter/material.dart';
import 'package:test_project/config/theme/app_colors.dart';
import 'package:test_project/config/theme/app_gradient.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_project/view/screens/event_post/widgets/event_card.dart';
import 'package:test_project/view/screens/qr/qr_verification_screen.dart';
import 'package:test_project/view/screens/create/create_event_screen.dart';


class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  final List<bool> _interested = [true, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: _buildAppBar(context),
      body: SafeArea(
        top: false,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
          children: [
            EventCard(
              imageUrl:
              'assets/images/image.jpg',
              title: 'Club House',
              distance: '300km away',
              time: '8PM - 11PM, 21 Nov',
              interestedCount: 10,
              goingCount: 16,
              attending: '5/10 attending',
              isInterested: _interested[0],
              gradient: AppGradients.fab,
              onInterestedTap: () {
                setState(() => _interested[0] = !_interested[0]);
              },
              onDropdownTap: () {},
            ),
            const SizedBox(height: 16),
            EventCard(
              imageUrl:
              'assets/images/image.jpg',
              title: 'Club House',
              distance: '300km away',
              time: '8PM - 11PM, 21 Nov',
              interestedCount: 10,
              goingCount: 16,
              attending: '5/10 attending',
              isInterested: _interested[1],
              gradient: AppGradients.fab,
              onInterestedTap: () {
                setState(() => _interested[1] = !_interested[1]);
              },
              onDropdownTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      elevation: 0,
      centerTitle: false,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new, color: AppColors.black, size: 20),
        onPressed: () => Navigator.maybePop(context),
      ),
      title: const Text(
        'Create Post',
        style: TextStyle(
          color: AppColors.black,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      actions: [
        Material(
          color: AppColors.transparent,
          shape: const CircleBorder(),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const QrVerificationScreen(),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.only(right: 8),
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: AppColors.surfaceChipInactive,
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  'assets/logo/qr.svg',
                  width: 14,
                  height: 14,
                  colorFilter: const ColorFilter.mode(
                    AppColors.textBlackPrimary,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CreateEventScreen(),
              ),
            );
          },
          child: Container(
            margin: const EdgeInsets.only(right: 16),
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              gradient: AppGradients.fab,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.add, color: AppColors.white, size: 22),
          ),
        ),
      ],
    );
  }
}