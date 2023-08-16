class UrlSchemes {
  static String consumerKey = "ck_63e8bf762cf8d25df2743be9fab00259bf3580c7";
  static String consumerSecret = "cs_8209906138afdbfa910c47e03d56298d778f0f4a";
  static String loginToken="https://ebotzz.com/wp-json/jwt-auth/v1/token"; 
  // static String baseUrl = "https://superior-crane-app-538095824b6f.herokuapp.com";

  static String baseUrl(endpoint) {
    return "https://ebotzz.com/wp-json/wc/v3/$endpoint?consumer_key=$consumerKey&consumer_secret=$consumerSecret&per_page=50";
  }


}