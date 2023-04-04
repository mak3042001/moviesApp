class ConstantApp{
  static const String baseUrl="https://api.themoviedb.org/3";
  static const String apiKey="0ff66932018537aeb7d73ef622210d41";
  static const String nowPlayingApi="$baseUrl/movie/now_playing?api_key=$apiKey";
  static const String popularApi="$baseUrl/movie/popular?api_key=$apiKey";
  static const String topRatedApi="$baseUrl/movie/top_rated?api_key=$apiKey";
  static const String baseImageUrl="https://image.tmdb.org/t/p/w500";
  static String imageUrl(String path){
    return "$baseImageUrl$path";
  }
  static String detailsApi(int moviesId){
    return "$baseUrl/movie/$moviesId?api_key=$apiKey";
  }
  static String recommendationApi(int moviesId){
    return "$baseUrl/movie/$moviesId/recommendations?api_key=$apiKey";
  }
}

//https://api.themoviedb.org/3/movie/980078?api_key=0ff66932018537aeb7d73ef622210d41