use orimarket;

insert ignore into market(market_latitude,market_longitude,market_name) values('37.567123','126.978456','경동시장');
insert ignore into market(market_latitude,market_longitude,market_name) values('37.4815335827273','126.92842341587128','신원시장');
insert ignore into market(market_latitude,market_longitude,market_name) values('37.570457','127.009982','동대문시장');
insert ignore into market(market_latitude,market_longitude,market_name) values('37.559836','126.977634','남대문시장');
insert ignore into market(market_latitude,market_longitude,market_name) values('37.565809','126.966071','통인시장');
update market set market_href='/shinwon_marketmap' where market_name='신원시장';
update market set market_href='/tongin_marketmap' where market_name='통인시장';
update market set market_href='/gyoengdong_marketmap' where market_seq=1;
update market set market_href='/dongdaemun_marketmap' where market_seq=3;
update market set market_href='/namdaemun_marketmap' where market_seq=4;

insert ignore into business_user values('123456789','신원시장','김치천국','김치천국@사장.com','kimchi','김치천국사장','123!q','0105555','2');
insert ignore into business_user values('1476859402','신원시장','영광마트','영광마트@사장.com','ygmart','영광마트사장','123!q','01023567896','2');
insert ignore into business_user values('483918274','신원시장','신림기름집','신림기름집@사장.com','oil','신림기름집사장','123!q','01089884522','2');
insert ignore into business_user values('898742312','신원시장','오떡순','오떡순@사장.com','bunsik','오떡순사장','123!q','0245621233','2');
insert ignore into business_user values('782132456','신원시장','중국슈퍼','중국슈퍼@사장.com','china','중국슈퍼사장','123!q','0245687895','2');
insert ignore into business_user values('245687231','신원시장','못난이꽈배기','못난이꽈배기@사장.com','ugly','못난이꽈배기사장','123!q','0254879512','2');

insert ignore into business_store(bu_store_address,bu_store_address_detail,bu_store_category,bu_store_image_url,bu_store_name,bu_store_phone,status,business_user,market_seq)
    value('신원시장','김치천국','국,반찬','김치천국.png','김치천국','010-1111-2222','OPEN','123456789','2');
insert ignore into business_store(bu_store_address,bu_store_address_detail,bu_store_category,bu_store_image_url,bu_store_name,bu_store_phone,status,business_user,market_seq)
    value('신원시장','영광마트','마트','영광마트.png','영광마트','010-2356-7896','OPEN','1476859402','2');
insert ignore into business_store(bu_store_address,bu_store_address_detail,bu_store_category,bu_store_image_url,bu_store_name,bu_store_phone,status,business_user,market_seq)
    value('신원시장','신림기름집','마트','신림기름집.png','신림기름집','010-8988-4522','OPEN','483918274','2');
insert ignore into business_store(bu_store_address,bu_store_address_detail,bu_store_category,bu_store_image_url,bu_store_name,bu_store_phone,status,business_user,market_seq)
    value('신원시장','오떡순','간식','오떡순.png','오떡순','02-4562-1233','OPEN','898742312','2');
insert ignore into business_store(bu_store_address,bu_store_address_detail,bu_store_category,bu_store_image_url,bu_store_name,bu_store_phone,status,business_user,market_seq)
    value('신원시장','중국슈퍼','마트','중국슈퍼.png','중국슈퍼','02-4568-7895','OPEN','782132456','2');
insert ignore into business_store(bu_store_address,bu_store_address_detail,bu_store_category,bu_store_image_url,bu_store_name,bu_store_phone,status,business_user,market_seq)
    value('신원시장','못난이꽈배기','간식','못난이꽈배기.png','못난이꽈배기','02-5487-9512','OPEN','245687231','2');

