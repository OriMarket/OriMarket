package com.choongang.OriMarket.store;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@RequiredArgsConstructor
@Slf4j
public class StoreController {

    @GetMapping("/detailmenu")
    public String store_detailmenu() {
        return "store/detailmenu";
    }

    @GetMapping("/store")
    public String store() {
        return "store/store";
    }

    @GetMapping("/store_menu_search")
    public String store_menu_search() {
        return "store/store_menu_search";
    }
    
};