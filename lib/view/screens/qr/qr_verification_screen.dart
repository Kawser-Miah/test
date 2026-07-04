import 'package:flutter/material.dart';
import 'package:test_project/config/theme/app_colors.dart';
import 'package:test_project/config/theme/app_gradient.dart';

import 'widgets/qr_scanner_frame.dart';

enum _QrTab { code, scan }

/// QR verification screen: lets the user show their own QR code, or scan
/// someone else's, to unlock messaging / join a community chat.
class QrVerificationScreen extends StatefulWidget {
  const QrVerificationScreen({super.key});

  @override
  State<QrVerificationScreen> createState() => _QrVerificationScreenState();
}

class _QrVerificationScreenState extends State<QrVerificationScreen> {
  _QrTab _tab = _QrTab.code;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.textPrimary,
            size: 20,
          ),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        title: const Text(
          'QR Verification',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 8),
              _QrTabSelector(
                tab: _tab,
                onChanged: (tab) => setState(() => _tab = tab),
              ),
              const SizedBox(height: 16),
              _InfoBanner(
                text: _tab == _QrTab.code
                    ? 'To join the community chat, simply scan each '
                        "other's QR codes to connect."
                    : 'Share this QR code with your contact both of you '
                        "need to scan each other's codes to unlock "
                        'messaging.',
              ),
              const SizedBox(height: 40),
              _tab == _QrTab.code ? const _ShowQrView() : const _ScanQrView(),
            ],
          ),
        ),
      ),
    );
  }
}

class _QrTabSelector extends StatelessWidget {
  final _QrTab tab;
  final ValueChanged<_QrTab> onChanged;

  const _QrTabSelector({required this.tab, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _TabPill(
            icon: Icons.qr_code_2,
            label: 'QR Code',
            active: tab == _QrTab.code,
            onTap: () => onChanged(_QrTab.code),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _TabPill(
            icon: Icons.qr_code_scanner,
            label: 'Scan',
            active: tab == _QrTab.scan,
            onTap: () => onChanged(_QrTab.scan),
          ),
        ),
      ],
    );
  }
}

class _TabPill extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool active;
  final VoidCallback onTap;

  const _TabPill({
    required this.icon,
    required this.label,
    required this.active,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final Color contentColor = active ? AppColors.white : AppColors.textPrimary;

    return Material(
      color: AppColors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(30),
        child: Container(
          height: 48,
          decoration: BoxDecoration(
            gradient: active ? AppGradients.fab : null,
            color: active ? null : AppColors.white,
            borderRadius: BorderRadius.circular(30),
            border: active ? null : Border.all(color: AppColors.border),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 18, color: contentColor),
              const SizedBox(width: 8),
              Text(
                label,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: contentColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoBanner extends StatelessWidget {
  final String text;

  const _InfoBanner({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.surfaceIconCircle,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.info_outline, size: 18, color: AppColors.primaryBlue),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 13,
                height: 1.4,
                color: AppColors.textSecondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ShowQrView extends StatelessWidget {
  const _ShowQrView();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Show Your QR Code',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.qr_code_2, size: 16, color: AppColors.textSecondary),
            SizedBox(width: 6),
            Text(
              'Let them scan this code',
              style: TextStyle(fontSize: 14, color: AppColors.textSecondary),
            ),
          ],
        ),
        const SizedBox(height: 28),
        Container(
          width: 220,
          height: 220,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.border),
          ),
          child: const Icon(Icons.qr_code_2, size: 180, color: AppColors.textPrimary),
        ),
        const SizedBox(height: 20),
        const Text(
          'This code is unique for this connection',
          style: TextStyle(fontSize: 13, color: AppColors.textSecondary),
        ),
      ],
    );
  }
}

class _ScanQrView extends StatelessWidget {
  const _ScanQrView();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Scan Their QR Code',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Align the QR code in the frame',
          style: TextStyle(fontSize: 14, color: AppColors.textSecondary),
        ),
        const SizedBox(height: 28),
        const SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 13),
            child: QrScannerFrame(),
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'Camera permission required',
          style: TextStyle(fontSize: 13, color: AppColors.iconHint),
        ),
      ],
    );
  }
}
