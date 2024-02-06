import 'package:apicall_with_model3/api_services.dart';
import 'package:apicall_with_model3/api_with_model.dart';
import 'package:flutter/material.dart';

class ScreenWithApiModel extends StatefulWidget {
  const ScreenWithApiModel({super.key});

  @override
  State<ScreenWithApiModel> createState() => _ScreenWithApiModelState();
}

class _ScreenWithApiModelState extends State<ScreenWithApiModel> {
  List<ApiWithModel> apiModel = [];
  bool isReady = false;

  _getDataFromApiModel() {
    isReady = true;
    ApiServices().getDataApi().then((value) {
      setState(() {
        apiModel = value!;
        isReady = false;
      });
    });
  }

  // @override
  // void initState() {
  //   _getDataFromApiModel();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Data With API'),
        ),
        body: Column(
          children: [
            ElevatedButton(
                onPressed: _getDataFromApiModel, child: Text('Get Data')),
            Expanded(
              child: isReady == true
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      itemCount: apiModel.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: Card(
                            color: Colors.yellow,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('ID : ' + apiModel[index].id.toString()),
                                  Text('Name : ' +
                                      apiModel[index].name.toString()),
                                  Text('Email : ' +
                                      apiModel[index].email.toString()),
                                  Text('Title : ' +
                                      apiModel[index].body.toString()),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
            )
          ],
        ));
  }
}
