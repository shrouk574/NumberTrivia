import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:number_trivia/core/network/network_info.dart';

class MockConnectionChecker extends Mock implements DataConnectionChecker {}

void main() {
  NetworkInfoImpl networkInfo;
  MockConnectionChecker mockConnectionChecker;

  setUp(() {
    mockConnectionChecker = MockConnectionChecker();
    networkInfo = NetworkInfoImpl(mockConnectionChecker);
  });

  group("Is Connected", () {
    test("Should forward the call to DataConnectionChecker.hasConnection",
            () async {

          final tHasConnection = Future.value(true);

          when(mockConnectionChecker.hasConnection).thenAnswer((_) => tHasConnection);

          final result =  networkInfo.isConnected;

          verify(mockConnectionChecker.hasConnection);

          expect(result, tHasConnection);
        });
  });
}
