package com.choongang.OriMarket.marketmap;

import com.choongang.OriMarket.business.market.Market;
import com.choongang.OriMarket.business.market.MarketRepository;
import com.choongang.OriMarket.business.store.BusinessStore;
import com.choongang.OriMarket.utill.DistanceUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;


@Controller
@RequiredArgsConstructor
@Log4j2
public class MarketMapController {

    private final MarketRepository marketRepository;

    @GetMapping("/marketmap")
    public String marketmap() {
        return "marketmap/marketmap";
    }

    @GetMapping("/shinwon_marketmap")
    public String marketmap2(@RequestParam("marketName") String marketName,
                             @RequestParam("latitude") Double latitude,
                             @RequestParam("longitude") Double longitude,
                             Model model, HttpSession session) {

        model.addAttribute("marketName", marketName);
        Market byMarketName = marketRepository.findByMarketName(marketName);
        session.setAttribute("marketUrl", byMarketName.getMarketHref());
        session.setAttribute("latitude", latitude);
        session.setAttribute("longitude", longitude);

        double radiusInKm = 6.0;
        boolean b = DistanceUtil.calculateDistance(latitude, longitude, byMarketName.getMarketLatitude(), byMarketName.getMarketLongitude()) > radiusInKm;
        if (b) {
            model.addAttribute("b", b);
        } else {
            model.addAttribute("b", b);
        }


        List<BusinessStore> businessStore = byMarketName.getBusinessStore();
        model.addAttribute("buStore", businessStore);
        return "marketmap/shinwon_marketmap";
    }

    @GetMapping("/tongin_marketmap")
    public String marketmap3(@RequestParam("marketName") String marketName, Model model) {
        model.addAttribute("marketName", marketName);
        return "marketmap/tongin_marketmap";
    }

    @GetMapping("/dongdaemun_marketmap")
    public String marketmap4(@RequestParam("marketName") String marketName, Model model) {
        model.addAttribute("marketName", marketName);
        return "marketmap/dongdaemun_marketmap";
    }

    @GetMapping("/gyoengdong_marketmap")
    public String marketmap5(@RequestParam("marketName") String marketName, Model model) {
        model.addAttribute("marketName", marketName);
        return "marketmap/gyoengdong_marketmap";
    }

    @GetMapping("/namdaemun_marketmap")
    public String marketmap6(@RequestParam("marketName") String marketName, Model model) {
        model.addAttribute("marketName", marketName);
        return "marketmap/namdaemun_marketmap";
    }
}