insert ignore into goods value(1,'사장님추천','30','10000','국산','1000','포기김치.png','이것은 국내산 고춧가루로만 만든 아주 맜잇는 포기김치 입니다.','포기김치','15000',NOW(),1);
insert ignore into goods value(2,'사장님추천','20','5000','국산','500','열무김치.png','매콤한 감칠맛의 양념으로 고르게 버무리고 아삭아삭한 식감과 시원하면서 개운한 풍미로 입맛을 한껏 돋워 줍니다','열무김치','7000',NOW(),1);
insert ignore into goods value(3,'사장님추천','8','7000','국산','800','파김치.png','국내산 고춧가루와 찹쌀 풀을 사용하여 조화롭고 깔끔한 매운맛을 느낄 수 있습니다.','파김치','8000',NOW(),1);
insert ignore into goods value(4,'인기메뉴', '21','5000','국산','900','총각김치.png','속이 꽉찬 싱싱하고 단단한 무의 맛이 익을수록 단맛이 나며 여린 잎의 야들거리는 식감과 최고의 감칠 맛을 느낄 수 있습니다','총각김치','6500',NOW(),1);
insert ignore into goods value(5,'할인메뉴', '11','3000','국산','600','동치미.png','속이 꽉 차고 단맛이 나는 청정지역의 무로 만든 동치미는 살아있는 고추향과 시원하면서도 아삭한 식감을 오래도록 즐길 수 있습니다','동치미','3500',NOW(),1);
insert ignore into goods value(6,'할인메뉴', '6','8000','국산','800','백김치.png','밤, 배, 대추등 고명이 추가된 고급 물김치!','백김치','9500',NOW(),1);
insert ignore into goods value(7,'할인메뉴', '2','5000','국산','700','4종김치.png','소량으로 4가지의 다양한 김치를 맛을 볼 수 있습니다.','4종김치','6500',NOW(),1);

insert ignore into goods value(8,'사장님추천','61','1500','한국','90','꿀꽈배기.png','제대로 꼬여 더욱 바삭하고, 벌꿀을 함유해 더욱 달콤한 꿀꽈배기를 즐겨보세요','꿀꽈배기','1300',NOW(),'2');
insert ignore into goods value(9,'사장님추천','61','33000','홍콩','320','제니스베이커리.png','홍콩의 명물 제니 베이커리 쿠키','제니베이커리','18000',NOW(),'2');
insert ignore into goods value(10,'사장님추천','52','15600','미국','454','피넛버더파우더.png','반적인 피넛버터보다 더욱 건강하고 훌륭한 맛을 가진 파우더 타입의 피넛 버터입니다','피넛버터파우더','15000',NOW(),'2');
insert ignore into goods value(11,'인기메뉴','82','16000','미국','254','치리오스.png','통귀리로 만든 맛있는 시리얼입니다. 12가지 비타민과 미네랄이 함유되어 있습니다.','치리오스 시리얼','12000',NOW(),'2');
insert ignore into goods value(12,'인기메뉴','6','1500','한국','60','먹태깡.png','북어가 함유되어 있어 풍부한 감칠맛에 알싸한 청양마요맛 가미','먹태깡','1400',NOW(),'2');

insert ignore into goods value(13,'사장님추천','12','20000','한국','90','참기름.png','저온으로 짜내 고소한 참깨의 맛과 향이 가득한 참기름이에요','참기름','12300',NOW(),'3');
insert ignore into goods value(14,'인기메뉴','10','6000','한국','90','카놀라유.png','오직 유채씨만을 활용하여, 포화지방 함량이 가장 낮은 순 식물성 오일이에요','카놀라유','5700',NOW(),'3');
insert ignore into goods value(15,'인기메뉴','9','7500','한국','90','포도씨유.png','선한 포도의 씨를 압착한 건강한 기름이니 다양한 요리에 활용해 보세요','포도씨유','9600',NOW(),'3');
insert ignore into goods value(16,'할인메뉴','15','8300','한국','90','콩기름.png','국내산 콩으로만 만들어 우리 음식의 맛을 고소하게 잘 살려준답니다','콩기름','7450',NOW(),'3');
insert ignore into goods value(17,'할인메뉴','3','40000','한국','90','들기름.png','기타 첨가물 없이 순수한 원료를 사용해 들깨의 고유한 맛과 향을 풍성하게 느낄 수 있습니다.','들기름','35000',NOW(),'3');

insert ignore into goods value(18,'사장님추천','30','4000','한국','300','떡볶이.png','매워서 더 맛있다!','떡볶이','3500',NOW(),'4');
insert ignore into goods value(19,'사장님추천','28','4000','한국','400','순대.png','해썹(HACCP)위생 인증을 받아 믿고 먹을 수 있는 순대','순대','3000',NOW(),'4');
insert ignore into goods value(20,'사장님추천','25','3000','한국','450','오뎅.png','여러가지 야채육수에 끓인 어묵!','어묵','2500',NOW(),'4');
insert ignore into goods value(21,'인기메뉴','35','1000','한국','150','튀김.png','매일 새로운 튀김에 튀기는 모듬튀김!','튀김','3000',NOW(),'4');
insert ignore into goods value(22,'인기메뉴','42','10000','한국','250','라면.png','오떡순의 특별 소스가 들어간 라면','라면','3500',NOW(),'4');

