-- ���̺� ����
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



-- PK �������� �߰�
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

ALTER TABLE ORDER_PRODUCT ADD CONSTRAINT PK_ORDER_PRODUCT PRIMARY KEY (
	order_product_no
);

ALTER TABLE ORDERS ADD CONSTRAINT PK_ORDER PRIMARY KEY (
	order_no
);


-- ��ĺ� �������� �߰�
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


-- ������ ����
CREATE SEQUENCE QnA_seq NOCYCLE;
CREATE SEQUENCE REPLY_seq NOCYCLE;
CREATE SEQUENCE PRODUCT_CATEGORY_seq NOCYCLE;
CREATE SEQUENCE PRODUCT_seq NOCYCLE;
CREATE SEQUENCE MEMBER_seq NOCYCLE;
CREATE SEQUENCE ORDERS_seq NOCYCLE;



-- category ���̺� �� �߰�
INSERT INTO product_category
values (product_category_seq.nextval
,'�Ҽ�');

INSERT INTO product_category
values (product_category_seq.nextval
,'������');



-- member ���̺� �� �߰�
INSERT INTO member
values (member_seq.nextval
,'admin01@email.coma'
,'admin01'
,'������'
,'����� ������'
,'010-5003-2442');

INSERT INTO member
values (member_seq.nextval
,'user01@email.coma'
,'user01'
,'�����'
,'����� ������'
,'010-1111-2222');
 select * from member;
INSERT INTO member
values (member_seq.nextval
,'user02@email.coma'
,'user02'
,'�����'
,'����� ������'
,'010-3333-4444');



