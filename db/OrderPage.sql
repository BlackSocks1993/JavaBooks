DROP TABLE MEMBER;
DROP TABLE QnA;
DROP TABLE REPLY;
DROP TABLE PRODUCT_CATEGORY;
DROP TABLE PRODUCT;
DROP TABLE CART;
DROP TABLE ORDER_PRODUCT;
DROP TABLE ORDERS;

DROP SEQUENCE QnA_seq;
DROP SEQUENCE REPLY_seq;
DROP SEQUENCE PRODUCT_CATEGORY_seq;
DROP SEQUENCE PRODUCT_seq;
DROP SEQUENCE MEMBER_seq;
DROP SEQUENCE ORDERS_seq;


-- 테이블 생성
CREATE TABLE MEMBER (
	member_no	NUMBER(12)		NOT NULL,
	member_email	VARCHAR(45)		NOT NULL,
	member_pw	VARCHAR(45)		NOT NULL,
	member_name	VARCHAR(10)		NOT NULL,
	member_add	VARCHAR(255)		NOT NULL,
	member_phone	VARCHAR(20)		NOT NULL
);

CREATE TABLE QnA (
	qna_no	NUMBER(12)		NOT NULL,
	qna_parent_no	NUMBER(12)	DEFAULT 0	NOT NULL,
	qna_type	VARCHAR(45)		NOT NULL,
	qna_title	VARCHAR(45)		NOT NULL,
	qna_content	LONG		NULL,
	qna_date	DATE		NOT NULL,
	qna_views	NUMBER(12)	DEFAULT 0	NOT NULL,
	member_no	NUMBER(12)		NOT NULL
);

CREATE TABLE REPLY (
	reply_no	NUMBER(12)		NOT NULL,
	reply_parent_no	NUMBER(12)	DEFAULT 0	NOT NULL,
	reply_content	VARCHAR(500)		NULL,
	reply_date	DATE		NOT NULL,
	qna_no	NUMBER(12)		NOT NULL,
    member_no	NUMBER(12)		NOT NULL
);

CREATE TABLE PRODUCT_CATEGORY (
	product_category_no	NUMBER(12)		NOT NULL,
	product_category_name	VARCHAR(45)		NOT NULL
);

CREATE TABLE PRODUCT (
    product_no        NUMBER(12)     NOT NULL,
    product_name      VARCHAR(100)   NOT NULL,
    product_author    VARCHAR(100)   NOT NULL,
    product_publisher VARCHAR(100)   NOT NULL,
    product_date      DATE           NOT NULL,
    product_detail    VARCHAR(2550)  NULL,
    product_price     NUMBER(20)     NOT NULL,
    product_stock     NUMBER(12)     NOT NULL,
    product_category_no NUMBER(12)   NOT NULL,
    product_img       VARCHAR(255)   NULL
);

CREATE TABLE CART (
	member_no	NUMBER(12)		NOT NULL,
	cart_amount	NUMBER(5)		NOT NULL,
	product_no	NUMBER(12)		NOT NULL
);

CREATE TABLE ORDER_PRODUCT (
	order_product_quantity	NUMBER(5)		NOT NULL,
	order_no	NUMBER(12)		NOT NULL,
	product_no	NUMBER(12)		NOT NULL,
    	total_price NUMBER(20)      NOT NULL,
    	product_name      VARCHAR(100)   NOT NULL,
    	product_img VARCHAR(255)   NULL
	
);

CREATE TABLE ORDERS (
	order_no	NUMBER(12)		NOT NULL,
	order_date	DATE		    NOT NULL,
    	order_addr  VARCHAR(255)    NOT NULL,
    	order_memo  VARCHAR(500)    NULL,
	member_no	NUMBER(12)		NOT NULL,
    	order_name  VARCHAR(10)		NOT NULL,
    	order_phone  VARCHAR(20)	NOT NULL,
    	order_final_price  NUMBER(20)	NOT NULL
);



-- PK 제약조건 추가
ALTER TABLE QnA ADD CONSTRAINT PK_QNA PRIMARY KEY (
	qna_no
);

ALTER TABLE MEMBER ADD CONSTRAINT PK_MEMBER PRIMARY KEY (
	member_no
);

ALTER TABLE REPLY ADD CONSTRAINT PK_REPLY PRIMARY KEY (
	reply_no
);

ALTER TABLE PRODUCT_CATEGORY ADD CONSTRAINT PK_PRODUCT_CATEGORY PRIMARY KEY (
	product_category_no
);

ALTER TABLE PRODUCT ADD CONSTRAINT PK_PRODUCT PRIMARY KEY (
	product_no
);

