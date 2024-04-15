<style>
img[src*="#thumbnail"] {
   width:150px;
   height:100px;
}
img[title="thumbnail"] {
   width:200px;
}
img[alt$="-thumbnail"]{
    width:300px;
}
    </style>

# drawer 메뉴
drawer 메뉴는 bottom navigation bar 처럼 indexed stack으로 구성 한다. 
하지만 특정 페이지에서 제한적으로만 사용할 목적이라면 indexed stack은 과하다.

그래서 나는 최종 페이지의 Scaffold에 drawer를 추가하고, 해당 페이지에서만 뜨는 drawer를 구성 했다. 

drawer.dart에는 두개의 widget이 있다.
HomeDrawer가 HomeDraser2를 감싸고 있는 모양으로 구성 햇다.
sizedbox 사용을 위해서 이렇게 구성 했다. 

drawer의 menu button은 appBar의 predefined widget이므로 leading 위젯에 자동으로 적용된다.
다만 이 경우는 menu button 주위로 extra padding이 많이 먹어서 버튼 위치가 어색 하다. 
이를 방지 하기 위해 appBar의 automaticallyImplyLeading:false , leadingWidth:28 을 지정 했다. 
이를 통해 extra padding은 없앴지만, predefined onpress event도 사라지게 되었다.이를 따로 구현 해줘야 한다. 
drawer open 이벤트를 구현하기 위해 scaffold global key가 필요 하다.  

# install guide 
drawer를 사용하기 위해서는 global key를 지정 해야 한다. 
1. state class에 globalkey 추가
    <pre><code>final scaffoldKey = GlobalKey<ScaffoldState>(); </code></pre>
2. scaffold에 key 추가
    <pre><code>return Scaffold(
      key: scaffoldKey,
      .
      .</code></pre>
3. appbar에 leading 추가(선택)  
    leading을 주지 않으면 pre defined menu icon으로 자동 나옴.  
    이 경우는 scaffoldKey도 필요 없다. openDrawer() event도 자동 구현됨  
    leading을 자신의 스타일로 주고 싶을때만 아래 코드를 이용하자.
    ```
    appBar: Appbar(
        titleStr: 'Home',
        leading: Container(
          child: IconButton(
            padding: EdgeInsets.only(left:0),
            icon: Icon(Icons.menu),
            onPressed: () => scaffoldKey.currentState!.openDrawer(),
          ),
        ),
        .
        .
        .
    ```

# 주의 사항
많은 연구를 한 widget은 아니다. 
가져다 쓸때 잘 살펴보고 쓰자..


# history
1. 2021-09-06 jh create