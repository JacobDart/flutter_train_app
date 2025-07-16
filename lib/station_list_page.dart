import 'package:flutter/material.dart';

// 역 목록 페이지
class StationListPage extends StatelessWidget {
  final String title;

  StationListPage({required this.title});

  @override
  Widget build(BuildContext context) {
    // 역 목록 리스트
    List<String> stationList = [
      '수서',
      '동탄',
      '평택지제',
      '천안아산',
      '오송',
      '대전',
      '김천구미',
      '동대구',
      '경주',
      '울산',
      '부산',
    ];

    return Scaffold(
      appBar: AppBar(title: Text(title), backgroundColor: Colors.purple),
      body: ListView.builder(
        itemCount: stationList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              // 선택된 역을 이전 페이지로 돌려보냄
              Navigator.pop(context, stationList[index]);
            },
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey, width: 1),
                ),
              ),
              child: Center(
                child: Text(
                  stationList[index],
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
