class UrlSchemes {
  static String consumerKey = "ck_58abe2104deda40e03d214acb61b73277814349d";
  static String consumerSecret = "cs_e1f8a83f9a1b1c79936d64bfea60cb6a4ee50562";
  // static String baseUrl = "https://superior-crane-app-538095824b6f.herokuapp.com";

  static String baseUrl(endpoint) {
    return "https://ebotzz.com/wp-json/wc/v3/$endpoint?consumer_key=$consumerKey&consumer_secret=$consumerSecret";
  }

  // static String signUp = "/register";
  // static String login = "/login";
  // static String forgetPassword = "/forgetpassword";
  // static String sendOTP = "/otp/send";
  // static String verifyOTP = "/otp/verify";
  // static String transportTicketPost = "/trans";
  // static String riggerTicketPost = "/ticket";
  // static String payDutyForm = "/payduty";
  // static String generatePDF = "/pdf";
  // static String sendPDFToEmail = "/sendemail";
  // static String jobDate = "/jobdate";
  // static String allJobs = "/jobs";


// static String login(phone, pass) {
//   return "/login?phone_number=$phone&password=$pass";
// }
//
// static String usersList = "/user_list";
//
// static String verifyOtp = "/verifyotp";
//
// static String sendOtp(phoneNumber) {
//   return "/signup?phone_number=0$phoneNumber";
// }
//
// static String admittedPatients(conHmisId) {
//   return '/admit-patient?con_hmis_id=$conHmisId';
// }
//
// static String opdPatients(conHmisId) {
//   return '/opd-patient?con_hmis_id=$conHmisId';
// }
//
// static String ipdLabsBymr(mr) {
//   return '/ipd-labs-bymr?mr=$mr';
// }
//
// static String opdLabsBymr(mr) {
//   return '/opd-labs-bymr?mr=$mr';
// }
//
// static String allRadioBymr(mr) {
//   return '/all-radio-bymr?mr=$mr';
// }
//
// static String myEndoscopy(conHmisId) {
//   return '/my-endoscopy?con_hmis_id=$conHmisId';
// }
//
// static String patientVisits(mr) {
//   return '/patient-visits?mr=$mr';
// }
//
// static String myOpdAppointments = "/my-opd-appoint";
//
// static String ERvisits(mr) {
//   return '/er-visits?mr=$mr';
// }
//
// static String IPDVisits(mr) {
//   return '/ipd-visits?mr=$mr';
// }
//
// static String opdvisits(mr) {
//   return '/opd-visits?mr=$mr';
// }
//
// static String patientdetail(mr) {
//   return '/patient-detail?mr=$mr';
// }
//
// static String opdnotes(mr) {
//   return '/opd-notes?mr=$mr';
// }
}