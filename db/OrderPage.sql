--DROP TABLE member;

-- ȸ�� ���̺� ����
CREATE TABLE member (
	member_no	NUMBER(12)		NOT NULL,
	member_email	VARCHAR(45)		NOT NULL,
	member_pw	VARCHAR(45)		NOT NULL,
	member_name	VARCHAR(10)		NOT NULL,
	member_add	VARCHAR(255)		NOT NULL,
	member_phone	VARCHAR(20)		NOT NULL
);

--DROP TABLE product_category;

-- ī�װ� ���̺� ����
CREATE TABLE product_category (
	product_category_no	NUMBER(12)		NOT NULL,
	product_category_name	VARCHAR(45)		NOT NULL
);

--��ǰ ���̺� ����, db���� insert
create table PRODUCT (
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

ALTER TABLE PRODUCT ADD CONSTRAINT PK_PRODUCT PRIMARY KEY (
	product_no
);


--drop sequence PRODUCT_seq;

-- ��ǰ��ȣ ������ ����
CREATE SEQUENCE PRODUCT_seq NOCYCLE;

-- ��ǰ DB������ �߰�
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


--DROP TABLE cart;

-- ��ٱ��� ���̺� ����
CREATE TABLE cart (
	member_no	NUMBER(12)		NOT NULL,
	cart_amount	NUMBER(5)		NOT NULL,
	product_no	NUMBER(12)		NOT NULL
);

--DROP TABLE order_product;

-- �ֹ���ǰ ���̺� ����
CREATE TABLE order_product (
	order_product_no	NUMBER(12)		NOT NULL,
	order_product_quantity	NUMBER(5)		NOT NULL,
	order_no	NUMBER(12)		NOT NULL,
	product_no	NUMBER(12)		NOT NULL
);

--DROP TABLE qna;

-- QnA ���̺� ����
CREATE TABLE qna (
	qna_no	NUMBER(12)		NOT NULL,
	qna_parent_no	NUMBER(12)		NOT NULL,
	member_no	NUMBER(10)		NOT NULL,
	qna_div	VARCHAR(255)		NOT NULL,
	qna_title	VARCHAR(45)		NOT NULL,
	qna_con	LONG		NULL,
	qna_date	DATE		NOT NULL,
	qna_readcount	NUMBER(5)		NULL
);


--DROP TABLE qna_reply;

-- QnA ���̺� ��� ����
CREATE TABLE qna_reply (
	qna_reply_no	NUMBER(12)		NOT NULL,
	parent_no	NUMBER(12)		NOT NULL,
	qna_no	NUMBER(12)		NOT NULL,
	qna_reply_date	DATE		NOT NULL,
	qnd_reply_con	VARCHAR(500)		NULL
);

--DROP TABLE orders;


-- �ֹ� ���̺� ����
CREATE TABLE orders (
	order_no	NUMBER(12)		NOT NULL,
	order_date	DATE		    NOT NULL,
    order_addr  VARCHAR(255)    NOT NULL,
    order_memo  VARCHAR(500)    NULL,
	member_no	NUMBER(12)		NOT NULL
);

ALTER TABLE member ADD CONSTRAINT PK_MEMBER PRIMARY KEY (
	member_no
);

ALTER TABLE product_category ADD CONSTRAINT PK_PRODUCT_CATEGORY PRIMARY KEY (
	product_category_no
);

ALTER TABLE product ADD CONSTRAINT PK_PRODUCT PRIMARY KEY (
	product_no
);

ALTER TABLE cart ADD CONSTRAINT PK_CART PRIMARY KEY (
	member_no
);

ALTER TABLE order_product ADD CONSTRAINT PK_ORDER_PRODUCT PRIMARY KEY (
	order_product_no
);

ALTER TABLE qna ADD CONSTRAINT PK_QNA PRIMARY KEY (
	qna_no
);

ALTER TABLE qna_reply ADD CONSTRAINT PK_QNA_REPLY PRIMARY KEY (
	qna_reply_no
);

ALTER TABLE orders ADD CONSTRAINT PK_ORDER PRIMARY KEY (
	order_no
);

ALTER TABLE orders ADD CONSTRAINT PK_ORDER PRIMARY KEY (
	order_no
);

-- �������� ����
CREATE SEQUENCE member_seq NOCYCLE;
CREATE SEQUENCE product_category_seq NOCYCLE;
CREATE SEQUENCE product_seq NOCYCLE;
CREATE SEQUENCE order_product_seq NOCYCLE;
CREATE SEQUENCE qna_seq NOCYCLE;
CREATE SEQUENCE qna_reply_seq NOCYCLE;
CREATE SEQUENCE orders_seq NOCYCLE;

-- ī�װ� DB������ �߰�
INSERT INTO product_category
values (product_category_seq.nextval
,'�Ҽ�');

INSERT INTO product_category
values (product_category_seq.nextval
,'������');

-- ȸ�� DB������ �߰�
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


INSERT INTO qna
value (qna_seq.nextval
,0
,1
,'���� ����'
,'����'
,'����'
,TO_DATE((SYSDATE), 'yy/mm/dd')
,10
);

INSERT INTO qna_reply
value (qna_reply_seq.nextval
,0
,1
,TO_DATE((SYSDATE), 'yy/mm/dd')
,'��� �Դϴ�.'
);

INSERT INTO qna_reply
value (qna_reply_seq.nextval
,1
,1
,TO_DATE((SYSDATE), 'yy/mm/dd')
,'���� �Դϴ�.'
);


-- �ֹ� �� �߰�
INSERT INTO orders
values (orders_seq.nextval
,TO_DATE((SYSDATE), 'yy/mm/dd')
,1
);

ALTER TABLE orders ADD(order_name varchar(10) NOT NULL);
ALTER TABLE orders ADD(order_phone varchar(20) NOT NULL);


commit;