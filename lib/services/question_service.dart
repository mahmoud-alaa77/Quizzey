

import 'package:dio/dio.dart';
import 'package:untitled2/models/question_model.dart';

class QuestionService{

  Dio dio=Dio();

 Future getQuestion({required int amount , required int categoryId})async{

    Response response=
    await dio.get("https://opentdb.com/api.php?amount=$amount&category=$categoryId&type=multiple");

    List jsonData=response.data["results"];

List<QuestionModel> questionsList=[];
for(int i=0;i<amount;i++){
  QuestionModel model=QuestionModel.fromJson(jsonData[i]);
  questionsList.add(model);
}

// print(questionsList[1].title);
return questionsList;
 }

}