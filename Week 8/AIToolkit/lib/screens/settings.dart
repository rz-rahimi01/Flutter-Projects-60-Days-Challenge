import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool _notificationsEnabled = true;
  bool _darkModeEnabled = false;
  String _selectedLanguage = 'English';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionHeader('Preferences'),
            _buildSettingItem(
              icon: Icons.notifications,
              title: 'Notifications',
              trailing: Switch(
                value: _notificationsEnabled,
                onChanged: (value) {
                  setState(() {
                    _notificationsEnabled = value;
                  });
                },
              ),
            ),
            _buildSettingItem(
              icon: Icons.dark_mode,
              title: 'Dark Mode',
              trailing: Switch(
                value: _darkModeEnabled,
                onChanged: (value) {
                  setState(() {
                    _darkModeEnabled = value;
                  });
                },
              ),
            ),
            _buildSettingItem(
              icon: Icons.language,
              title: 'Language',
              trailing: DropdownButton<String>(
                value: _selectedLanguage,
                underline: Container(),
                items: ['English', 'Spanish', 'French', 'German']
                    .map((language) => DropdownMenuItem(
                          value: language,
                          child: Text(language),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedLanguage = value!;
                  });
                },
              ),
            ),
            
            const SizedBox(height: 24),
            _buildSectionHeader('Account'),
            _buildSettingItem(
              icon: Icons.person,
              title: 'Edit Profile',
              onTap: () {
                // Navigate to profile edit page
              },
            ),
            _buildSettingItem(
              icon: Icons.security,
              title: 'Privacy Settings',
              onTap: () {
                // Navigate to privacy settings
              },
            ),
            
            const SizedBox(height: 24),
            _buildSectionHeader('Support'),
            _buildSettingItem(
              icon: Icons.help,
              title: 'Help Center',
              onTap: () {
                // Navigate to help center
              },
            ),
            _buildSettingItem(
              icon: Icons.feedback,
              title: 'Send Feedback',
              onTap: () {
                // Navigate to feedback form
              },
            ),
            
