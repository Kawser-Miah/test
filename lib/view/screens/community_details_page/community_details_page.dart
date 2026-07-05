import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_project/config/theme/app_gradient.dart';

import '../comunity_member/member.dart';

class EventDetailsPage extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final String location;
  final String distance;
  final String time;
  final String aboutEvent;
  final List<String> attendingAvatars;

  const EventDetailsPage({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.location,
    required this.distance,
    required this.time,
    required this.aboutEvent,
    required this.attendingAvatars,
  });

  @override
  State<EventDetailsPage> createState() => _EventDetailsPageState();
}

class _EventDetailsPageState extends State<EventDetailsPage> {
  final TextEditingController _experienceController = TextEditingController();
  final int _maxChars = 300;

  @override
  void dispose() {
    _experienceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [_buildHeaderImage(), _buildOverlappingCard()],
        ),
      ),
    );
  }

  // ---------------- HEADER IMAGE ----------------
  Widget _buildHeaderImage() {
    return SizedBox(
      height: 300,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(widget.imageUrl, fit: BoxFit.cover),
          // Dark gradient overlay for status bar readability
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withValues(alpha: 0.25),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ---------------- MAIN WHITE CARD ----------------
  Widget _buildOverlappingCard() {
    return Transform.translate(
      offset: const Offset(0, -24),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Drag handle
            Center(
              child: Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),

            // Title
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),

            // Location row
            Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  size: 16,
                  color: Colors.grey.shade600,
                ),
                const SizedBox(width: 4),
                Text(
                  widget.distance,
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                ),
              ],
            ),
            const SizedBox(height: 6),

            // Time row
            Row(
              children: [
                Icon(Icons.access_time, size: 16, color: Colors.grey.shade600),
                const SizedBox(width: 4),
                Text(
                  widget.time,
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                ),
              ],
            ),
            const SizedBox(height: 14),

            // Avatars + View All
            Row(
              children: [
                Expanded(child: _buildAvatarStack()),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MembersPage()),
                    );
                  },
                  child: const Text(
                    'View All',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18),

            // Gradient message button + more icon
            Row(
              children: [
                Expanded(child: _buildChatButton()),
                const SizedBox(width: 10),
                _buildMoreButton(),
              ],
            ),
            const SizedBox(height: 22),

            // About Event
            const Text(
              'About Event',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              widget.aboutEvent,
              style: TextStyle(
                fontSize: 13.5,
                height: 1.5,
                color: Colors.grey.shade600,
              ),
            ),
            const SizedBox(height: 22),

            // Experiences
            const Text(
              'Experiences',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),
            _buildExperienceItem(),
            const SizedBox(height: 22),

            // Share your experience
            const Text(
              'Share your experience',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            _buildExperienceInput(),
            const SizedBox(height: 4),
            Text(
              '${_experienceController.text.length}/$_maxChars characters',
              style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
            ),
            const SizedBox(height: 20),

            // Cancel / Save buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _buildCancelButton(),
                const SizedBox(width: 12),
                _buildSaveButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ---------------- AVATAR STACK ----------------
  Widget _buildAvatarStack() {
    final avatarUrls = widget.attendingAvatars;

    return SizedBox(
      height: 32,
      child: Stack(
        children: [
          for (int i = 0; i < avatarUrls.length; i++)
            Positioned(
              left: i * 22.0,
              child: CircleAvatar(
                radius: 16,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 14,
                  backgroundImage: NetworkImage(avatarUrls[i]),
                ),
              ),
            ),
          Positioned(
            left: avatarUrls.length * 22.0,
            child: CircleAvatar(
              radius: 16,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 14,
                backgroundColor: Colors.blue.shade50,
                child: const Text(
                  '+5',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ---------------- GRADIENT CHAT BUTTON ----------------
  Widget _buildChatButton() {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: AppGradients.fab,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {},
          child: Center(
            child: SvgPicture.asset(
              'assets/nav_icon/chat.svg',
              width: 20,
              height: 20,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  // ---------------- MORE (3-dot) BUTTON ----------------
  Widget _buildMoreButton() {
    return Container(
      height: 48,
      width: 48,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {},
          child: const Icon(Icons.more_vert, color: Colors.black54),
        ),
      ),
    );
  }

  // ---------------- EXPERIENCE ITEM ----------------
  Widget _buildExperienceItem() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 22,
          backgroundImage: AssetImage('assets/images/user5.png'),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    'Jenny smith',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Icon(
                    Icons.directions_walk,
                    size: 14,
                    color: Colors.grey.shade400,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '20 Oct',
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade400),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              const Text(
                'Had a wonderful day with you guys 😊',
                style: TextStyle(fontSize: 13.5, color: Colors.black87),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ---------------- EXPERIENCE INPUT ----------------
  Widget _buildExperienceInput() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: TextField(
        controller: _experienceController,
        maxLength: _maxChars,
        maxLines: 4,
        onChanged: (_) => setState(() {}),
        buildCounter:
            (
              context, {
              required currentLength,
              required isFocused,
              maxLength,
            }) => null, // hide default counter, we show custom one
        decoration: const InputDecoration(
          hintText: 'What is this community about?',
          hintStyle: TextStyle(color: Colors.grey),
          contentPadding: EdgeInsets.all(14),
          border: InputBorder.none,
        ),
      ),
    );
  }

  // ---------------- CANCEL BUTTON ----------------
  Widget _buildCancelButton() {
    return SizedBox(
      height: 46,
      width: 110,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey.shade200,
          foregroundColor: Colors.black87,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        child: const Text(
          'Cancel',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  // ---------------- SAVE BUTTON ----------------
  Widget _buildSaveButton() {
    return SizedBox(
      height: 46,
      width: 110,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        child: const Text(
          'Save',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
