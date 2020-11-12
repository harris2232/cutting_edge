import 'package:cutting_edge/blocs/sorting_bloc.dart';
import 'blocs/gender_bloc.dart';
import 'blocs/price_bloc.dart';
import 'blocs/services_bloc.dart';
import 'package:cutting_edge/support_files/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'blocs/rating_bloc.dart';
import 'components/custom_check_box.dart';
import 'components/custom_top_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'components/custom_switch_button.dart';
import 'components/custom_radio_button.dart';
import 'support_files/enums.dart';

int currentIndex = 0; //for bottom navigation bar
Gender _gender = Gender.male;
int rating = 0; // 0 - 5 number of rating stars
bool minSelected =
    false; //price being minimum or maximum based on user selection
List<String> services = [];
Gender selectedGender = Gender.male;
SortBy selectedSort = SortBy.lowToHigh;

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  RatingBloc ratingBloc = RatingBloc();
  PriceBloc priceBloc = PriceBloc();
  ServicesBloc servicesBloc = ServicesBloc();
  GenderBloc genderBloc = GenderBloc();
  SortingBloc sortingBloc = SortingBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomTopBar(),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25.0,
              vertical: 15.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  //Services Filter starts here
                  'Services',
                  style: kNavigationButtonTextStyle.copyWith(
                    color: kPrimaryColor,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                StreamBuilder<String>(
                    stream: servicesBloc.servicesStream,
                    builder: (context, snapshot) {
                      services.remove(null);
                      if (services.contains(snapshot.data)) {
                        services.remove(snapshot.data);
                      } else {
                        services.add(snapshot.data);
                      }
                      print(services);
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CustomSwitchButton(
                                label: 'Spa',
                                isSelected:
                                    services.contains('Spa') ? true : false,
                                onPressed: () {
                                  servicesBloc.servicesSink.add('Spa');
                                },
                              ),
                              CustomSwitchButton(
                                label: 'Makeup',
                                isSelected:
                                    services.contains('Makeup') ? true : false,
                                onPressed: () {
                                  servicesBloc.servicesSink.add('Makeup');
                                },
                              ),
                              CustomSwitchButton(
                                label: 'Hair Coloring',
                                isSelected: services.contains('Hair Coloring')
                                    ? true
                                    : false,
                                onPressed: () {
                                  servicesBloc.servicesSink
                                      .add('Hair Coloring');
                                },
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              CustomSwitchButton(
                                label: 'Hair Style',
                                isSelected: services.contains('Hair Style')
                                    ? true
                                    : false,
                                onPressed: () {
                                  servicesBloc.servicesSink.add('Hair Style');
                                },
                              ),
                              CustomSwitchButton(
                                label: 'Cutting & Trim',
                                isSelected: services.contains('Cutting & Trim')
                                    ? true
                                    : false,
                                onPressed: () {
                                  servicesBloc.servicesSink
                                      .add('Cutting & Trim');
                                },
                              ),
                            ],
                          ),
                        ],
                      );
                    }),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  //Rating Filter Heading
                  'Rating',
                  style: kNavigationButtonTextStyle.copyWith(
                    color: kPrimaryColor,
                  ),
                ), //Rating Filter
                StreamBuilder<int>(
                    //Rating Filter starts from here
                    stream: ratingBloc.ratingStream,
                    builder: (context, snapshot) {
                      if (snapshot.data != null) {
                        rating = snapshot.data;
                        return Row(
                          children: [
                            SizedBox(
                              //one star
                              width: 30.0,
                              height: 30.0,
                              child: IconButton(
                                iconSize: 30.0,
                                color: kPrimaryColor,
                                padding: EdgeInsets.only(
                                  top: 8.0,
                                  right: 10.0,
                                ),
                                icon: Icon(snapshot.data >= 1
                                    ? Icons.star
                                    : Icons.star_border),
                                onPressed: () {
                                  ratingBloc.ratingSink.add(1);
                                },
                              ),
                            ),
                            SizedBox(
                              width: 30.0,
                              height: 30.0,
                              child: IconButton(
                                iconSize: 30.0,
                                color: kPrimaryColor,
                                padding: EdgeInsets.only(
                                  top: 8.0,
                                  right: 10.0,
                                ),
                                icon: Icon(snapshot.data >= 2
                                    ? Icons.star
                                    : Icons.star_border),
                                onPressed: () {
                                  ratingBloc.ratingSink.add(2);
                                },
                              ),
                            ),
                            SizedBox(
                              width: 30.0,
                              height: 30.0,
                              child: IconButton(
                                iconSize: 30.0,
                                color: kPrimaryColor,
                                padding: EdgeInsets.only(
                                  top: 8.0,
                                  right: 10.0,
                                ),
                                icon: Icon(snapshot.data >= 3
                                    ? Icons.star
                                    : Icons.star_border),
                                onPressed: () {
                                  ratingBloc.ratingSink.add(3);
                                },
                              ),
                            ),
                            SizedBox(
                              width: 30.0,
                              height: 30.0,
                              child: IconButton(
                                iconSize: 30.0,
                                color: kPrimaryColor,
                                padding: EdgeInsets.only(
                                  top: 8.0,
                                  right: 10.0,
                                ),
                                icon: Icon(snapshot.data >= 4
                                    ? Icons.star
                                    : Icons.star_border),
                                onPressed: () {
                                  ratingBloc.ratingSink.add(4);
                                },
                              ),
                            ),
                            SizedBox(
                              width: 30.0,
                              height: 30.0,
                              child: IconButton(
                                iconSize: 30.0,
                                color: kPrimaryColor,
                                padding: EdgeInsets.only(
                                  top: 8.0,
                                  right: 10.0,
                                ),
                                icon: Icon(snapshot.data >= 5
                                    ? Icons.star
                                    : Icons.star_border),
                                onPressed: () {
                                  ratingBloc.ratingSink.add(5);
                                },
                              ),
                            )
                          ],
                        );
                      } else {
                        return Row(
                          children: [
                            SizedBox(
                              //one star
                              width: 30.0,
                              height: 30.0,
                              child: IconButton(
                                iconSize: 30.0,
                                color: kPrimaryColor,
                                padding: EdgeInsets.only(
                                  top: 8.0,
                                  right: 10.0,
                                ),
                                icon: Icon(Icons.star_border),
                                onPressed: () {
                                  ratingBloc.ratingSink.add(1);
                                },
                              ),
                            ),
                            SizedBox(
                              width: 30.0,
                              height: 30.0,
                              child: IconButton(
                                iconSize: 30.0,
                                color: kPrimaryColor,
                                padding: EdgeInsets.only(
                                  top: 8.0,
                                  right: 10.0,
                                ),
                                icon: Icon(Icons.star_border),
                                onPressed: () {
                                  ratingBloc.ratingSink.add(2);
                                },
                              ),
                            ),
                            SizedBox(
                              width: 30.0,
                              height: 30.0,
                              child: IconButton(
                                iconSize: 30.0,
                                color: kPrimaryColor,
                                padding: EdgeInsets.only(
                                  top: 8.0,
                                  right: 10.0,
                                ),
                                icon: Icon(Icons.star_border),
                                onPressed: () {
                                  ratingBloc.ratingSink.add(3);
                                },
                              ),
                            ),
                            SizedBox(
                              width: 30.0,
                              height: 30.0,
                              child: IconButton(
                                iconSize: 30.0,
                                color: kPrimaryColor,
                                padding: EdgeInsets.only(
                                  top: 8.0,
                                  right: 10.0,
                                ),
                                icon: Icon(Icons.star_border),
                                onPressed: () {
                                  ratingBloc.ratingSink.add(4);
                                },
                              ),
                            ),
                            SizedBox(
                              width: 30.0,
                              height: 30.0,
                              child: IconButton(
                                iconSize: 30.0,
                                color: kPrimaryColor,
                                padding: EdgeInsets.only(
                                  top: 8.0,
                                  right: 10.0,
                                ),
                                icon: Icon(Icons.star_border),
                                onPressed: () {
                                  ratingBloc.ratingSink.add(5);
                                },
                              ),
                            )
                          ],
                        );
                      }
                    }),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  //Gender Filter Heading
                  'Gender',
                  style: kNavigationButtonTextStyle.copyWith(
                    color: kPrimaryColor,
                  ),
                ),
                StreamBuilder<Gender>(
                    stream: genderBloc.genderStream,
                    builder: (context, snapshot) {
                      print(snapshot.data);
                      _gender = snapshot.data;
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomRadioButton(
                            trailing: 'Male',
                            groupValue: _gender,
                            value: Gender.male,
                            onChanged: (value) {
                              genderBloc.genderSink.add(Gender.male);
                            },
                          ),
                          CustomRadioButton(
                            trailing: 'Female',
                            groupValue: _gender,
                            value: Gender.female,
                            onChanged: (value) {
                              genderBloc.genderSink.add(Gender.female);
                            },
                          ),
                          CustomRadioButton(
                            trailing: 'Other',
                            groupValue: _gender,
                            value: Gender.other,
                            onChanged: (value) {
                              genderBloc.genderSink.add(Gender.other);
                            },
                          ),
                        ],
                      );
                    }),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  //Price Filter Heading
                  'Sort By',
                  style: kNavigationButtonTextStyle.copyWith(
                    color: kPrimaryColor,
                  ),
                ),
                StreamBuilder<SortBy>(
                    stream: sortingBloc.sortingStream,
                    builder: (context, snapshot) {
                      print(snapshot.data);
                      selectedSort = snapshot.data;
                      return Column(
                        children: [
                          CustomCheckBox(
                            trailing: 'Most Popular',
                            value: selectedSort == SortBy.most_popular
                                ? true
                                : false,
                            onChanged: (value) {
                              sortingBloc.sortingSink.add(SortBy.most_popular);
                            },
                          ),
                          CustomCheckBox(
                            trailing: 'Cost low to high',
                            value:
                                selectedSort == SortBy.lowToHigh ? true : false,
                            onChanged: (value) {
                              sortingBloc.sortingSink.add(SortBy.lowToHigh);
                            },
                          ),
                          CustomCheckBox(
                            trailing: 'Cost high to low',
                            value:
                                selectedSort == SortBy.highToLow ? true : false,
                            onChanged: (value) {
                              sortingBloc.sortingSink.add(SortBy.highToLow);
                            },
                          ),
                        ],
                      );
                    }),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  //Price Filter Heading
                  'Price',
                  style: kNavigationButtonTextStyle.copyWith(
                    color: kPrimaryColor,
                  ),
                ), //Price Filter
                SizedBox(
                  height: 10.0,
                ),
                StreamBuilder<priceFilter>(
                    stream: priceBloc.priceStream,
                    builder: (context, snapshot) {
                      snapshot.data == priceFilter.min
                          ? minSelected = true
                          : minSelected = false;
                      return Row(
                        // Price Filter starts from here
                        children: [
                          CustomSwitchButton(
                            label: 'Min',
                            isSelected: minSelected,
                            onPressed: () {
                              priceBloc.priceSink.add(priceFilter.min);
                            },
                          ),
                          CustomSwitchButton(
                            isSelected: !minSelected,
                            label: 'Max',
                            onPressed: () {
                              priceBloc.priceSink.add(priceFilter.max);
                            },
                          ),
                        ],
                      );
                    }),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showUnselectedLabels: true,
      unselectedFontSize: 12.0,
      selectedFontSize: 12.0,
      onTap: (index) {
        setState(() {
          currentIndex = index;
        });
      },
      elevation: 5.0,
      currentIndex: currentIndex,
      unselectedItemColor: Colors.grey,
      selectedItemColor: kPrimaryColor,
      unselectedLabelStyle: TextStyle(
        color: Colors.grey,
      ),
      iconSize: 20.0,
      items: [
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.rocketchat),
          label: 'Chat',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.assignment),
          label: 'Appointment',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Account',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu),
          label: 'Menu',
        ),
      ],
    );
  }
}