ALTER TABLE CART ADD CONSTRAINT PK_CART PRIMARY KEY (
	member_no
);

ALTER TABLE ORDER_PRODUCT ADD CONSTRAINT PK_ORDER_PRODUCT PRIMARY KEY (
	order_product_no
);

ALTER TABLE ORDERS ADD CONSTRAINT PK_ORDER PRIMARY KEY (
	order_no
);


-- 비식별 제약조건 추가
ALTER TABLE QnA ADD CONSTRAINT FK_MEMBER_TO_QnA_1 FOREIGN KEY (
	member_no
)
REFERENCES MEMBER (
	member_no
);

ALTER TABLE REPLY ADD CONSTRAINT FK_QnA_TO_REPLY_1 FOREIGN KEY (
	qna_no
)
REFERENCES QnA (
	qna_no
);

ALTER TABLE REPLY ADD CONSTRAINT FK_MEMBER_TO_REPLY_1 FOREIGN KEY (
	member_no
)
REFERENCES MEMBER (
	member_no
);


-- 시퀀스 생성
CREATE SEQUENCE QnA_seq NOCYCLE;
CREATE SEQUENCE REPLY_seq NOCYCLE;
CREATE SEQUENCE PRODUCT_CATEGORY_seq NOCYCLE;
CREATE SEQUENCE PRODUCT_seq NOCYCLE;
CREATE SEQUENCE MEMBER_seq NOCYCLE;
CREATE SEQUENCE ORDERS_seq NOCYCLE;



-- category 테이블 값 추가
INSERT INTO product_category
values (product_category_seq.nextval
,'소설');

INSERT INTO product_category
values (product_category_seq.nextval
,'에세이');



-- member 테이블 값 추가
INSERT INTO member
values (member_seq.nextval
,'admin01@email.coma'
,'admin01'
,'관리자'
,'서울시 강동구'
,'010-5003-2442');

INSERT INTO member
values (member_seq.nextval
,'user01@email.coma'
,'user01'
,'사용자'
,'서울시 강남구'
,'010-1111-2222');
 select * from member;
INSERT INTO member
values (member_seq.nextval
,'user02@email.coma'
,'user02'
,'사용자'
,'서울시 강서구'
,'010-3333-4444');



-- qna 테이블 값 추가
INSERT INTO qna
VALUES (QnA_seq.NEXTVAL
,0
,'주문/결제'
,'Lorem ipsum dolor sit amet'
,'<p>Sed ut perspiciatis, unde omnis iste natus error sit voluptatem accusantium doloremque laudantium,</p>
<p>totam rem aperiam eaque ipsa, quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt,</p>
<p>explicabo. Nemo enim ipsam voluptatem, quia voluptas sit, aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos,</p>
<p>qui ratione voluptatem sequi nesciunt, neque porro quisquam est, qui dolorem ipsum, quia dolor sit, amet, consectetur,</p>
<p>adipisci velit, sed quia non numquam eius modi tempora incidunt, ut labore et dolore magnam aliquam quaerat voluptatem.</p>'
,TO_DATE('2022/01/01', 'yy/mm/dd')
,10
,1
);

INSERT INTO qna
VALUES (QnA_seq.NEXTVAL
,0
,'배송'
,'Lorem ipsum dolor sit amet'
,'<p>Sed ut perspiciatis, unde omnis iste natus error sit voluptatem accusantium doloremque laudantium,</p>
<p>totam rem aperiam eaque ipsa, quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt,</p>
<p>explicabo. Nemo enim ipsam voluptatem, quia voluptas sit, aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos,</p>
<p>qui ratione voluptatem sequi nesciunt, neque porro quisquam est, qui dolorem ipsum, quia dolor sit, amet, consectetur,</p>
<p>adipisci velit, sed quia non numquam eius modi tempora incidunt, ut labore et dolore magnam aliquam quaerat voluptatem.</p>'
,TO_DATE('2022/01/02', 'yy/mm/dd')
,5
,2
);

INSERT INTO qna
VALUES (QnA_seq.NEXTVAL
,1
,'답변'
,'Lorem ipsum dolor sit amet'
,'<p>Sed ut perspiciatis, unde omnis iste natus error sit voluptatem accusantium doloremque laudantium,</p>
<p>totam rem aperiam eaque ipsa, quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt,</p>
<p>explicabo. Nemo enim ipsam voluptatem, quia voluptas sit, aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos,</p>
<p>qui ratione voluptatem sequi nesciunt, neque porro quisquam est, qui dolorem ipsum, quia dolor sit, amet, consectetur,</p>
<p>adipisci velit, sed quia non numquam eius modi tempora incidunt, ut labore et dolore magnam aliquam quaerat voluptatem.</p>'
,TO_DATE('2022/01/02', 'yy/mm/dd')
,1
,3
);

