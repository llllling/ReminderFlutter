# remainder_flutter

A new Flutter project.

[online documentation](https://docs.flutter.dev/)

# 상태관리
* provider로 선정했다 ! 공식문서에 추천한다고 하네, Bloc패턴을 provider로 구현해보장 !!

# Naming Convention
- 폴더명은 복수, 파일명은 단수로.
- 폴더명 camelCase
- 파일명 widget포함 : PascalCase, 그 외 : camelCase
- 클래스명 PascalCase
- 변수명,함수명 camelCase
- 변수명 20자 안넘어가게, 넘어갈 경우 약어(알파벳 자음으로 축약)

# 폴더 구분
* asset : fonts, image, logo등 
* lib 
    * pages : 화면 UI, 화면 전반 담당
    * widgets : 화면을 구성하는 widgets 모임. 화면의 부분부분, 재사용되는 UI들 
    * utils 
    * providers : provider과 관련된 클래스들 ! 즉, 비즈니스 로직
    * models : 데이터베이스와 데이터를 주고받기 위한 데이터 model들 
    * services : 앱 외부의 다른 서비스 연결하는 부분! 
