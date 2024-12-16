# for_dayeon

다연이에게 크리스마스 선물로 간단한 게시판 앱을 만들어 주려고 만든 앱. (근데 좋아할까? 쥬륵)

## 요구사항

---
### 기획
- 기한
  - 12월 16일 ~ 12월 23일 (퇴근 후 1 or 2시간 작업)
- 목표
  - 간단한 CRUD가 가능한 앱.
  - 사진은 파이어베이스, 영상은 youtube 영상 형태로 사용하여 노출
- [ ] 기능 요구사항
  - [ ] 게시판 기능
  - [ ] 이미지 리스트 보여주기
    - [ ] 동영상은 추가적
  - [ ] 프로필
  - [ ] 몇일 인지 보여주기
---

### 디자인
- 인스타그램 및 에브리타임 등의 SNS, 게시판 참고
- 별도의 피그마 작업은 수행 x

---
### Front-End
- 상태 관리
  - Riverpod 학습 및 적용
- 디자인 패턴
  -  MVVM 패턴 

- 클린 아키텍처 적용
  - data
    - data_sources
    - models
    - repository_imps
  - domain
    - repositories
    - entities
    - use_cases
  - presentation
    - view_models
    - pages
    - widgets

---
### Back-End
- Firebase 사용
- RDBMS
  - id로 조인하는 형태로 구현하자. (추후 스프링부트로 마이그레이션)


---
## 기능 목록

---

### Font-End
- [ ] 홈 화면
- [ ] 게시판 메인 화면
- [ ] 게시판 추가 화면

### Back-End

---
#### 모델
- [ ] User
  - [ ] id : String
  - [ ] name : String
- [ ] Board
  - [ ] id : String
  - [ ] userId : String
  - [ ] title : String
  - [ ] content : String
  - [ ] imageUrl : String
  - [ ] videoUrl : String
  - [ ] createdAt : DateTime
  - [ ] updatedAt : DateTime
  - [ ] deletedAt : DateTime

---
#### 조인 
- 사용자 - 게시판 1대 다 관계
  - 유저가 일단 두명...

---

#### 백엔드 기능 목록
- [ ] 환경 세팅
  - [ ] 파이어베이스 연동
  
- [ ] 게시판
  - [ ] 게시판 create
  - [ ] 게시판 read
  - [ ] 게시판 update
  - [ ] 게시판 delete