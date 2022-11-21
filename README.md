## 프로젝트 기획안

### 작성일 : 2022. 11. 14

#### 작성자 : 김유현

#### 프로젝트 명 : 옥션

***

##### 기획 의도

```
온라인 게임의 거래시스템에서 착안하여 유사한 거래 기능인 옥션 시스템을 구현하고자 함.
온라인 게임에 대한 개인적 선호도가 높아 쉽게 접근할 수 있었으므로
이에 대한 이해력을 바탕으로 기획하게 됨.
```

##### 벤치마킹

```
온라인 게임 메이플스토리의 옥션 시스템을 벤치마킹
웹사이트 아이템매니아의 ‘팝니다’ 기능 일부 벤치마킹
허나, 물품을 실제로 주고 받을 수는 없으므로 거래 사전계약 정도의 개념으로 정의
```

##### 주요 기능

```
- 판매자 위주의 거래 기능이 작동함.

1. 회원가입
    아이디, 비밀번호, 닉네임, 연락처

2. 로그인
    회원/관리자(admin) 로그인

3. 마이페이지(회원)
    그동안의 판매/구매 내역 확인
    현재 거래 현황 확인
    내 정보 수정 (비밀번호, 닉네임, 연락처 수정 가능)

4. 판매 물품 등록
    분류, 물품명, 판매자 정보, 흥정여부

5. 판매중인 물품 리스트 확인
    가장 최신으로 등록된 판매 물품이 최상단에 위치
    최저가격, 최고가격 순으로 정렬 가능

6. 거래 방법
    판매자의 물품 판매 게시글 등록
    구매자가 해당 게시글에서의 구매 요청 등록
    흥정 불가능 시 즉시 거래 진행
    흥정 가능 시 판매자 확인 후 거래 진행
       - 구매 요청 시 구매자가 흥정할 금액을 작성하여 요청을 보냄
       - 판매자 확인 후 해당 금액에 응답하면 거래 진행, 아니라면 거래 실패
       - 거래 실패 시 처음부터 다시 진행

7. 거래 완료 시
    거래 완료 시 해당 물품에 대한 구매 요청 불가능

8. 검색
    물품에 대한 상세정보 검색 가능
    분류별, 물품 이름, 가격범위 등으로 검색 가능
    검색 리스트 맨 앞/맨 끝 이동 가능

9. 관리자 기능
    판매물품/거래내역 강제 삭제
    특정 회원 판매/구매 정지, 특정 물품 거래 정지
    회원 삭제 
```
