abstract class AUseCase<Output> {
  Future<Map<dynamic, Output>> call();
}