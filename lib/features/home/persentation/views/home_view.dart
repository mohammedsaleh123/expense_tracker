import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../cubit/home_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      final cubit = context.read<HomeCubit>();
      return Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black,
                Colors.blue.shade900,
                Colors.blue.shade700,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: cubit.pages[cubit.currentIndex],
        ),
        floatingActionButton: Container(
          height: 70.h,
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          margin: EdgeInsets.all(10.sp),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(30),
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            currentIndex: cubit.currentIndex,
            selectedItemColor: Colors.blue.shade500,
            unselectedItemColor: Colors.grey,
            iconSize: 30.sp,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.money),
                label: 'Income',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.analytics),
                label: 'Expenses',
              )
            ],
            onTap: (index) {
              cubit.changePage(index);
            },
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      );
    });
  }
}
