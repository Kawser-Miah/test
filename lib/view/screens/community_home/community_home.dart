import 'package:flutter/material.dart';
import 'package:test_project/config/theme/app_colors.dart';
import 'package:test_project/config/theme/app_gradient.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_project/view/screens/community_home/widget/category_filter_card.dart';
import 'package:test_project/view/screens/community_home/widget/community_card.dart';

import '../create/create_event/create_event_screen.dart';
import '../qr/qr_verification_screen.dart';

class CommunityPostScreen extends StatefulWidget {
  const CommunityPostScreen({super.key});

  @override
  State<CommunityPostScreen> createState() => _CommunityPostScreenState();
}

class _CommunityPostScreenState extends State<CommunityPostScreen> {
  final List<bool> _interested = [true, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: _buildAppBar(context),
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
              child: FilterExample(),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  CommunityCard(
                    imageUrl: 'assets/images/image2.jpg',
                    title: 'Coffee Meetup at CentralPark',
                    subtitle: 'Join us for a great coffee and conversation!',
                    location: 'CentralPark',
                    distance: '300km away',
                    aboutEvent:
                        'Lorem ipsum dolor sit amet consectetur. Mattis neque elementum laoreet faucibus morbi venenatis nam nisi. Morbi sit dolor porttitor dictum laoreet nunc dictum. Aliquet erat sit pellentesque proin parturient aliquet.',
                    time: '8PM - 11PM, 21 Nov',
                    interestedCount: 10,
                    goingCount: 16,
                    attending: '5/10 attending',
                    isInterested: _interested[0],
                    gradient: AppGradients.fab,
                    attendingAvatars: [
                      'assets/images/user1.png',
                      'assets/images/user2.png',
                      'assets/images/user3.png',
                      'assets/images/user4.png',
                      'assets/images/user5.png',
                    ],
                    onInterestedTap: () {
                      setState(() => _interested[0] = !_interested[0]);
                    },
                    onDropdownTap: () {},
                  ),
                  const SizedBox(height: 16),
                  CommunityCard(
                    imageUrl: 'assets/images/image2.jpg',
                    title: 'Club House',
                    subtitle: 'Join us for an amazing evening!',
                    location: 'Downtown',
                    aboutEvent:
                        'Lorem ipsum dolor sit amet consectetur. Mattis neque elementum laoreet faucibus morbi venenatis nam nisi. Morbi sit dolor porttitor dictum laoreet nunc dictum. Aliquet erat sit pellentesque proin parturient aliquet.',
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
                    attendingAvatars: [
                      'assets/images/user1.png',
                      'assets/images/user2.png',
                      'assets/images/user3.png',
                      'assets/images/user4.png',
                      'assets/images/user5.png',
                    ],
                  ),
                ],
              ),
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
        icon: const Icon(
          Icons.arrow_back_ios_new,
          color: AppColors.black,
          size: 20,
        ),
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
        GestureDetector(
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

class FilterExample extends StatefulWidget {
  const FilterExample({super.key});

  @override
  State<FilterExample> createState() => _FilterExampleState();
}

class _FilterExampleState extends State<FilterExample> {
  final List<String> items = [
    "All",
    "Music",
    "Wellness",
    "Sports",
    'Gaming',
    'Movies',
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: double.infinity,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        physics: BouncingScrollPhysics(),
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          return CategoryFilterCard(
            title: items[index],
            isSelected: selectedIndex == index,
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
          );
        },
      ),
    );
  }
}
