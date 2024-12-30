class GetPostsParams {
  final int page;
  final int limit;

  GetPostsParams({
    required this.page,
    required this.limit,
  });

  GetPostsParams copyWith({
    int? page,
    int? limit,
  }) {
    return GetPostsParams(
      page: page ?? this.page,
      limit: limit ?? this.limit,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_page': page,
      '_limit': limit,
    };
  }
}
