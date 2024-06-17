import 'package:flutter/material.dart';
import 'package:hirejobindia/components/styles.dart';
import 'package:hirejobindia/widget/elevated_button.dart';

class Filter extends StatefulWidget {
  static const String id = 'Filter';

  const Filter({Key? key}) : super(key: key);

  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  RangeValues distance = const RangeValues(40, 80);
  RangeValues age = const RangeValues(40, 80);
  String dropdownValueCountry = 'Yearly';

  bool _isChecked = true;
  // ignore: unused_field
  String _currText = '';
  int selectID = 1;

  List<String> text = [
    'Full Time (52)',
    'Freelance (100)',
    'Part Time (141)',
    'Internship (11)',
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          title: const Text('Filter'),
          centerTitle: true,
          titleSpacing: 0,
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          ],
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[appColor2, appColor]),
            ),
          ),
          elevation: 0,
        ),
        body: _buildBody());
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                Expanded(child: blackHeading('Salary Range')),
                DropdownButton<String>(
                  value: dropdownValueCountry,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  style: const TextStyle(color: Colors.black87),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValueCountry = newValue!;
                    });
                  },
                  items: <String>['Yearly', 'Monthly', 'Daily']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
            RangeSlider(
              values: distance,
              min: 0,
              max: 100,
              divisions: 10,
              activeColor: appColor,
              inactiveColor: Colors.grey[300],
              labels: RangeLabels(
                distance.start.round().toString(),
                distance.end.round().toString(),
              ),
              onChanged: (RangeValues values) {
                setState(() {
                  distance = values;
                });
              },
            ),
            const SizedBox(height: 16),
            blackHeading('Job Type'),
            const SizedBox(height: 16),
            SizedBox(
              child: Column(
                children: text
                    .map((t) => CheckboxListTile(
                          visualDensity:
                              const VisualDensity(horizontal: 0, vertical: -4),
                          activeColor: appColor,
                          value: _isChecked,
                          title: Text(t),
                          onChanged: (val) {
                            setState(() {
                              _isChecked = val!;
                              if (val == true) {
                                _currText = t;
                              }
                            });
                          },
                        ))
                    .toList(),
              ),
            ),
            const SizedBox(height: 16),
            blackHeading('Experience Level'),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildSelect('Entry Level', 1),
                _buildSelect('Mid Level', 2),
                _buildSelect('Senior Level', 3),
              ],
            ),
            const SizedBox(height: 20),
            MyElevatedButton(
                onPressed: () {},
                text: const Text(
                  'Show Result',
                  style: TextStyle(color: Colors.white, fontFamily: 'medium'),
                ),
                height: 45,
                width: double.infinity)
          ],
        ),
      ),
    );
  }

  Widget _buildSelect(title, id) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectID = id;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
        margin: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          color: selectID == id ? appColor : Colors.transparent,
          borderRadius: const BorderRadius.all(Radius.circular(50.0)),
        ),
        child: Text(title,
            style: TextStyle(
                fontFamily: 'medium',
                fontSize: 12,
                color: selectID == id ? Colors.white : Colors.black54)),
      ),
    );
  }
}
