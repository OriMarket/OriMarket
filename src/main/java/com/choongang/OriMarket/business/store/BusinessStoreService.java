package com.choongang.OriMarket.business.store;

import com.choongang.OriMarket.business.market.Market;
import com.choongang.OriMarket.business.market.MarketRepository;
import com.choongang.OriMarket.business.user.BusinessUser;
import com.choongang.OriMarket.business.user.BusinessUserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import javax.servlet.http.HttpSession;
import java.util.List;

@Service
//필드 생성자 자동 생성
@RequiredArgsConstructor
//추상화 역할 라이브러리
@Log4j2
public class BusinessStoreService {

    private final BusinessStoreRepository businessStoreRepository;
    private final BusinessUserRepository businessUserRepository;
    private final MarketRepository marketRepository;


    public void save(BusinessStore businessStore, HttpSession session, Model model, String s) {

        Object buUserNumber = session.getAttribute("buUserNumber");

        // 사업자가 로그인할때 생성된 마켓번호로 해당마켓번호의 마켓을 찾는다.
        Long marketSeq = Long.valueOf((session.getAttribute("marketSeq")).toString());

        Market bymarket = marketRepository.findById(marketSeq).orElseThrow();

        // 가게등록을 할때 어느 시장의 가게인지 알아야하기 때문에 상인이속한 시장을 가게에 등록해준다.
        businessStore.setMarket(bymarket);

        // 로그인할 때 생성된 사업자 번호로 사업자를 찾는다.
        BusinessUser businessUser = businessUserRepository.findById((Long) buUserNumber).orElseThrow();

        // 가게등록할때 누구 가게인지 알아야하기 때문에 찾은 사업자를 가게에 등록해준다.
        businessStore.setBusinessUser(businessUser);
        // 가게에 등록한 사진 정보를 등록해준다.
        businessStore.setBuStoreImageUrl(s);

        // 위의 정보를들 가지고 있는 비즈니스 스토어를 save해서 생성 또는 업데이트 한다.
        BusinessStore businessStore1 = businessStoreRepository.save(businessStore);

        session.setAttribute("buStoreImageUrl", businessStore1.getBuStoreImageUrl());

        // 모델에 저장해서 view 페이지로쓴다.
        model.addAttribute("save", businessStore1);

    }

    public BusinessStore findReview(BusinessStore businessStore, BusinessUser businessUser, HttpSession session) {
        Long buUserNumbers = Long.valueOf((session.getAttribute("buUserNumber")).toString());
        businessUser.setBuUserNumber(buUserNumbers);
        //사업자 번호로 해당 가게 찾기
        BusinessStore buStore = businessStoreRepository.findByBusinessUser(businessUser);

        return buStore;
    }

    public List<BusinessStore> searchStore(String searchKeyword) {
        List<BusinessStore> byStoreName = businessStoreRepository.findByBuStoreName(searchKeyword);

        if (byStoreName.isEmpty()) {
            return byStoreName;
        } else {
            return byStoreName;
        }
    }

    public BusinessStore findUserStore(BusinessUser businessUser, Model model) {
        BusinessStore userStore = businessStoreRepository.findByBusinessUser(businessUser);
        model.addAttribute("save", userStore);
        return userStore;
    }

}
