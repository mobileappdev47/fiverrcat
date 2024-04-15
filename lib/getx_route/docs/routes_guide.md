
# route 작성 규칙
route 작성 규칙, 자세한 내용은 /docs/route_guide.md 파일을 참고 한다.  
1. widget(page) 이름과 동일하게 GetPage name, AppLinks variable을 지정 한다.(단, lowerCamelCase 사용)  
2. AppLinks variable의 값은 widget(page)이름과 동일하게 한다. (단, snake_case, lowercase_with_underscores 사용)  
3. authenticate가 필요한 page에는 AuthGuard를 middle ware로 추가 한다.   

참고: https://medium.com/@brianmwangi_dev/better-navigation-in-flutter-using-getx-ceeedd5c8f28  

# route 설명
- auth_guard 는 로그인 여부를 체크 하여 안했을시, 특정 페이지로 route하는 middleware 이다.
- route는 기본적으로 name을 기반으로 한다. 
- page 이동시 AppRoutes.moveToPage 를 이용하고 String으로 route name을 주면 이동 된다. 
    - 파라미터는 getOff, getOffAll 값이 있고, default는 false이다. 기본적으로  Get.toNamed로 동작 한다.
    - getOff를 true로 넘기면 Get.offNamed 로 동작 한다.
    - getOffAll을 true로 넘기면 Get.offAllNamed 로 동작 한다. 


# ToDo
1. args type의 parameter를 받을 수 있도록 하면 좋겠다. 또는 dict type의 parameter를 받을 수 있게 하자.

