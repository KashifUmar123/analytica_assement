import 'package:analytica_assement/core/constants/app_colors.dart';
import 'package:analytica_assement/core/extensions/num_extension.dart';
import 'package:analytica_assement/core/widgets/custom_scaffold.dart';
import 'package:analytica_assement/features/bottom_navbar/bottom_navbar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomNavbar extends GetView<BottomNavbarController> {
  const CustomBottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: controller,
      builder: (_) {
        return CustomScaffold(
          navigationBar: _buildBottomNavbar(),
          child: controller.screens[controller.selectedIndex],
        );
      },
    );
  }

  Widget _buildBottomNavbar() {
    return Container(
      height: 68,
      width: double.infinity,
      margin: const EdgeInsetsDirectional.only(start: 20, end: 20, bottom: 20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          _buildBottomNavbarItem(
            value: 0,
            icon: Icons.home,
            label: 'Home',
            onTap: controller.onIndexChanged,
            isSelected: controller.selectedIndex == 0,
          ),
          _buildBottomNavbarItem(
            value: 1,
            icon: Icons.sell,
            label: 'Sell',
            onTap: controller.onIndexChanged,
            isSelected: controller.selectedIndex == 1,
          ),
          _buildBottomNavbarItem(
            value: 2,
            icon: Icons.favorite,
            label: 'Favorites',
            onTap: controller.onIndexChanged,
            isSelected: controller.selectedIndex == 2,
          ),
          _buildBottomNavbarItem(
            value: 3,
            icon: Icons.person,
            label: 'Profile',
            onTap: controller.onIndexChanged,
            isSelected: controller.selectedIndex == 3,
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavbarItem({
    required int value,
    required IconData icon,
    required String label,
    bool isSelected = false,
    required Function(int) onTap,
  }) {
    return Expanded(
      child: InkWell(
        splashColor: Colors.transparent,
        onTap: () => onTap.call(value),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 24,
              color: isSelected
                  ? AppColors.black
                  : AppColors.black.withOpacity(.5),
            ),
            2.verticalSpace,
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: isSelected
                    ? AppColors.black
                    : AppColors.black.withOpacity(.75),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
