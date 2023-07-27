package com.choongang.OriMarket.user;

import com.choongang.OriMarket.business.store.BusinessStore;
import com.choongang.OriMarket.business.store.BusinessStoreRepository;
import com.choongang.OriMarket.store.Item;
import com.choongang.OriMarket.store.ItemRepository;
import com.choongang.OriMarket.store.ItemService;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;



@Controller
@Slf4j
public class CartController {

    @Autowired
    private final CartService cartService;
    private final UserService userService;
    private final ItemService itemService;
    private final CartItemRepository cartItemRepository;


    private final ItemRepository itemRepository;

    public CartController(CartService cartService, UserService userService, ItemService itemService, CartItemRepository cartItemRepository, ItemRepository itemRepository){
        this.cartService=cartService;
        this.userService=userService;
        this.itemService=itemService;
        this.cartItemRepository = cartItemRepository;
        this.itemRepository = itemRepository;
    }

    @GetMapping("/cart")
    public String c(){
        return "/error/login_error";
    }
    /*내 장바구니 조회*/
    @GetMapping("/{userId}/cart")
    public String myCartPage(@PathVariable("userId") String userId, Model model){

        if(userId.isEmpty()){
            return "/error/login_error";
        }else {
            Cart cart = cartService.getCart(userId);
            User user = userService.getUser(userId);

            List<CartItem> byUserUserSeq = cartItemRepository.findByUser_UserSeq(user.getUserSeq());
            List<CartItem> cartItems = cartService.userCartView(cart);


            int totalPrice = 0;
            for (CartItem cartItem : cartItems) {
                totalPrice += (cartItem.getItem().getItemPrice() * cartItem.getCount());
            }

            model.addAttribute("cartItemList", cartItems);
            model.addAttribute("totalPrice", totalPrice);
            model.addAttribute("user", userId);
            model.addAttribute("userOrderList", byUserUserSeq);

            if(!byUserUserSeq.isEmpty()) {
                System.out.println("이게먼대" + byUserUserSeq.get(0).getBusinessStore().getMarket().getMarketName());
                model.addAttribute("aa",byUserUserSeq.get(0).getBusinessStore().getMarket().getMarketName());
            }else{

            }
            return "/cart/cart";
        }
    }

    /*특정상품 장바구니에 추가*/
  /*  @PostMapping("/{userId}/cart")
    public String addMyCart(@PathVariable("userId") String userId, Long itemId, int count,Model model){

        if(userService.getUser(userId) == null){
            // 장바구니에 물건을 담을때 비회원이면 로그인해달라고 창뛰우고 마이페이지로 넘어가기
            return "/error/login_error";
        }else {
            //유저 찾기
            User user = userService.getUser(userId);
            //물건 아이디 찾기..?
            Item additem = itemService.getItem(itemId);

            CartItem cartItem = cartItemRepository.findByItem_ItemId(itemId);

            model.addAttribute("item", additem);

            //재고보다 많이 담으면 안담기게.
            if (count <= additem.getItemCnt()) {
                cartService.addCart(user, additem, count);
            }

            return "/detailmenu/"+itemId;
        }
    }*/
    @PostMapping("/{userId}/cart")
    public String addMyCart(@PathVariable("userId") String userId, @RequestParam("itemId") String itemId, int count,Model model){

        if(userService.getUser(userId) == null){
            // 장바구니에 물건을 담을때 비회원이면 로그인해달라고 창뛰우고 마이페이지로 넘어가기
            return "/error/login_error";
        }else {
            Long itemIdResult = Long.valueOf(itemId);
            //유저 찾기
            User user = userService.getUser(userId);
            //물건 아이디 찾기..?
            Item additem = itemService.getItem(itemIdResult);

            CartItem cartItem = cartItemRepository.findByItem_ItemId(itemIdResult);
            System.out.println("카운트"+count);
            model.addAttribute("item", additem);

            //재고보다 많이 담으면 안담기게.
            if (count > additem.getItemCnt()) {
                // 재고보다 많은 수량을 담을 때 에러 처리
                return "error/login_error"; // 재고가 부족한 경우 에러 페이지로 이동
            }
            cartService.addCart(user, additem, count);

            return "redirect:/detailmenu/"+itemIdResult;
        }
    }


    /*장바구니페이지에서 수량증감*/
    @PutMapping("/user/cart")
    @ResponseBody
    public String menuPlusMinus(@RequestParam("cartItemId")Long cartItemId,@RequestParam("type") String type,Item item){
        String result = cartService.menuPlusMinus(cartItemId,type);
        return result;
    }


    /*장바구니 페이지에서 아이템개별삭제*/
    @DeleteMapping("/user/cart")
    @ResponseBody
    public String itemDelete(@RequestParam("cartItemId")Long cartItemId){
        cartService.itemDelete(cartItemId);
        return "ok";
    }


    /*결제페이지로 넘기기*/
    @PostMapping("/paymentPage/{userId}")
    public String orderPayment(@PathVariable("userId") String userId, Model model, @ModelAttribute("deliveryType") String cart1) {
        if(userId.isEmpty()){
            return "/error/login_error";
        }else {
            cartService.saveCartInfo(userId, cart1);
            Cart cart = cartService.getCart(userId);
            List<CartItem> cartItems = cartService.userCartView(cart);

            model.addAttribute("cartItemList", cartItems);
            model.addAttribute("cart", cart);

            return "/order/order_paymentPage";
        }

    }

  /*  *//*결제페이지로 넘기기*//*
    @PostMapping("/paymentPage/{userId}")
    public String orderPayment(@PathVariable("userId") String userId, Model model, @ModelAttribute("deliveryType") String cart1) {
        cartService.saveCartInfo(userId,cart1);
        Cart cart = cartService.getCart(userId);
        List<CartItem> cartItems = cartService.userCartView(cart);

        model.addAttribute("cartItemList",cartItems);
        model.addAttribute("totalPrice",cart.getCartTotalPrice());
        model.addAttribute("deliveryPrice",cart.getCartDeliveryPrice());

        return "/order/order_paymentPage"; // 카카오페이 결제 페이지로 이동
    }

    // 결제 성공 시, paymentResult.jsp로 리다이렉트
    @PostMapping("/paymentResult")
    public String paymentResult() {
        return "/paymentResult";
    }*/




}