import 'package:e_storex/feature/home/logic/cubit/home_cubit.dart';
import 'package:e_storex/feature/home/ui/widgets/category_tab.dart';
import 'package:e_storex/feature/home/ui/widgets/home_header.dart';
import 'package:e_storex/feature/home/ui/widgets/home_tab.dart';
import 'package:e_storex/feature/home/ui/widgets/home_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _bottomIndex = 0;

  @override
  void initState() {
    super.initState();
    // context.read<HomeCubit>().getHomeData(bestSellersCount: 10);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color(0xFFF7F7FB),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _bottomIndex,
          onTap: (index) {
            setState(() => _bottomIndex = index);
          },
          type: BottomNavigationBarType.fixed,
          selectedItemColor: const Color(0xFF5B4FE9),
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined),
              label: 'My Order',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'My Profile',
            ),
          ],
        ),
        body: SafeArea(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(16, 8, 16, 0),
                child: HomeHeader(),
              ),
              const SizedBox(height: 12),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: HomeTabBar(),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    if (state is HomeLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is HomeFailure) {
                      return Center(
                        child: Text(state.message ?? 'Something went wrong'),
                      );
                    } else if (state is HomeSuccess) {
                      return TabBarView(
                        children: [
                          HomeTab(
                            newArrivals: state.featuredProducts,
                            bestSellers:
                                state.bestSellingProducts, // 👈 أضفناها هنا
                          ),
                          CategoryTab(categories: state.categories),
                        ],
                      );
                    }
                    return const Center(child: Text('Loading...'));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