INSERT INTO qna
VALUES (QnA_seq.NEXTVAL
,0
,'주문/결제'
,'Lorem ipsum dolor sit amet'
,'<p>Sed ut perspiciatis, unde omnis iste natus error sit voluptatem accusantium doloremque laudantium,</p>
<p>totam rem aperiam eaque ipsa, quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt,</p>
<p>explicabo. Nemo enim ipsam voluptatem, quia voluptas sit, aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos,</p>
<p>qui ratione voluptatem sequi nesciunt, neque porro quisquam est, qui dolorem ipsum, quia dolor sit, amet, consectetur,</p>
<p>adipisci velit, sed quia non numquam eius modi tempora incidunt, ut labore et dolore magnam aliquam quaerat voluptatem.</p>'
,TO_DATE('2022/01/03', 'yy/mm/dd')
,5
,1
);

INSERT INTO qna
VALUES (QnA_seq.NEXTVAL
,0
,'주문/결제'
,'Lorem ipsum dolor sit amet'
,'<p>Sed ut perspiciatis, unde omnis iste natus error sit voluptatem accusantium doloremque laudantium,</p>
<p>totam rem aperiam eaque ipsa, quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt,</p>
<p>explicabo. Nemo enim ipsam voluptatem, quia voluptas sit, aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos,</p>
<p>qui ratione voluptatem sequi nesciunt, neque porro quisquam est, qui dolorem ipsum, quia dolor sit, amet, consectetur,</p>
<p>adipisci velit, sed quia non numquam eius modi tempora incidunt, ut labore et dolore magnam aliquam quaerat voluptatem.</p>'
,TO_DATE('2022/01/04', 'yy/mm/dd')
,100
,1
);

INSERT INTO qna
VALUES (QnA_seq.NEXTVAL
,0
,'배송'
,'Lorem ipsum dolor sit amet'
,'<p>Sed ut perspiciatis, unde omnis iste natus error sit voluptatem accusantium doloremque laudantium,</p>
<p>totam rem aperiam eaque ipsa, quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt,</p>
<p>explicabo. Nemo enim ipsam voluptatem, quia voluptas sit, aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos,</p>
<p>qui ratione voluptatem sequi nesciunt, neque porro quisquam est, qui dolorem ipsum, quia dolor sit, amet, consectetur,</p>
<p>adipisci velit, sed quia non numquam eius modi tempora incidunt, ut labore et dolore magnam aliquam quaerat voluptatem.</p>'
,TO_DATE('2022/01/05', 'yy/mm/dd')
,50
,2
);

INSERT INTO qna
VALUES (QnA_seq.NEXTVAL
,7
,'답변'
,'Lorem ipsum dolor sit amet'
,'<p>Sed ut perspiciatis, unde omnis iste natus error sit voluptatem accusantium doloremque laudantium,</p>
<p>totam rem aperiam eaque ipsa, quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt,</p>
<p>explicabo. Nemo enim ipsam voluptatem, quia voluptas sit, aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos,</p>
<p>qui ratione voluptatem sequi nesciunt, neque porro quisquam est, qui dolorem ipsum, quia dolor sit, amet, consectetur,</p>
<p>adipisci velit, sed quia non numquam eius modi tempora incidunt, ut labore et dolore magnam aliquam quaerat voluptatem.</p>'
,TO_DATE('2022/01/06', 'yy/mm/dd')
,3
,3
);

INSERT INTO qna
VALUES (QnA_seq.NEXTVAL
,0
,'주문'
,'Lorem ipsum dolor sit amet'
,'<p>Sed ut perspiciatis, unde omnis iste natus error sit voluptatem accusantium doloremque laudantium,</p>
<p>totam rem aperiam eaque ipsa, quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt,</p>
<p>explicabo. Nemo enim ipsam voluptatem, quia voluptas sit, aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos,</p>
<p>qui ratione voluptatem sequi nesciunt, neque porro quisquam est, qui dolorem ipsum, quia dolor sit, amet, consectetur,</p>
<p>adipisci velit, sed quia non numquam eius modi tempora incidunt, ut labore et dolore magnam aliquam quaerat voluptatem.</p>'
,TO_DATE('2022/01/07', 'yy/mm/dd')
,3
,2
);



