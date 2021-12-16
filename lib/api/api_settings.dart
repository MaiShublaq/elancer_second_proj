import 'package:elancer_second_proj/models/product.dart';

class ApiSettings{

 static const _baseUrl='https://smart-store.mr-dev.tech/';
 static const _apiUrl= _baseUrl + 'api/';


 static const cities=_apiUrl+'cities';
 static const login=_apiUrl+'auth/login';
 static const register=_apiUrl+'auth/register';
 static const activate=_apiUrl+'auth/activate';
 static const forgetPassword=_apiUrl+'auth/forget-password';
 static const resetPassword=_apiUrl+'auth/reset-password';
 static const updateProfile=_apiUrl+'auth/update-profile';
 static const changePassword=_apiUrl+'auth/change-password';
 static const contactRequest=_apiUrl+'contact-requests';

 static const logout=_apiUrl+'auth/logout';
 static const home=_apiUrl+'home';
 static const categories=_apiUrl+'categories';
 static const subCategories=_apiUrl+'categories/{id}';
 static const product=_apiUrl+'sub-categories/{id}';
 static const favorites=_apiUrl+'favorite-products';
 static const productDetails=_apiUrl+'products/{id}';

 static const faqs=_apiUrl+'faqs';




}