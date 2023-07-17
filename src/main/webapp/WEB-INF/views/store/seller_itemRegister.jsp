<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>신규상품등록</title>
    <style type="text/css">
        /* 전체적용 */
        @font-face {
            font-family: 'omyu_pretty';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-01@1.0/omyu_pretty.woff2') format('woff2');
            font-weight: normal;
            font-style: normal;
        }
        @font-face {
            font-family: 'LINESeedKR-Bd';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/LINESeedKR-Bd.woff2') format('woff2');
            font-weight: 700;
            font-style: normal;
        }

        /* 전체 크기 */
        body{margin: 0; padding: 0; font-family:'LINESeedKR-Bd'; font-size: 16px; text-align: center;}
        #goods_container{width: 375px; border: 1px solid black;}

        /* 가게상호명,업주 */
        #goods_store{text-align: right;}

        /* 버튼 */
        #goods_btn input{background-color: #FFBF41; font-family:'LINESeedKR-Bd'; border-style: none; font-size: 16px;}

        #goods_listTable{margin: 0 auto;}
        #goods_listTable td{color: #46A973;}
    </style>
</head>
<body>
<div id="goods_container">
    <div id="goods_store">
        <div>푸른과일마트</div>
        <small>대표:손예솔</small>
    </div>
    <div>
        <h1>신규상품등록</h1>
    </div>
    <div>5
        <form action="" enctype="">
            <table id="goods_listTable">
                <tr>
                    <td>상품명</td>
                    <td><input type="text" name="menu_name"></td>
                </tr>
                <tr>
                    <td>상품수량</td>
                    <td><input type="text" name="menu_cnt" placeholder="판매단위로 입력해주세요."></td>
                </tr>
                <tr>
                    <td>원가</td>
                    <td><input type="text" name="menu_priceOrigin"></td>
                </tr>
                <tr>
                    <td>판매가</td>
                    <td><input type="text" name="menu_price"></td>
                </tr>
                <tr>
                    <td>무게</td>
                    <td><input type="text" name="menu_g"></td>
                </tr>
                <tr>
                    <td>원산지</td>
                    <td><input type="text" name="menu_from"></td>
                </tr>
                <tr>
                    <td>입고일</td>
                    <td><input type="date" name="menu_regDate"></td>
                </tr>
                <tr>
                    <td>상세정보</td>
                    <td><textarea name="menu_info"></textarea></td>
                </tr>
                <tr>
                    <td>상품사진</td>
                    <td><input type="file"></td>
                </tr>
            </table>
            <br>
            <div id="goods_btn">
                <!-- 등록버튼 클릭하면 모달창 띄워서 등록이 완료되었습니다. 표시하고 계속 상품등록할 수 있도록 같은 등록페이지로 리다이렉트 -->
                <input type="submit" value="등록">
                <input type="reset" value="취소">
                <a href="./GoodsManage_list.jsp"><input type="button" value="리스트"></a>
            </div>
        </form>
        <div>
        </div>
    </div>
    <br>
</div>
</body>
</html>