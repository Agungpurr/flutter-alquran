import 'package:flutter/material.dart';
import 'package:flutter_ahlul_quran_app/ui/surat_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../common/contants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Ahlul Quran',
          style: TextStyle(
            color: AppColors.primary,
            fontSize: 30.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: AppColors.background,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 24.sp,
          vertical: 16.sp,
        ),
        child: ListView(
          children: [
            // Card Motivasi (Fixed Overflow)
            SizedBox(
              height: 156.h,
              width: size.width - 48.w,
              child: Stack(
                children: [
                  Positioned(
                    top: 16.sp,
                    child: Container(
                      height: 140.h,
                      width: size.width - 48.w,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [AppColors.primary, AppColors.primaryLight],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(18.r),
                        border: Border.all(
                          color: AppColors.gold,
                          width: 1.5,
                        ),
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          opacity: 0.3,
                          image: AssetImage('assets/motivasi.png'),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16.sp), // Dikurangi dari 24
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.menu_book,
                                  color: AppColors.gold,
                                  size: 20.sp,
                                ),
                                SizedBox(width: 8.w),
                                Text(
                                  'Motivasi',
                                  style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 6.h), // Dikurangi dari 8
                            Flexible(
                              child: Text(
                                'Sebaik - baik manusia diantara kamu adalah yang mempelajari Al-Quran dan mengajarkannya',
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 12.sp,
                                  height: 1.3,
                                ),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 24.sp,
                    child: SizedBox(
                      width: 40.w,
                      height: 32.h,
                      child: SvgPicture.asset(
                        'assets/petik.svg',
                        colorFilter: ColorFilter.mode(
                          AppColors.gold,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 28.h),

            // Grid Menu
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Kolom Kiri
                Column(
                  children: [
                    // Card Al Quran (Hijau + Gold)
                    _buildMenuCard(
                      context: context,
                      size: size,
                      width: (size.width - 68.sp) / 2,
                      height: 186.h,
                      isPrimary: true,
                      icon: 'assets/book.svg',
                      title: 'Al Quran',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SuratPage(),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 20.h),

                    // Card Pencarian (Putih + Border)
                    _buildMenuCard(
                      context: context,
                      size: size,
                      width: (size.width - 68.sp) / 2,
                      height: 155.h,
                      isPrimary: false,
                      icon: 'assets/search.svg',
                      title: 'Pencarian',
                    ),
                  ],
                ),

                // Kolom Kanan
                Column(
                  children: [
                    // Card Hafalan (Putih + Border)
                    _buildMenuCard(
                      context: context,
                      size: size,
                      width: (size.width - 68.sp) / 2,
                      height: 155.h,
                      isPrimary: false,
                      icon: 'assets/brain.svg',
                      title: 'Hafalan',
                    ),
                    SizedBox(height: 20.h),

                    // Card Dashboard (Hijau + Gold)
                    _buildMenuCard(
                      context: context,
                      size: size,
                      width: (size.width - 68.sp) / 2,
                      height: 186.h,
                      isPrimary: true,
                      icon: 'assets/dashboard.svg',
                      title: 'Dashboard',
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Widget Helper untuk Menu Card
  Widget _buildMenuCard({
    required BuildContext context,
    required Size size,
    required double width,
    required double height,
    required bool isPrimary,
    required String icon,
    required String title,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(24.r),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          gradient: isPrimary
              ? LinearGradient(
                  colors: [AppColors.primary, AppColors.primaryLight],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : null,
          color: isPrimary ? null : AppColors.white,
          borderRadius: BorderRadius.circular(24.r),
          border: Border.all(
            color:
                isPrimary ? AppColors.gold : AppColors.primary.withOpacity(0.3),
            width: isPrimary ? 2 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: isPrimary
                  ? AppColors.primary.withOpacity(0.3)
                  : Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 16.sp),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 24.sp),
                    child: SvgPicture.asset(
                      icon,
                      fit: BoxFit.fitHeight,
                      colorFilter: ColorFilter.mode(
                        isPrimary ? AppColors.gold : AppColors.primary,
                        BlendMode.srcIn,
                      ),
                      height: 52.h,
                      width: 44.w,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 24.sp),
                    child: Text(
                      title,
                      style: TextStyle(
                        color: isPrimary ? AppColors.white : AppColors.primary,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  )
                ],
              ),
              Positioned(
                top: -4.sp,
                left:
                    title == 'Pencarian' || title == 'Hafalan' ? 60.sp : 76.sp,
                child: SizedBox(
                  width: 160.w,
                  height: 160.h,
                  child: SvgPicture.asset(
                    'assets/ornament.svg',
                    colorFilter: ColorFilter.mode(
                      isPrimary
                          ? AppColors.white.withOpacity(0.2)
                          : AppColors.primary.withOpacity(0.1),
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