-- reply 테이블 값 추가
INSERT INTO reply
VALUES (reply_seq.NEXTVAL
,0
,'Sed ut perspiciatis, unde omnis iste natus error sit voluptatem accusantium doloremque laudantium'
,TO_DATE('2022/01/05', 'yy/mm/dd')
,1
,2);



-- product 테이블 값 추가
INSERT INTO PRODUCT
VALUES (PRODUCT_seq.NEXTVAL,
'꽃샘바람에 흔들린다면 너는 꽃',
'류시화',
'수오서재',
'2022-04-11',
'시집 『그대가 곁에 있어도 나는 그대가 그립다』 『외눈박이 물고기의 사랑』 『나의 상처는 돌 너의 상처는 꽃』으로 수많은 독자의 사랑을 받는 한편, 엮은 시집 『지금 알고 있는 걸 그때도 알았더라면』 『사랑하라 한번도 상처받지 않은 것처럼』 『마음챙김의 시』로 시 읽는 기쁨을 전파한 류시화 시인이 10년 만에 내놓는 신작 시집이다.',
12000,
99,
1,
'https://image.yes24.com/Goods/108590831/L'
);

INSERT INTO PRODUCT
VALUES (PRODUCT_seq.NEXTVAL,
'산책하기 좋은 날',
'오한기',
'현대문학',
'2022-02-25',
'첨예한 작가들을 선정, 신작 시와 소설을 수록하는 월간 『현대문학』의 특집 지면 〈현대문학 핀 시리즈〉의 서른아홉 번째 소설선, 오한기의 『산책하기 좋은 날』이 출간되었다. 2012년 『현대문학』으로 등단한 이래 세 권의 장편소설과, 한 권의 소설집, 한 권의 중편소설을 상자하며, 한국 문학에서 가장 “적극적이고 끈질긴 ‘소설가 소설’의 발신처”(문학평론가 한영인)라 평가받은 오한기의 이번 신작은 2021년 『현대문학』 5월호에 발표한 소설을 퇴고해 내놓은 것이다. ‘나’의 내면을 찾기 위해, 내가 태어난 첫 공간으로 향한 화자가 그곳에서 맞닥뜨린 예상치 못한 날들이 자유로운 발자취로 그려지는 소설이다.',
11700,
99,
1,
'http://image.yes24.com/goods/107702435/XL'
);

INSERT INTO PRODUCT
VALUES (PRODUCT_seq.NEXTVAL,
'모든 나는 사랑받는다',
'박규현',
'아침달',
'2022-01-31',
'박규현의 첫 시집 『모든 나는 사랑받는다』가 아침달 시집 23번으로 출간되었다. 2022년 한경 신춘문예 시 부문을 수상한 박규현 시인은 그 이전부터 독립 문예지 및 독자적인 방식으로 꾸준히 창작 활동을 이어오며 본 시집을 준비해왔다. 수록된 45편의 시는 여성으로서 지금 여기를 살아가는 고통을 감각적인 장면들로 그려낸다. 서울에서 나고 자란 여성 시인의 눈을 통해 보이는 서울은 죽음 가득한 재난 현장인 동시에 그가 살아가는, 어쩔 수 없는 생활 공간이다. 떠날 수 있는 사람에게는 낙원이고 벗어날 수 없는 사람에게는 디스토피아인 곳, 서울. 그렇기에 시인은 힘 주어 소리친다. 그것이 비록 아무도 듣지 않는 듯한 사람의 목소리에 불과할지언정, 저 미래에라도 가 닿기를 바라며 말이다.',
9000,
99,
1,
'http://image.yes24.com/goods/107054459/XL'
);

INSERT INTO PRODUCT
VALUES (PRODUCT_seq.NEXTVAL,
'햇볕 쬐기',
'조온윤',
'창비',
'2022-02-18',
'2019년 문화일보 신춘문예로 작품활동을 시작한 조온윤 시인의 첫 시집 『햇볕 쬐기』가 창비시선으로 출간되었다. 삶을 향한 사려 깊은 연민과 꾸밈없어 더욱 미더운 언어로 온화한 서정의 시 세계를 보여온 시인은 이번 시집에서 “어둠을 빛 쪽으로 악착같이 밀며 가”(안희연, 추천사)는 시편들을 통해 세계 속 선함의 자리를 한뼘 더 넓히고자 한다. 살아 있기에 견뎌야 하는 괴로움에 주저앉더라도 우리에게는 서로를 일으켜줄 손이 있음을 끝까지 기억하려는 시인의 “지극한 선량함”(나희덕, 해설)은 체념과 위악으로 가파르게 흐르기 쉬운 마음을 단단히 붙든다. 고립이 일상이 된 지금, 『햇볕 쬐기』는 타인의 온기를 잊지 않길 바라는 가장 순하고 정한 진심으로 내놓은 시집일 것이다.',
8100,
99,
1,
'http://image.yes24.com/goods/107489763/XL'
);

