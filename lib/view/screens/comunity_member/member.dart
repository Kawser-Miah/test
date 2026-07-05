import 'package:flutter/material.dart';

class MembersPage extends StatelessWidget {
  const MembersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> members = [
      {'name': 'Jenny smith', 'status': 'Open for small talk'},
      {'name': 'Jenny smith', 'status': 'Open for coffee'},
      {'name': 'Jenny smith', 'status': 'Open for coffee'},
      {'name': 'Jenny smith', 'status': 'Open for coffee'},
      {'name': 'Jenny smith', 'status': 'Open for coffee'},
      {'name': 'Jenny smith', 'status': 'Open for coffee'},
      {'name': 'Jenny smith', 'status': 'Open for coffee'},
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.zero,
                itemCount: members.length,
                separatorBuilder: (context, index) => Divider(
                  height: 1,
                  thickness: 1,
                  color: Colors.grey.shade200,
                  indent: 20,
                  endIndent: 20,
                ),
                itemBuilder: (context, index) {
                  return _buildMemberTile(
                    name: members[index]['name']!,
                    status: members[index]['status']!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ---------------- HEADER ----------------
  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 8, 20, 8),
      child: Row(
        children: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios_new, size: 20),
            color: Colors.black87,
          ),
          const SizedBox(width: 4),
          const Text(
            'Members',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  // ---------------- MEMBER TILE ----------------
  Widget _buildMemberTile({required String name, required String status}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 26,
            backgroundImage:
            AssetImage('assets/images/user1.png'),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 15.5,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  status,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey.shade500,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          _buildHiButton(),
        ],
      ),
    );
  }

  // ---------------- "Hi!!" PILL BUTTON ----------------
  Widget _buildHiButton() {
    return Material(
      color: Colors.grey.shade100,
      borderRadius: BorderRadius.circular(24),
      child: InkWell(
        borderRadius: BorderRadius.circular(24),
        onTap: () {},
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('👋', style: TextStyle(fontSize: 15)),
              SizedBox(width: 6),
              Text(
                'Hi!!',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}