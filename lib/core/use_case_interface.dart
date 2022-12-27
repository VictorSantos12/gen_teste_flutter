abstract class UseCaseInterface<Output> {
  Future<List<Output>> call();
}