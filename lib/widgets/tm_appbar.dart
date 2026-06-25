import 'package:flutter/material.dart';
import 'package:taskmanager/widgets/app_color.dart';

class TmAppbar extends StatelessWidget implements PreferredSize {
  const TmAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.primaryColor,
      title: Row(
        children: [
          const CircleAvatar(
            radius: 20,
            // backgroundImage: AssetImage(AssetsPath.appBarImg),
            backgroundImage: NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJRF-V2_-af4EPgGAHNHJLBp9jsHPrIbiH3CLLOZIHQA&s=10'),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Messi',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.white,
                    ),
              ),
              Text(
                'Messi10@gmail.com',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Colors.white,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
