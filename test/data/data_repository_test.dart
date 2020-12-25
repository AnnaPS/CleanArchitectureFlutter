import 'package:clean_architecture_app/data/models/episodes_page.dart';
import 'package:clean_architecture_app/data/repository/data_repository.dart';
import 'package:clean_architecture_app/data/repository/data_respository_impl.dart';
import 'package:clean_architecture_app/data/service/data_api_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockDataApiService extends Mock implements DataApiService {}

void main() {
  MockDataApiService mockDataApiService;
  DataRepository dataRepository;
  group('Data repository', () {
    setUp(() {
      mockDataApiService = MockDataApiService();
      dataRepository = DataRepositoryImpl(mockDataApiService);
    });

    test('should get episodes', () async {
      var info = Info(count: 1, pages: 1, next: '1', prev: null);
      var resultsEpisode = List.generate(
        3,
        (index) => Result(
            id: index,
            name: null,
            airDate: null,
            episode: null,
            characters: null,
            url: null,
            created: null),
      );
      var episodePage = EpisodePage(info: info, results: resultsEpisode);
      when(mockDataApiService.getEpisodePage())
          .thenAnswer((_) async => episodePage);

      final result = await dataRepository.getEpisodePage();
      expect(result, isA<EpisodePage>());
    });
  });
}
