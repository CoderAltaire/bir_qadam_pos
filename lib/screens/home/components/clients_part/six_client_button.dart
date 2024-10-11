import 'package:bir_qadam_pos/core/core.dart';
import 'package:flutter/material.dart';

class SixClientsButton extends StatelessWidget {
  const SixClientsButton({
    super.key,
    required this.onPressed,
    required this.clientNumber,
    required this.isSelected,
  });

  final VoidCallback onPressed;
  final int clientNumber;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 15.sp),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.r),
        child: MaterialButton(
          focusNode: FocusNode(skipTraversal: true),
          elevation: 0,
          color: isSelected
              ?AppColors.pinButtonColor
              :AppColors.greyF3,
          minWidth: 40.h,
          height: 30.w,
          onPressed: onPressed,
          child: Text(
            'Client $clientNumber',
            style: AppTextStyle.medium(
                color: isSelected? AppColors.white : AppColors.greyF4),
          ),
        ),
      ),
    );
  }
}

// tabButton(int e, int currentClient) {
//   return InkWell(
//     onTap: () {
//       BlocProvider.of<ClientBloc>(context).add(CurrentClientEvent(e));
//     },
//     child: Padding(
//       padding: EdgeInsets.symmetric(horizontal: 7.sp),
//       child: Container(
//         decoration: BoxDecoration(
//             color: e == currentClient ? AppColors.primary : AppColors.greyF3,
//             borderRadius: BorderRadius.circular(8.r),
//             border: Border.all(
//               color: e == currentClient ? AppColors.primary : AppColors.greyF3,
//               width: 1,
//             )),
//         child: Padding(
//           padding: EdgeInsets.symmetric(vertical: 8.sp, horizontal: 10.sp),
//           child: Text(
//             "Savdo $e",
//             style: AppTextStyle.medium(
//                 color: e == currentClient ? AppColors.white : AppColors.greyF4),
//           ),
//         ),
//       ),
//     ),
//   );
// }