INSERT INTO PRODUCT
VALUES (PRODUCT_seq.NEXTVAL,
'아무튼, 피아노',
'김겨울',
'제철소',
'2022-03-31',
'당신에게는 생각만 해도 좋은 한 가지가 있나요?” ‘아무튼 시리즈’가 마흔여덟 번째로 던진 물음에 작가 김겨울은 ‘피아노’라고 답했다. 지금까지 네 권의 단독 저서를 펴낸 작가로서뿐 아니라 유튜브 채널 ‘겨울서점’ 운영자, MBC ‘라디오북클럽’의 디제이 등 책을 중심으로 다양한 활동을 이어나가고 있지만, 그가 몇 장의 앨범까지 발표한 싱어송라이터라는 사실을 아는 이는 생각보다 많지 않다. 음악은 책과 함께 지금의 김겨울을 만든 원천이고, 그 중심에는 피아노라는 악기가 자리하고 있다.',
10800,
99,
2,
'http://image.yes24.com/goods/108454817/XL'
);

INSERT INTO PRODUCT
VALUES (PRODUCT_seq.NEXTVAL,
'더 잘하고 싶어서, 더 잘 살고 싶어서',
'양경민',
'빅피시',
'2022-03-18',
'더 잘할 수 있고, 더 잘 살 수 있을 것 같다가도 예상치 못한 시련에 무너지게 되는 순간들이 있다. 그럴 때면 자책하고, 가끔은 방관하며 불필요한 감정들로 가장 소중한 ‘나’를 잃게 되기도 한다. 이 책은 그의 글을 먼저 읽은 20만 명의 사람들이 가장 뜨겁게 감동받고, 다시 살아갈 용기를 얻은 글들을 오롯이 담아낸 것으로, 글토크의 첫 에세이다.',
13500,
99,
2,
'http://image.yes24.com/goods/108202483/XL'
);

INSERT INTO PRODUCT
VALUES (PRODUCT_seq.NEXTVAL,
'나만의 순간들',
'김현경',
'피카(FIKA)',
'2022-01-27',
'『나만의 순간들』의 저자는 내가 어떤 사람인지 알아야 나를 받아들이고 믿어줄 수 있다고 말합니다. 사랑은 믿는 것에서부터 시작한다고요. 이 책에는 답이 없습니다. 오직 질문만 있지요. 1년간 하루에 하나씩 질문에 답하며 당신은 “나만의 순간들”을 기록해나갑니다. 그렇게 지금껏 몰랐던 내 모습을 발견하고 알아가는 거지요. 저자의 말처럼 나를 사랑하려면 먼저 스스로를 어떻게 생각하는지, 무엇을 할 때 즐겁고, 무엇을 두려워하는지, 다시 말해 나는 어떤 사람인지 알아야 하니까요.',
13300,
99,
2,
'http://image.yes24.com/goods/106338961/XL'
);

INSERT INTO PRODUCT
VALUES (PRODUCT_seq.NEXTVAL,
'물고기는 존재하지 않는다',
'룰루 밀러 저/정지인 역',
'곰출판',
'2021-12-17',
'《물고기는 존재하지 않는다》는 세계라는 거대한 구조 속에서 ‘물고기는(그리고 우리는) 어떤 존재인가’에 관해 우리의 관념을 뒤집어엎으며 자유분방한 여정을 그려나간다. 사랑을 잃고 삶이 끝났다고 생각한 그 순간 ‘데이비드 스탄 조던’을 우연히 알게 된 저자는 그가 혼돈에 맞서 싸우는 것을 전혀 두려워하지 않는 모습에 매혹되어 그의 삶을 추적해나가기 시작한다. 저자 역시 이 세계에서 “혼돈이란 ‘그런 일이 일어난다면’의 가정의 문제가 아니라 ‘언제 일어나는가’의 시기의 문제”이며, 어느 누구도 이 진리를 피할 수 없다고 생각해왔기 때문이다. 하지만 조던의 이야기는 독자들을 전혀 예상하지 못한 곳으로 이끌며, 이윽고 엄청난 충격으로 우리의 눈을 번쩍 뜨이게 만든다.',
15300,
99,
2,
'http://image.yes24.com/goods/105526047/XL'
);

commit;
