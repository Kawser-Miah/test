
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_project/view/screens/create_event_post/widget/event_card.dart';


class CreatePostPage extends StatefulWidget {
  const CreatePostPage({super.key});

  @override
  State<CreatePostPage> createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  final List<bool> _interested = [true, false];

  static const _gradient = LinearGradient(
    begin: Alignment(0.75, -1.0),
    end: Alignment(-0.75, 1.0),
    colors: [
      Color(0xFF57C2FF),
      Color(0xFF8663F6),
      Color(0xFFC470F5),
    ],
    stops: [
      0.1164,
      0.4874,
      0.8704,
    ],

  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
              gradient: _gradient,
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
              gradient: _gradient,
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
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: false,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 20),
        onPressed: () => Navigator.maybePop(context),
      ),
      title: const Text(
        'Create Post',
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 8),
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: const Color(0xFFF2F2F2),
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset(
            'assets/logo/qr.svg',
            width: 18,
            height: 18,
            colorFilter: const ColorFilter.mode(
              Colors.black87,
              BlendMode.srcIn,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(right: 16),
          width: 40,
          height: 40,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF4F8EF7), Color(0xFF8E54E9)],
            ),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.add, color: Colors.white, size: 22),
        ),
      ],
    );
  }
}