insert ignore into goods value(23,'사장님추천','25','4000','중국','300','새우알침.png','새우가 들어간 과자','새우알칩','3500',NOW(),'5');
insert ignore into goods value(24,'인기메뉴','35','3000','중국','350','중국라면.png','칼국수면과 마라탕과 라면의 조합, 궁금하지 안힌?','중국라면','2500',NOW(),'5');
insert ignore into goods value(25,'할인메뉴','8','4000','중국','500','중국차.png','4가지 과일맛의 차음료','차파이','1500',NOW(),'5');
insert ignore into goods value(26,'할인메뉴','12','4000','중국','100','탕후루.png','요즘 이것도 모르면 MZ가 아니지! 과일과 설탕의 만남, 탕후루!','탕후루','3500',NOW(),'5');

insert ignore into goods value(27,'인기메뉴','12','3000','한국','150','기본꽈배기.png','옛날 꽈배기 그맛 그대로 만들었다.','꽈배기','1500',NOW(),'6');
insert ignore into goods value(28,'할인메뉴','12','4000','한국','200','토핑꽈배기.png','꽈배기, 옛날 간식이라고 더이상 생각하지말자! 이제 디저트다! ','토핑꽈배기','2500',NOW(),'6');
insert ignore into goods value(29,'할인메뉴','12','4000','한국','120','꽈배기아이스크림.png','올 여름 더위를 날려줄 진짜 우유 아이스크림과 쫀득하고 달콤한 똬배기!','꽈배기 아이스크림','3500',NOW(),'6');

insert ignore into business_message value(1,now(),'김치천국휴일안내','매주 월요일에 휴무합니다.',123456789);
insert ignore into business_message value(2,now(),'8월 이벤트','매주 수요일 오후2시부터 5시까지 꽈배기 주문시 토핑 1가지 무료! 감사합니다.',245687231);
insert ignore into business_message value(3,now(),'리뷰이벤트 안내','별점5점과 리뷰를 남기면 엑스트라버진 올리브유 100ml 증정해드립니다! 요청사항에 리뷰남겨준다고 말씀해주세요~',483918274);
insert ignore into business_message value(4,now(),'드디어 우리 가게에 탕후루가 들어왔다','여러분들의 요청으로 탕후루를 판매하기로 했습니다! 현재 파인애플, 딸기, 샤인머스캣, 오렌지, 키위가 있습니다!',782132456);
insert ignore into business_message value(5,now(),'8월 6일~9일 휴무안내','개인 사정으로 인해 8월 6일부터 9일까지 잠시 문을 닫습니다. 죄송합니다.',898742312);
insert ignore into business_message value(6,now(),'안녕하세요. 영광마트 사장입니다.','시원하고 달콤한 과일이 기다려지는 계절, 뜨거운 햇살이 몸을 녹이지만 시원하고 차가운 즐길 거리가 풍족한 여름입니다. 더운 열기에 지치지 마시고 힘내시는 여름 되시길 바랍니다.',1476859402);

insert ignore into member value(1,'','123','2312@wdd','test','test','test','test1!','34342412');
insert ignore into member value(2,'','101호','ahjks@naver.com','user','김민주','맛있으면짖는개','user1!','01012348952');
insert ignore into member value(3,'','601동 205호','oopy@naver.com','yam','박민성','먹방BJ','yam1!','01023541234');
insert ignore into member value(4,'','214동 2801호','ghnc@gmail.com','hello','오민혜','하이요','hello1!','01023457582');
insert ignore into member value(5,'','6층 696호','mamama@naver.com','food','김주희','맛없기만해봐','food1!','01039842321');
insert ignore into member value(6,'','옥탑방','sijang@naver.com','id','남궁예슬','순삭','id1!','01023547896');

insert ignore into manager_user value(1,'manager@orimarket.com','manager','매니저','manager1!','01012345678','2');

insert ignore into rider value(1,'license.png','','ridertest','라이더','rider1!','01012451233');