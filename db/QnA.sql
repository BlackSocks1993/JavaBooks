DROP TABLE MEMBER;
DROP TABLE QnA;
DROP TABLE REPLY;

DROP SEQUENCE QnA_seq;
DROP SEQUENCE REPLY_seq;


-- 테이블 생성
CREATE TABLE MEMBER (
	member_no	NUMBER(12)		NOT NULL,
    member_id   VARCHAR(45)     NOT NULL
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


-- member 테이블 값 추가
INSERT INTO member
VALUES (0
,'admin01');

INSERT INTO member
VALUES (1
,'blacksocks1993');

INSERT INTO member
VALUES (2
,'sundalkis');



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
,0
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
,0
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