package com.choongang.OriMarket.favorite;

import com.choongang.OriMarket.business.message.Message;
import com.choongang.OriMarket.business.message.MessageRepository;
import com.choongang.OriMarket.business.store.BusinessStore;
import com.choongang.OriMarket.business.store.BusinessStoreRepository;
import com.choongang.OriMarket.business.user.BusinessUser;
import com.choongang.OriMarket.review.Review;
import com.choongang.OriMarket.review.ReviewRepository;
import com.choongang.OriMarket.store.Item;
import com.choongang.OriMarket.user.User;
import com.choongang.OriMarket.user.UserService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.*;

@Controller
@RequiredArgsConstructor
@Log4j2
public class FavController {

    private final FavService favService;
    private final UserService userService;
    private final BusinessStoreRepository businessStoreRepository;
    private final MessageRepository messageRepository;

    private final ReviewRepository reviewRepository;


    @GetMapping("/storeFav")
    public String storeFav(@RequestParam(value = "favId", required = false) Long favId, User user, Fav fav, HttpSession session, Model model) {

        List<BusinessStore> byBuStoreName = businessStoreRepository.findByBuStoreName(fav.getFavStoreName());

        List<Item> items = byBuStoreName.get(0).getItems();
        model.addAttribute("al", items);

        //fav table에 해당 가게가 존재 할 경우 삭제, 존재하지 않을 경우 추가
        if (favService.favFavorite(fav.getUserSeq(), fav.getFavStoreName())) {
            favService.favDelete(fav.getUserSeq(), fav.getFavStoreName());
            fav.setFavNumber("");
            session.setAttribute("favNumber", "");
        } else {
            favService.favInsert(fav);
            //데이터 베이스 x
            fav.setFavNumber("1");
            session.setAttribute("favNumber", "1");
        }

        //리뷰 평점계산
        List<Review> reviewListResult = reviewRepository.findByBusinessStore(byBuStoreName.get(0));
        //리뷰 총점 계산
        int totalSum = 0;
        int reviewCount = reviewListResult.size();
        for (Review review1 : reviewListResult) {
            if (review1.getRating() != null) {
                int rating = review1.getRating();
                totalSum += rating;
            }
        }
        double averageRating = (double) totalSum / reviewCount;

        model.addAttribute("aveRating", averageRating);

        //공지사항
        BusinessUser buStoreNumber = items.get(0).getBusinessStore().getBusinessUser();
        session.setAttribute("buUserNumber", buStoreNumber.getBuUserNumber());

        List<Message> messageList = messageRepository.findByBuUserNumber(buStoreNumber);
        // 공지가 비어있지 않으면 가장 마지막에 작성한 공지를 꺼내옴.
        if (!messageList.isEmpty()) {
            Message lastM = messageList.get(messageList.size() - 1);
            model.addAttribute("lastM", lastM);
        }

        return "store/store";
    }

    @GetMapping("/store")
    public String store(@RequestParam("favStoreName") String favStoreName,
                        @RequestParam(value = "favId", required = false) Long favId,
                        Fav fav, User user, HttpSession session, Model model) {

        user.setUserId(String.valueOf(session.getAttribute("userId")));

        //회원
        if (userService.checkUserId(user.getUserId())) {

            user.setUserSeq(Long.valueOf(String.valueOf(session.getAttribute("userSeq"))));
            //즐겨찾기 되어있는건지 안되어있는건지 확인만!
            fav.setUserSeq(user);
            fav.setFavStoreName(favStoreName);
            //해당 db에 스토어 존재하면 1 또는 공백 주어 하트 변경
            if (favService.favFavorite(fav.getUserSeq(), favStoreName)) {
                session.setAttribute("favNumber", 1);
                session.setAttribute("favStoreName", favStoreName);

            } else {
                session.setAttribute("favNumber", "");
                session.setAttribute("favStoreName", favStoreName);
            }

            List<BusinessStore> byBuStoreName = businessStoreRepository.findByBuStoreName(favStoreName);
            //리뷰 평점계산
            List<Review> reviewListResult = reviewRepository.findByBusinessStore(byBuStoreName.get(0));

            if (reviewListResult.size() == 1) {
                model.addAttribute("aveRating", reviewListResult.get(0).getRating());
                model.addAttribute("reviewcount", 1);
            } else {
                //리뷰 총점 계산
                int totalSum = 0;
                int reviewCount = reviewListResult.size();
                for (Review review1 : reviewListResult) {
                    if (review1.getRating() != null) {
                        int rating = review1.getRating();
                        totalSum += rating;
                    }
                }
                double averageRating = (double) totalSum / reviewCount;

                System.out.println("이거실행되잖아");
                model.addAttribute("aveRating", averageRating);
                model.addAttribute("reviewcount", reviewCount);
            }


            //시장 번호
            Long marketSeq = byBuStoreName.get(0).getMarket().getMarketSeq();
            session.setAttribute("marketSeq", marketSeq);

            //사업자번호
            Long businessNumber = byBuStoreName.get(0).getBusinessUser().getBuUserNumber();
            session.setAttribute("businessNumber", businessNumber);

            //시장 이름
            String marketName = byBuStoreName.get(0).getMarket().getMarketName();
            session.setAttribute("marketName", marketName);

            //물건 목록
            List<Item> items = byBuStoreName.get(0).getItems();
            items.sort(Comparator.comparing(Item::getItemCategory));
            model.addAttribute("al", items);

            //가게 이미지 정보
            String buStoreImageUrl = byBuStoreName.get(0).getBuStoreImageUrl();
            System.out.println("이건머라고나오띾요?:" + buStoreImageUrl);
            session.setAttribute("buStoreImage", buStoreImageUrl);

            //8.3 테스트
            model.addAttribute("favStoreImg", buStoreImageUrl);

            //공지사항
            BusinessUser buStoreNumber = items.get(0).getBusinessStore().getBusinessUser();
            session.setAttribute("buUserNumber", buStoreNumber.getBuUserNumber());

            List<Message> messageList = messageRepository.findByBuUserNumber(buStoreNumber);

            if (!messageList.isEmpty()) {
                Message lastM = messageList.get(messageList.size() - 1);
                model.addAttribute("lastM", lastM);
            }

            return "store/store";
            //비회원
        } else {
            return "store/store";
        }
    }

    @GetMapping("/favList")
    public String favStoreList(User user, HttpSession session, Model model) {

        if (session.getAttribute("userSeq") == null) {
            return "error/login_error";
        } else {
            Long userSeq = Long.valueOf((session.getAttribute("userSeq")).toString());
            user.setUserSeq(userSeq);

            if (favService.favList(user) != null) {
                List<Fav> fResult = favService.favList(user);
                model.addAttribute("favResult", fResult);
                model.addAttribute("favs", 1);
                return "user/favStoreList";

            } else {
                model.addAttribute("favs", 0);
                return "user/favStoreList";
            }
        }

    }

}
