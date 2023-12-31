package com.choongang.OriMarket.business.market;

import com.choongang.OriMarket.user.User;
import com.choongang.OriMarket.user.UserMarket;
import com.choongang.OriMarket.user.UserMarketRepository;
import com.choongang.OriMarket.user.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequiredArgsConstructor // :Lombok을 통해 생성자 주입을 편리하게 처리하기 위한 목적으로 사용.
@Log4j2
public class MarketController {

    private final MarketRepository marketRepository;

    private final UserRepository userRepository;

    private final UserMarketRepository userMarketRepository;

    @PostMapping("/market_search")
    public String marketSearch(@ModelAttribute Market market, HttpSession session, UserMarket userMarket, Model model) {
        Market byMarketName = marketRepository.findByMarketName(market.getMarketName());

        session.setAttribute("marketName", byMarketName.getMarketName());
        session.setAttribute("marketSeq", byMarketName.getMarketSeq());

        if (session.getAttribute("userSeq") == null) {
            return "main/main";
        } else {
            User userSeq = userRepository.findById((Long) session.getAttribute("userSeq")).orElseThrow();
            userMarket.setUser(userSeq);
            userMarket.setMarket(byMarketName);

            //유저 번호로 찾아서
            if (userMarketRepository.findByUser(userSeq) != null) {
                //리스트 뽑고
                List<UserMarket> userMarketResult = userMarketRepository.findByUser(userSeq);
                //꺼내서 비교
                for (UserMarket us : userMarketResult) {
                    //만약 같으면
                    if (us.getMarket().getMarketName().equals(market.getMarketName())) {
                        model.addAttribute("userMarketError", "이미 등록된 단골시장입니다.");
                        model.addAttribute("userMarket", userSeq.getUserMarkets());
                        return "main/main";
                    }
                }
                //다르면 저장
                userMarketRepository.save(userMarket);
                model.addAttribute("userMarket", userSeq.getUserMarkets());

            }
            return "main/main";
        }
    }

    @GetMapping("/market_search")
    public String marketSearch(@RequestParam("marketName") String marketName, HttpSession session, UserMarket userMarket, Model model) {
        Market byMarketName = marketRepository.findByMarketName(marketName);

        session.setAttribute("marketName", byMarketName.getMarketName());
        session.setAttribute("marketSeq", byMarketName.getMarketSeq());

        if (session.getAttribute("userSeq") == null) {
            return "main/main";
        } else {
            User userSeq = userRepository.findById((Long) session.getAttribute("userSeq")).orElseThrow();
            userMarket.setUser(userSeq);
            userMarket.setMarket(byMarketName);

            //유저 번호로 찾아서
            if (userMarketRepository.findByUser(userSeq) != null) {
                //리스트 뽑고
                List<UserMarket> userMarketResult = userMarketRepository.findByUser(userSeq);
                //꺼내서 비교
                for (UserMarket us : userMarketResult) {
                    //만약 같으면
                    if (us.getMarket().getMarketName().equals(marketName)) {
                        model.addAttribute("userMarketError", "이미 등록된 단골시장입니다.");
                        model.addAttribute("userMarket", userSeq.getUserMarkets());
                        return "main/main";
                    }
                }
                //다르면 저장
                userMarketRepository.save(userMarket);
                model.addAttribute("userMarket", userSeq.getUserMarkets());

            }
            return "main/main";
        }
    }
}
