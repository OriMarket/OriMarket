package com.choongang.OriMarket.header;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@RequiredArgsConstructor
@Slf4j
public class HeaderController {

    @GetMapping("/header_index")
    public String header_index() {
        return "header/header_index";
    }
    @GetMapping("/header_login")
    public String header_login() {
        return "header/header_login";
    }
    @GetMapping("/header_search")
    public String header_search() {
        return "header/header_search";
    }


};