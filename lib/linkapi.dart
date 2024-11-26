class AppLink {
  static const String server = 'http://192.168.250.121/ecommerce/admin';
  static const String imagestatic = 'http://192.168.250.121/ecommerce/upload';

// =============================================================
  static const String imageCategories = "$imagestatic/categories";
  static const String imagesItems = "$imagestatic/items";
//
  static const String test = "$server/test.php";

  static const String notification =
      "$server/notification/notificationadmin.php";
  static const String notificationtousers =
      "$server/notification/sendnotificationtousers.php";

// ================================= Auth ========================== //

  static const String signUp = "$server/auth/signup.php";
  static const String login = "$server/auth/login.php";
  static const String verifycodessignup = "$server/auth/verfiycode.php";
  static const String resend = "$server/auth/resend.php";

// ================================= ForgetPassword ========================== //

  static const String checkEmail = "$server/forgetpassword/checkemail.php";
  static const String resetPassword =
      "$server/forgetpassword/resetpassword.php";
  static const String verifycodeforgetpassword =
      "$server/forgetpassword/verifycode.php";

// Home

  static const String homepage = "$server/home.php";
// categories
  static const String categories = "$server/categories/view.php";
  static const String editcategories = "$server/categories/edit.php";
  static const String addcategories = "$server/categories/add.php";
  static const String deletecategories = "$server/categories/delete.php";
  static const String searchitems = "$server/categories/search.php";

  // items
  static const String items = "$server/items/view.php";
  static const String edititems = "$server/items/edit.php";
  static const String activeitems = "$server/items/active.php";
  static const String additems = "$server/items/add.php";
  static const String deleteitems = "$server/items/delete.php";

// Favorite

  static const String favoriteAdd = "$server/favorite/add.php";
  static const String favoriteRemove = "$server/favorite/remove.php";
  static const String favoriteView = "$server/favorite/view.php";
  static const String deletefromfavroite =
      "$server/favorite/deletefromfavroite.php";

  // Cart
  static const String cartview = "$server/cart/view.php";
  static const String cartadd = "$server/cart/add.php";
  static const String cartdelete = "$server/cart/delete.php";
  static const String cartgetcountitems = "$server/cart/getcountitems.php";

  // delivery

  static const String deliveryView = "$server/mydelivery/view.php";
  static const String deliveryAdd = "$server/mydelivery/add.php";
  static const String deliveryEdit = "$server/mydelivery/edit.php";
  static const String deliveryDelete = "$server/mydelivery/delete.php";

  // Report

  static const String report = "$server/report/viewreport.php";

  // orders

  static const String ordersview = "$server/orders/view.php";
  static const String ordersarchive = "$server/orders/archive.php";
  static const String ordersdetails = "$server/orders/details.php";
  static const String ordersready = "$server/orders/prepare.php";
  static const String ordersapprove = "$server/orders/approve.php";
  static const String ordersreject = "$server/orders/reject.php";
  static const String ordersnotification =
      "$server/orders/notificationprepareadmin.php";
}
