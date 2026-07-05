import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_project/config/theme/app_colors.dart';
import 'package:test_project/config/theme/app_gradient.dart';
import 'package:test_project/view/screens/create/create_event/widgets/custom_date_picker.dart';
import 'package:test_project/view/screens/create/create_event/widgets/event_form_field.dart';
import 'package:test_project/view/screens/create/create_event/widgets/time_picker_dialog.dart';
import 'package:test_project/view/screens/create/create_event/widgets/upload_cover_image_box.dart';

class CreateEventScreen extends StatefulWidget {
  const CreateEventScreen({super.key});

  @override
  State<CreateEventScreen> createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  final _titleController = TextEditingController();
  final _locationController = TextEditingController();
  final _dateController = TextEditingController();
  final _timeController = TextEditingController();
  final _maxAttendeesController = TextEditingController();
  final _rulesController = TextEditingController();

  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  @override
  void dispose() {
    _titleController.dispose();
    _locationController.dispose();
    _dateController.dispose();
    _timeController.dispose();
    _maxAttendeesController.dispose();
    _rulesController.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final picked = await showCustomDatePicker(
      context,
      initialDate: DateTime.now(),
    );

    if (picked == null) return;

    setState(() {
      _selectedDate = picked;
      _dateController.text = DateFormat('dd MMM yyyy').format(picked);
    });
  }

  Future<void> _pickTime() async {
    FocusScope.of(context).unfocus();

    final picked = await showDialog<TimeOfDay>(
      context: context,
      builder: (context) =>
          TimePickerDialogWidget(initialTime: _selectedTime ?? TimeOfDay.now()),
    );

    if (picked == null) return;

    setState(() {
      _selectedTime = picked;
      _timeController.text = picked.format(context);
    });
  }

  void _createEvent() {
    Navigator.of(context).maybePop();
  }

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
          'Create Event',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: AppGradients.formCard,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Icon(
                          Icons.groups_outlined,
                          color: AppColors.icon,
                          size: 22,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Create Event',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      'Build a space where people with shared interests can '
                      'connect and grow together',
                      style: TextStyle(
                        fontSize: 13,
                        height: 1.4,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              const UploadCoverImageBox(),

              const SizedBox(height: 20),

              EventFormField(
                label: 'Event Title',
                controller: _titleController,
                hintText: 'e.g. Music Lovers',
              ),

              const SizedBox(height: 18),

              EventFormField(
                label: 'Select Location',
                controller: _locationController,
                hintText: 'Select address',
                leadingIcon: Icons.location_on_outlined,
              ),

              const SizedBox(height: 18),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: EventFormField(
                      label: 'Date',
                      controller: _dateController,
                      hintText: 'Select',
                      leadingIcon: Icons.calendar_today_outlined,
                      readOnly: true,
                      onTap: _pickDate,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: EventFormField(
                      label: 'Time',
                      controller: _timeController,
                      hintText: 'Select',
                      leadingIcon: Icons.access_time,
                      readOnly: true,
                      onTap: _pickTime,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 18),

              EventFormField(
                label: 'Max Attendees',
                controller: _maxAttendeesController,
                hintText: '10',
                keyboardType: TextInputType.number,
              ),

              const SizedBox(height: 18),

              EventFormField(
                label: 'Rules',
                controller: _rulesController,
                hintText:
                    '1. you have to respect all member\n'
                    '1. you have to respect all member',
                maxLines: 5,
              ),

              const SizedBox(height: 28),

              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 52,
                      child: OutlinedButton(
                        onPressed: () => Navigator.of(context).maybePop(),
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: AppColors.border),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(26),
                          ),
                        ),
                        child: const Text(
                          'Cancel',
                          style: TextStyle(
                            color: AppColors.textPrimary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: SizedBox(
                      height: 52,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: AppGradients.fab,
                          borderRadius: BorderRadius.circular(26),
                        ),
                        child: ElevatedButton(
                          onPressed: _createEvent,
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: AppColors.transparent,
                            shadowColor: AppColors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(26),
                            ),
                          ),
                          child: const Text(
                            'Create',
                            style: TextStyle(
                              color: AppColors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
