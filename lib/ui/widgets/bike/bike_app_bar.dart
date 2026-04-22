import 'package:flutter/material.dart';
import 'package:velotoulouse/ui/theme/theme.dart';


class BikeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BikeAppBar({super.key, required this.title});

  final String title;

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.surface,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new, size: 18),
        onPressed: () => Navigator.of(context).pop(),
      ),
      title: Text(title, style: AppTextStyles.subheading),
      centerTitle: true,
    );
  }
}
