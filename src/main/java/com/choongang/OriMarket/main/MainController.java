package com.choongang.OriMarket.main;

import com.choongang.OriMarket.user.*;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequiredArgsConstructor
@Log4j2
public class MainController {

    private final MainService mainService;
    private final UserRepository userRepository;
    private final UserAddressRepository userAddressRepository;

    @GetMapping("/")
    public String main(HttpSession session, Model model) {

        if (session.getAttribute("userSeq") != null) {
            //유저 번호 찾아서
            Long userSeq = Long.valueOf((session.getAttribute("userSeq")).toString());
            User user = userRepository.findByUserSeq(userSeq);
            model.addAttribute("userMarket", user.getUserMarkets());

            return "main/main";
        } else {
            return "main/main";
        }
    }

    @GetMapping("/connexion_market")
    public String connexion_market() {
        return "main/connexion_market";
    }

    @GetMapping("/connexion_market0")
    public String connexion_market0() {
        return "main/connexion_market0";
    }

    @GetMapping("/main0")
    public String main0() {
        return "main/main0";
    }

    @GetMapping("/index")
    public String index() {
        return "main/index";
    }

    @GetMapping("/search")
    public String search(HttpSession session, Model model) {
        if (session.getAttribute("userId") == null) {
            return "error/login_error";
        } else {
            User findUser = userRepository.findByUserId(String.valueOf(session.getAttribute("userId")));
            if (findUser == null) {
                return "main/search";
            } else {
                List<UserAddress> userAddresses = findUser.getUserAddresses();
                model.addAttribute("userAd", userAddresses);
                return "main/search";
            }
        }
    }

    @GetMapping("/mylocation")
    public String test(HttpSession session, Model model) {

        if (session.getAttribute("userId") == null) {
            //비회원일때 등록한주소 값 받아와서
            return "main/mylocation";
        } else {
            User findUser = userRepository.findByUserId(String.valueOf(session.getAttribute("userId")));
            List<UserAddress> userAddresses = findUser.getUserAddresses();
            model.addAttribute("userAd", userAddresses);
            return "main/mylocation";
        }
    }

    @PostMapping("/search")
    public String search1(@ModelAttribute UserAddress userAddress, HttpSession session, Model model) {
        mainService.updateAddress(session, userAddress, model);
        return "main/search";
    }

    @GetMapping("/deleteAddress")
    public String deleteAddress(@RequestParam("userAddressSeq") Long userAddressSeq, HttpSession session, Model model) {
        UserAddress byId = userAddressRepository.findById(userAddressSeq).orElseThrow();
        userAddressRepository.delete(byId);
        User findUser = userRepository.findByUserId(String.valueOf(session.getAttribute("userId")));
        List<UserAddress> userAddresses = findUser.getUserAddresses();

        if (userAddresses.isEmpty()) {
            session.removeAttribute("userAddress1");
            session.removeAttribute("userAddressDetail1");
        } else {
            session.setAttribute("userAddress1", userAddresses.get(userAddresses.size() - 1).getUserAddress1());
            session.setAttribute("userAddressDetail1", userAddresses.get(userAddresses.size() - 1).getUserAddressDetail1());
        }
        model.addAttribute("userAd", userAddresses);
        return "main/search";
    }

    @GetMapping("/updateAddress")
    public String updateAddress(@RequestParam("userAddressSeq") Long userAddressSeq, Model model, HttpSession session) {
        UserAddress byId = userAddressRepository.findById(userAddressSeq).orElseThrow();

        session.setAttribute("userAddress1", byId.getUserAddress1());
        session.setAttribute("userAddressDetail1", byId.getUserAddressDetail1());

        List<UserAddress> userAddresses = byId.getUser().getUserAddresses();
        model.addAttribute("userAd", userAddresses);

        return "main/search";
    }
}

