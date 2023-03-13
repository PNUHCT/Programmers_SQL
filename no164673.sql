-- 조건에 부합하는 중고거래 댓글 조회하기
-- 제목, 게시글ID, 댓글ID, 댓글 작성자 ID, 댓글 내용, 댓글 작성일 컬럼 조회 
SELECT UGB.TITLE, UGB.BOARD_ID
        , UGR.REPLY_ID, UGR.WRITER_ID, UGR.CONTENTS
        , date_format(UGR.CREATED_DATE, '%Y-%m-%d') AS CREATED_DATE -- date_format은 날짜로 지정하는 문법. 이때, %Y는 2022, %y는 22 | %M은 Oct, %m은 10 형식으로 출력
FROM USED_GOODS_BOARD UGB
INNER JOIN USED_GOODS_REPLY UGR ON UGB.BOARD_ID = UGR.BOARD_ID -- UGB의 BOARD_ID와 같은 값을 가진 위치에 조인
WHERE UGB.CREATED_DATE LIKE '2022-10%' -- 10월 밑으론 상관 없도록 체크
ORDER BY UGR.CREATED_DATE ASC, UGB.CREATED_DATE ASC -- 정렬 조건 두개