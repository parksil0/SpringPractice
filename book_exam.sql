select * from tbl_board;

insert into tbl_board(bno, title, content, writer)
(select seq_board.nextval, title, content, writer from tbl_board);

insert into tbl_board(bno, title, content, writer)
(select seq_board.nextval, title, content, writer from tbl_board);

insert into tbl_board(bno, title, content, writer)
(select seq_board.nextval, title, content, writer from tbl_board);

select * from tbl_board order by bno desc;

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