-- qna ���̺� �� �߰�
INSERT INTO qna
VALUES (QnA_seq.NEXTVAL
,0
,'�ֹ�/����'
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
,'���'
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
,'�亯'
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
,'�ֹ�/����'
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
,'�ֹ�/����'
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
,'���'
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
,'�亯'
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
,'�ֹ�'
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



-- reply ���̺� �� �߰�
INSERT INTO reply
VALUES (reply_seq.NEXTVAL
,0
,'Sed ut perspiciatis, unde omnis iste natus error sit voluptatem accusantium doloremque laudantium'
,TO_DATE('2022/01/05', 'yy/mm/dd')
,1
,2);



-- product ���̺� �� �߰�
INSERT INTO PRODUCT
VALUES (PRODUCT_seq.NEXTVAL,
'�ɻ��ٶ��� ��鸰�ٸ� �ʴ� ��',
'����ȭ',
'��������',
'2022-04-11',
'���� ���״밡 �翡 �־ ���� �״밡 �׸��١� ���ܴ����� ������� ����� ������ ��ó�� �� ���� ��ó�� �ɡ����� ������ ������ ����� �޴� ����, ���� ���� ������ �˰� �ִ� �� �׶��� �˾Ҵ���须 ������϶� �ѹ��� ��ó���� ���� ��ó���� ������ì���� �á��� �� �д� ����� ������ ����ȭ ������ 10�� ���� ������ ���� �����̴�.',
12000,
99,
1,
'https://image.yes24.com/Goods/108590831/L'
);

INSERT INTO PRODUCT
VALUES (PRODUCT_seq.NEXTVAL,
'��å�ϱ� ���� ��',
'���ѱ�',
'���빮��',
'2022-02-25',
'÷���� �۰����� ����, ���� �ÿ� �Ҽ��� �����ϴ� ���� �����빮�С��� Ư�� ���� �����빮�� �� �ø���� ������ȩ ��° �Ҽ���, ���ѱ��� ����å�ϱ� ���� ������ �Ⱓ�Ǿ���. 2012�� �����빮�С����� ����� �̷� �� ���� ����Ҽ���, �� ���� �Ҽ���, �� ���� ����Ҽ��� �����ϸ�, �ѱ� ���п��� ���� ���������̰� ������ ���Ҽ��� �Ҽ����� �߽�ó��(������а� �ѿ���)�� �򰡹��� ���ѱ��� �̹� ������ 2021�� �����빮�С� 5��ȣ�� ��ǥ�� �Ҽ��� ����� ������ ���̴�. �������� ������ ã�� ����, ���� �¾ ù �������� ���� ȭ�ڰ� �װ����� �´ڶ߸� ����ġ ���� ������ �����ο� ������� �׷����� �Ҽ��̴�.',
11700,
99,
1,
'http://image.yes24.com/goods/107702435/XL'
);

INSERT INTO PRODUCT
VALUES (PRODUCT_seq.NEXTVAL,
'��� ���� ����޴´�',
'�ڱ���',
'��ħ��',
'2022-01-31',
'�ڱ����� ù ���� ����� ���� ����޴´١��� ��ħ�� ���� 23������ �Ⱓ�Ǿ���. 2022�� �Ѱ� ���Ṯ�� �� �ι��� ������ �ڱ��� ������ �� �������� ���� ������ �� �������� ������� ������ â�� Ȱ���� �̾���� �� ������ �غ��ؿԴ�. ���ϵ� 45���� �ô� �������μ� ���� ���⸦ ��ư��� ������ �������� ����� �׷�����. ���￡�� ���� �ڶ� ���� ������ ���� ���� ���̴� ������ ���� ������ �糭 ������ ���ÿ� �װ� ��ư���, ��¿ �� ���� ��Ȱ �����̴�. ���� �� �ִ� ������Դ� �����̰� ��� �� ���� ������Դ� �����Ǿ��� ��, ����. �׷��⿡ ������ �� �־� �Ҹ�ģ��. �װ��� ��� �ƹ��� ���� �ʴ� ���� ����� ��Ҹ��� �Ұ���������, �� �̷����� �� ��⸦ �ٶ�� ���̴�.',
9000,
99,
1,
'http://image.yes24.com/goods/107054459/XL'
);

INSERT INTO PRODUCT
VALUES (PRODUCT_seq.NEXTVAL,
'�޺� �ر�',
'������',
'â��',
'2022-02-18',
'2019�� ��ȭ�Ϻ� ���Ṯ���� ��ǰȰ���� ������ ������ ������ ù ���� ���޺� �ر⡻�� â��ü����� �Ⱓ�Ǿ���. ���� ���� ��� ���� ���ΰ� �ٹҾ��� ���� �̴��� ���� ��ȭ�� ������ �� ���踦 ������ ������ �̹� �������� ������� �� ������ �������� �и� ����(����, ��õ��)�� ������� ���� ���� �� ������ �ڸ��� �ѻ� �� �������� �Ѵ�. ��� �ֱ⿡ �ߵ��� �ϴ� ���ο� �����ɴ��� �츮���Դ� ���θ� �������� ���� ������ ������ ����Ϸ��� ������ �������� �����ԡ�(�����, �ؼ�)�� ü��� �������� ���ĸ��� �帣�� ���� ������ �ܴ��� �ٵ��. ���� �ϻ��� �� ����, ���޺� �ر⡻�� Ÿ���� �±⸦ ���� �ʱ� �ٶ�� ���� ���ϰ� ���� �������� ������ ������ ���̴�.',
8100,
99,
1,
'http://image.yes24.com/goods/107489763/XL'
);

INSERT INTO PRODUCT
VALUES (PRODUCT_seq.NEXTVAL,
'�ƹ�ư, �ǾƳ�',
'��ܿ�',
'��ö��',
'2022-03-31',
'��ſ��Դ� ������ �ص� ���� �� ������ �ֳ���?�� ���ƹ�ư �ø���� ���翩�� ��°�� ���� ������ �۰� ��ܿ��� ���ǾƳ롯��� ���ߴ�. ���ݱ��� �� ���� �ܵ� ������ �쳽 �۰��μ��� �ƴ϶� ��Ʃ�� ä�� ���ܿＭ���� ���, MBC ��������Ŭ������ ������ �� å�� �߽����� �پ��� Ȱ���� �̾���� ������, �װ� �� ���� �ٹ����� ��ǥ�� �̾�۶����Ͷ�� ����� �ƴ� �̴� �������� ���� �ʴ�. ������ å�� �Բ� ������ ��ܿ��� ���� ��õ�̰�, �� �߽ɿ��� �ǾƳ��� �ǱⰡ �ڸ��ϰ� �ִ�.',
10800,
99,
2,
'http://image.yes24.com/goods/108454817/XL'
);

INSERT INTO PRODUCT
VALUES (PRODUCT_seq.NEXTVAL,
'�� ���ϰ� �;, �� �� ��� �;',
'����',
'���ǽ�',
'2022-03-18',
'�� ���� �� �ְ�, �� �� �� �� ���� �� ���ٰ��� ����ġ ���� �÷ÿ� �������� �Ǵ� �������� �ִ�. �׷� ���� ��å�ϰ�, ������ ����ϸ� ���ʿ��� ������� ���� ������ �������� �Ұ� �Ǳ⵵ �Ѵ�. �� å�� ���� ���� ���� ���� 20�� ���� ������� ���� �̰߰� �����ް�, �ٽ� ��ư� ��⸦ ���� �۵��� ������ ��Ƴ� ������, ����ũ�� ù �����̴�.',
13500,
99,
2,
'http://image.yes24.com/goods/108202483/XL'
);

INSERT INTO PRODUCT
VALUES (PRODUCT_seq.NEXTVAL,
'������ ������',
'������',
'��ī(FIKA)',
'2022-01-27',
'�������� �����须�� ���ڴ� ���� � ������� �˾ƾ� ���� �޾Ƶ��̰� �Ͼ��� �� �ִٰ� ���մϴ�. ����� �ϴ� �Ϳ������� �����Ѵٰ��. �� å���� ���� �����ϴ�. ���� ������ ������. 1�Ⱓ �Ϸ翡 �ϳ��� ������ ���ϸ� ����� �������� �����顱�� ����س����ϴ�. �׷��� ���ݲ� ������ �� ����� �߰��ϰ� �˾ư��� ������. ������ ��ó�� ���� ����Ϸ��� ���� �����θ� ��� �����ϴ���, ������ �� �� ��̰�, ������ �η����ϴ���, �ٽ� ���� ���� � ������� �˾ƾ� �ϴϱ��.',
13300,
99,
2,
'http://image.yes24.com/goods/106338961/XL'
);

INSERT INTO PRODUCT
VALUES (PRODUCT_seq.NEXTVAL,
'������ �������� �ʴ´�',
'��� �з� ��/������ ��',
'������',
'2021-12-17',
'�������� �������� �ʴ´١��� ������ �Ŵ��� ���� �ӿ��� ��������(�׸��� �츮��) � �����ΰ����� ���� �츮�� ������ ����������� �����й��� ������ �׷�������. ����� �Ұ� ���� �����ٰ� ������ �� ���� �����̺�� ��ź �������� �쿬�� �˰� �� ���ڴ� �װ� ȥ���� �¼� �ο�� ���� ���� �η������� �ʴ� ����� ��Ȥ�Ǿ� ���� ���� �����س����� �����Ѵ�. ���� ���� �� ���迡�� ��ȥ���̶� ���׷� ���� �Ͼ�ٸ顯�� ������ ������ �ƴ϶� ������ �Ͼ�°����� �ñ��� �������̸�, ��� ������ �� ������ ���� �� ���ٰ� �����ؿԱ� �����̴�. ������ ������ �̾߱�� ���ڵ��� ���� �������� ���� ������ �̲���, ������ ��û�� ������� �츮�� ���� ��½ ���̰� �����.',
15300,
99,
2,
'http://image.yes24.com/goods/105526047/XL'
);

commit;