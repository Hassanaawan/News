import 'package:flutter/material.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  BottomNavigationBarWidget({required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    // Define a color scheme based on 92 News branding for both dark and light themes.
    Color gradientStart = Theme.of(context).brightness == Brightness.dark
        ? Colors.deepPurple.shade800
        : Colors.deepPurple.shade700;

    Color gradientEnd = Theme.of(context).brightness == Brightness.dark
        ? Colors.deepPurple.shade600
        : Colors.deepPurple.shade400;

    Color selectedItemColor = Theme.of(context).brightness == Brightness.dark
        ? Colors.white
        : Colors.white70;

    Color unselectedItemColor = Theme.of(context).brightness == Brightness.dark
        ? Colors.white70
        : Colors.black54;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [gradientStart, gradientEnd],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        boxShadow: [
          BoxShadow(
            color: gradientStart.withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTap,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.transparent, // Makes the background transparent to show the gradient
        selectedItemColor: selectedItemColor, // Color for selected items
        unselectedItemColor: unselectedItemColor, // Color for unselected items
        showUnselectedLabels: true,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal, fontSize: 11),
        elevation: 0, // Remove default shadow
        items: [
          BottomNavigationBarItem(
            icon: Stack(
              children: [
                const Icon(Icons.home, size: 28),
                if (currentIndex == 0)
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.orange,
                        border: Border.all(color: Colors.white, width: 1),
                      ),
                    ),
                  ),
              ],
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Stack(
              children: [
                const Icon(Icons.video_library, size: 28),
                Positioned(
                  top: -3,
                  right: -3,
                  child: Container(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 1),
                    ),
                    child: const Text(
                      '3',
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ),
                ),
              ],
            ),
            label: 'Videos',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.category, size: 28),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.account_circle, size: 28),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
