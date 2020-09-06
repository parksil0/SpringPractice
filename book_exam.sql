select * from tbl_board;

insert into tbl_board values(seq_board.nextval, '테스트 제목', '테스트 내용', 'user00', sysdate, sysdate);

insert into tbl_board(bno, title, content, writer)
(select seq_board.nextval, title, content, writer from tbl_board);

insert into tbl_board(bno, title, content, writer)
(select seq_board.nextval, title, content, writer from tbl_board);

insert into tbl_board(bno, title, content, writer)
(select seq_board.nextval, title, content, writer from tbl_board);

select * from tbl_board order by bno desc;

select * from tbl_reply order by rno desc;

select
/*+ INDEX_DESC(tbl_board pk_board) */
*
from
    tbl_board
where bno > 0;

select
/*+ INDEX_DESC(tbl_board pk_board) */
rownum rn, bno, title, content
from tbl_board
where rownum <= 10;

select rn, bno, title, content
  from (select /*+ INDEX_DESC(tbl_board pk_board) */ rownum rn, bno, title, content
          from tbl_board
        where rownum <= 20
       )
 where rn > 10;
 
select * from tbl_board where rownum < 10 order by bno desc;

select /*+index(tbl_reply idx_reply) */
    rownum rn, bno, rno, reply, replyer, replydate, updatedate
    from tbl_reply
    where bno = 917511
    and rno > 0;
    
update tbl_board set replycnt = (select count(rno) from tbl_reply where tbl_reply.bno = tbl_board.bno);

SELECT mem.userid, userpw, username, enabled, regdate, updatedate, auth
		FROM tbl_member mem LEFT OUTER JOIN tbl_member_auth auth on mem.userid = auth.userid
		WHERE mem.userid = 'admin90';
        
delete from tbl_board where bno > 00000;

delete from tbl_attach;