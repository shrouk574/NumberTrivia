import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:number_trivia/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:number_trivia/features/number_trivia/domain/entities/number_trivia.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tNumberTriviaModel = NumberTriviaModel(number: 1, text: 'Test Text');

  test("Should be a subclass of NumberTrivia entity ", () async {
    expect(tNumberTriviaModel, isA<NumberTrivia>());
  });

  group('FromJson', () {

    test("Should return a a valid model when the Json number is an integer",
            () async {
          final Map<String, dynamic> jsonMap = json.decode(fixture('trivia.json'));

          final result = NumberTriviaModel.fromJson(jsonMap);
          expect(result, tNumberTriviaModel);
        });

    test("Should return a a valid model when the Json number is regarded as a double",
            () async {
          final Map<String, dynamic> jsonMap = json.decode(fixture('trivia_double.json'));

          final result = NumberTriviaModel.fromJson(jsonMap);
          expect(result, tNumberTriviaModel);
        });
  });

  group("ToJson", (){
    test("Should return a JSON Map containing the proper data ", () async {

      final result = tNumberTriviaModel.toJson();

      final expectedMap = {
        "text": "Test Text",
        "number": 1,
      };

      expect(result, expectedMap);

    });
  });
}
