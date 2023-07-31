class UrlSchemes {
  static String consumerKey = "ck_58abe2104deda40e03d214acb61b73277814349d";
  static String consumerSecret = "cs_e1f8a83f9a1b1c79936d64bfea60cb6a4ee50562";
  static String loginToken="https://ebotzz.com/wp-json/jwt-auth/v1/token"; 
  // static String baseUrl = "https://superior-crane-app-538095824b6f.herokuapp.com";

  static String baseUrl(endpoint) {
    return "https://ebotzz.com/wp-json/wc/v3/$endpoint?consumer_key=$consumerKey&consumer_secret=$consumerSecret&per_page=50";
  }


}