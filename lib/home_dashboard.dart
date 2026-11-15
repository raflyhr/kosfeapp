import 'package:flutter/material.dart';

class HomeDashboard extends StatefulWidget {
  const HomeDashboard({super.key});

  @override
  State<HomeDashboard> createState() => _HomeDashboardState();
}

class _HomeDashboardState extends State<HomeDashboard> {
  int _selectedNavIndex = 0;

  // Device states for interactivity
  bool _lampOn = true;
  bool _fanOn = false;
  bool _ventOpen = true;

  @override
  Widget build(BuildContext context) {
    const bgColor = Color(0xFFF8F9F6);

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            // Main scrollable content
            SingleChildScrollView(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 12,
                bottom: 110, // space for bottom floating nav bar
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTopBar(),
                  const SizedBox(height: 20),
                  _buildGreeting(),
                  const SizedBox(height: 20),
                  _buildRoomConditionCard(),
                  const SizedBox(height: 20),
                  _buildSensorsSection(),
                  const SizedBox(height: 20),
                  _buildTrendsSection(),
                  const SizedBox(height: 20),
                  _buildDevicesSection(),
                  const SizedBox(height: 20),
                  _buildRecentActivitySection(),
                ],
              ),
            ),

            // Floating Bottom Navigation Bar
            Positioned(
              left: 20,
              right: 20,
              bottom: 24,
              child: _buildBottomNavBar(),
            ),
          ],
        ),
      ),
    );
  }

  // MARK: - Top App Bar
  Widget _buildTopBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Brand & Room Info
        Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: const Color(0xFF244B3A),
                borderRadius: BorderRadius.circular(11),
              ),
              child: const Icon(
                Icons.eco_rounded,
                color: Colors.white,
                size: 20,
              ),
            ),
            const SizedBox(width: 10),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'EcoHome',
                  style: TextStyle(
                    color: Color(0xFF252B27),
                    fontSize: 15,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Living Room',
                  style: TextStyle(
                    color: Color(0xFFA8AEA8),
                    fontSize: 11,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ],
        ),

        // Status & Notification Actions
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFFE6F1EA),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                children: [
                  Container(
                    width: 6,
                    height: 6,
                    decoration: const BoxDecoration(
                      color: Color(0xFF3B8A63),
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 6),
                  const Text(
                    'Online',
                    style: TextStyle(
                      color: Color(0xFF3B8A63),
                      fontSize: 11,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFE9ECE7)),
              ),
              child: const Icon(
                Icons.notifications_none_rounded,
                color: Color(0xFF252B27),
                size: 18,
              ),
            ),
          ],
        ),
      ],
    );
  }

  // MARK: - Greeting
  Widget _buildGreeting() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Good morning, Ayu',
          style: TextStyle(
            color: Color(0xFF252B27),
            fontSize: 24,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
            letterSpacing: -0.4,
          ),
        ),
        SizedBox(height: 5),
        Text(
          'Your living room is calm and comfortable today.',
          style: TextStyle(
            color: Color(0xFF727A74),
            fontSize: 13,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
            height: 1.45,
          ),
        ),
      ],
    );
  }

  // MARK: - Room Condition Card
  Widget _buildRoomConditionCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF252B27).withOpacity(0.04),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'ROOM CONDITION',
                style: TextStyle(
                  color: Color(0xFFA8AEA8),
                  fontSize: 10.5,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.2,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFFE9EFE9),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Text(
                  'Normal',
                  style: TextStyle(
                    color: Color(0xFF244B3A),
                    fontSize: 11.5,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                  color: const Color(0xFFE9EFE9),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Icon(
                  Icons.verified_user_rounded,
                  color: Color(0xFF244B3A),
                  size: 24,
                ),
              ),
              const SizedBox(width: 14),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Comfortable & safe',
                      style: TextStyle(
                        color: Color(0xFF252B27),
                        fontSize: 17,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      'All sensors within threshold',
                      style: TextStyle(
                        color: Color(0xFF727A74),
                        fontSize: 11.5,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          const Divider(height: 1, color: Color(0xFFF1F3EE)),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 6,
                    height: 6,
                    decoration: const BoxDecoration(
                      color: Color(0xFF3B8A63),
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 6),
                  const Text(
                    'Live · updated 2 min ago',
                    style: TextStyle(
                      color: Color(0xFFA8AEA8),
                      fontSize: 11,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const Icon(
                Icons.chevron_right_rounded,
                color: Color(0xFFA8AEA8),
                size: 18,
              ),
            ],
          ),
        ],
      ),
    );
  }

  // MARK: - Sensors Section
  Widget _buildSensorsSection() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Sensors',
              style: TextStyle(
                color: Color(0xFF252B27),
                fontSize: 16,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
              ),
            ),
            InkWell(
              onTap: () {},
              child: const Row(
                children: [
                  Text(
                    'Monitor',
                    style: TextStyle(
                      color: Color(0xFF244B3A),
                      fontSize: 12,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 2),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Color(0xFF244B3A),
                    size: 12,
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _buildSensorCard(
                icon: Icons.air_rounded,
                iconColor: const Color(0xFF244B3A),
                iconBg: const Color(0xFFE9EFE9),
                title: 'Air quality',
                value: '680',
                unit: 'ADC',
                status: 'Good',
                statusColor: const Color(0xFF3B8A63),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildSensorCard(
                icon: Icons.wb_sunny_rounded,
                iconColor: const Color(0xFFE5AD50),
                iconBg: const Color(0xFFFBF2E2),
                title: 'Light intensity',
                value: '760',
                unit: 'ADC',
                status: 'Bright',
                statusColor: const Color(0xFFE5AD50),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _buildSensorCard(
                icon: Icons.thermostat_rounded,
                iconColor: const Color(0xFF244B3A),
                iconBg: const Color(0xFFE9EFE9),
                title: 'Temperature',
                value: '26.4',
                unit: '°C',
                status: 'Comfortable',
                statusColor: const Color(0xFF3B8A63),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildSensorCard(
                icon: Icons.water_drop_rounded,
                iconColor: const Color(0xFF5587B7),
                iconBg: const Color(0xFFEBF1F7),
                title: 'Humidity',
                value: '58',
                unit: '%',
                status: 'Optimal',
                statusColor: const Color(0xFF3B8A63),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSensorCard({
    required IconData icon,
    required Color iconColor,
    required Color iconBg,
    required String title,
    required String value,
    required String unit,
    required String status,
    required Color statusColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF252B27).withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: iconBg,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: iconColor, size: 16),
              ),
              Container(
                width: 7,
                height: 7,
                decoration: BoxDecoration(
                  color: statusColor,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
              color: Color(0xFF727A74),
              fontSize: 11.5,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                value,
                style: const TextStyle(
                  color: Color(0xFF252B27),
                  fontSize: 26,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                unit,
                style: const TextStyle(
                  color: Color(0xFFA8AEA8),
                  fontSize: 11,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            status,
            style: TextStyle(
              color: statusColor,
              fontSize: 11,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  // MARK: - Trends Section
  Widget _buildTrendsSection() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Trends',
              style: TextStyle(
                color: Color(0xFF252B27),
                fontSize: 16,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFFF0F2ED),
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Text(
                'Today · 24H',
                style: TextStyle(
                  color: Color(0xFF727A74),
                  fontSize: 11.5,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF252B27).withOpacity(0.03),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Gas Trend
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Gas (ADC)',
                          style: TextStyle(
                            color: Color(0xFFA8AEA8),
                            fontSize: 11,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '680',
                          style: TextStyle(
                            color: Color(0xFF252B27),
                            fontSize: 14,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    _buildMiniBarChart(
                      heights: [20, 23, 21, 26, 29, 25, 32, 30, 35, 33],
                      activeColor: const Color(0xFF244B3A),
                      inactiveColor: const Color(0xFFDEE6DF),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Container(
                width: 1,
                height: 70,
                color: const Color(0xFFE8EBE5),
              ),
              const SizedBox(width: 16),
              // Light Trend
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Light (ADC)',
                          style: TextStyle(
                            color: Color(0xFFA8AEA8),
                            fontSize: 11,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '760',
                          style: TextStyle(
                            color: Color(0xFF252B27),
                            fontSize: 14,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    _buildMiniBarChart(
                      heights: [40, 38, 34, 29, 26, 22, 19, 17, 15, 14],
                      activeColor: const Color(0xFFE5AD50),
                      inactiveColor: const Color(0xFFDEE6DF),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMiniBarChart({
    required List<double> heights,
    required Color activeColor,
    required Color inactiveColor,
  }) {
    return SizedBox(
      height: 56,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: heights.asMap().entries.map((entry) {
          final isLast = entry.key == heights.length - 1;
          return Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 1.5),
              height: entry.value,
              decoration: BoxDecoration(
                color: isLast ? activeColor : inactiveColor,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  // MARK: - Devices Section
  Widget _buildDevicesSection() {
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Devices',
              style: TextStyle(
                color: Color(0xFF252B27),
                fontSize: 16,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'Auto mode · 3 devices',
              style: TextStyle(
                color: Color(0xFFA8AEA8),
                fontSize: 11,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _buildDeviceCard(
                title: 'Lamp',
                subtitle: _lampOn ? 'On · 72%' : 'Off',
                isActive: _lampOn,
                icon: Icons.lightbulb_outline_rounded,
                activeBg: const Color(0xFFFBF2E2),
                activeColor: const Color(0xFFE5AD50),
                onTap: () {
                  setState(() {
                    _lampOn = !_lampOn;
                  });
                },
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: _buildDeviceCard(
                title: 'Fan',
                subtitle: _fanOn ? 'On · High' : 'Off',
                isActive: _fanOn,
                icon: Icons.mode_fan_off_rounded,
                activeBg: const Color(0xFFE9EFE9),
                activeColor: const Color(0xFF244B3A),
                onTap: () {
                  setState(() {
                    _fanOn = !_fanOn;
                  });
                },
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: _buildDeviceCard(
                title: 'Vent',
                subtitle: _ventOpen ? 'Open · 70%' : 'Closed',
                isActive: _ventOpen,
                icon: Icons.window_rounded,
                activeBg: const Color(0xFFE9EFE9),
                activeColor: const Color(0xFF244B3A),
                onTap: () {
                  setState(() {
                    _ventOpen = !_ventOpen;
                  });
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDeviceCard({
    required String title,
    required String subtitle,
    required bool isActive,
    required IconData icon,
    required Color activeBg,
    required Color activeColor,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isActive ? activeColor.withOpacity(0.35) : Colors.transparent,
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF252B27).withOpacity(0.03),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: isActive ? activeBg : const Color(0xFFF0F2ED),
                borderRadius: BorderRadius.circular(11),
              ),
              child: Icon(
                icon,
                color: isActive ? activeColor : const Color(0xFFA8AEA8),
                size: 17,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                color: Color(0xFF252B27),
                fontSize: 12.5,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              subtitle,
              style: TextStyle(
                color: isActive ? const Color(0xFF3B8A63) : const Color(0xFFA8AEA8),
                fontSize: 11,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // MARK: - Recent Activity Section
  Widget _buildRecentActivitySection() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Recent activity',
              style: TextStyle(
                color: Color(0xFF252B27),
                fontSize: 16,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
              ),
            ),
            InkWell(
              onTap: () {},
              child: const Text(
                'View all',
                style: TextStyle(
                  color: Color(0xFF244B3A),
                  fontSize: 11.5,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF252B27).withOpacity(0.03),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            children: [
              _buildActivityItem(
                title: 'Gas level rose slightly',
                subtitle: '10:24 · 812 ADC',
                icon: Icons.warning_amber_rounded,
                iconColor: const Color(0xFFE5AD50),
                iconBg: const Color(0xFFFBF2E2),
              ),
              const Divider(height: 1, indent: 54, color: Color(0xFFF3F5F1)),
              _buildActivityItem(
                title: 'Ventilation opened automatically',
                subtitle: '10:24 · Servo at 70%',
                icon: Icons.window_rounded,
                iconColor: const Color(0xFF244B3A),
                iconBg: const Color(0xFFE9EFE9),
              ),
              const Divider(height: 1, indent: 54, color: Color(0xFFF3F5F1)),
              _buildActivityItem(
                title: 'Lamp switched on by voice',
                subtitle: '08:45 · Brightness 60%',
                icon: Icons.lightbulb_outline_rounded,
                iconColor: const Color(0xFF244B3A),
                iconBg: const Color(0xFFE9EFE9),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildActivityItem({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color iconColor,
    required Color iconBg,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      child: Row(
        children: [
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: iconBg,
              borderRadius: BorderRadius.circular(9),
            ),
            child: Icon(icon, color: iconColor, size: 15),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFF252B27),
                    fontSize: 12.5,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Color(0xFFA8AEA8),
                    fontSize: 10.5,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // MARK: - Floating Bottom Navigation Bar
  Widget _buildBottomNavBar() {
    final navItems = [
      (Icons.home_rounded, 'Home'),
      (Icons.sensors_rounded, 'Monitor'),
      (Icons.tune_rounded, 'Control'),
      (Icons.auto_awesome_rounded, 'AI'),
      (Icons.settings_outlined, 'Settings'),
    ];

    return Container(
      height: 64,
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1E252B27),
            blurRadius: 24,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: List.generate(navItems.length, (index) {
          final isSelected = _selectedNavIndex == index;
          final item = navItems[index];

          return Expanded(
            child: InkWell(
              onTap: () {
                setState(() {
                  _selectedNavIndex = index;
                });
              },
              borderRadius: BorderRadius.circular(26),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: double.infinity,
                decoration: BoxDecoration(
                  color: isSelected ? const Color(0xFFF0F2ED) : Colors.transparent,
                  borderRadius: BorderRadius.circular(26),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      item.$1,
                      size: 20,
                      color: isSelected ? const Color(0xFF244B3A) : const Color(0xFFA8AEA8),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      item.$2,
                      style: TextStyle(
                        color: isSelected ? const Color(0xFF244B3A) : const Color(0xFFA8AEA8),
                        fontSize: 9.5,
                        fontFamily: 'Inter',
                        fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
