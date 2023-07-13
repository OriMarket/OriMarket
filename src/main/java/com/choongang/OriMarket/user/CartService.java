//package com.choongang.OriMarket.user;
//
//import com.choongang.OriMarket.order.OrderService;
//import com.choongang.OriMarket.store.Item;
//import com.choongang.OriMarket.store.ItemRepository;
//import lombok.RequiredArgsConstructor;
//import lombok.extern.slf4j.Slf4j;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//
//import javax.transaction.Transactional;
//import java.util.ArrayList;
//import java.util.List;
//
//@Service
//@RequiredArgsConstructor
//@Slf4j
//public class CartService {
//
//    @Autowired
//    private final UserRepository userRepository;
//    private final CartRepository cartRepository;
//    private final CartItemRepository cartItemRepository;
//
///*
//      ItemRepository에서 해당Itemid, UserRepository에서 해당 Userid검색
//        * CartRepository에서 Userid로 검색해서 만약 카트가 null이라면 >>> createcart
//
//       CartItemRepository에서 저장된 카트아이템검색(CartId,Itemid)
//        * 저장된 카트아이템이 null이 아니라면 addCount, null이라면 createCartItem
// */
//
//
//    //장바구니 생성
//    public void createCart(User user){
//        Cart cart = Cart.createCart(user);
//        cartRepository.save(cart);
//    }
//
//    //장바구니에 item추가
//    @Transactional
//    public void addCart(User user, Item item, int count) {
//
//        Cart cart = cartRepository.findByUserId(user.getUserId());
//
//        /*cart가 없다면 새로 생성*/
//        if (cart == null) {
//            cart = Cart.createCart(user);
//            cartRepository.save(cart);
//        }
//
//        /*cartItem생성*/
//        CartItem cartItem = cartItemRepository.findByCartIdAndItemId(cart.getCartId(), item.getItemId());
//
//        /*cartItem이 없다면 새로 생성*/
//        if (cartItem == null) {
//            cartItem = CartItem.createCartItem(cart, item, count);
//            cartItemRepository.save(cartItem);
//            cart.setCartCnt(cart.getCartCnt() + 1);
//        } else {
//            cartItem.addCount(count);
//        }
//
//    }
//
//
//    //장바구니 조회하기
//
//    public List<CartItem> userCartView(Cart cart){
//        List<CartItem> cartItems = cartItemRepository.findAll();
//        List<CartItem> userItems = new ArrayList<>();
//
//        for(CartItem cItem : cartItems){
//            if(cItem.getCart().getCartId() == cart.getCartId()){
//                userItems.add(cItem);
//            }
//        }
//        return userItems;
//    }
//
//
//
//    //장바구니 Item삭제
//    public void cartItemDelete(Long cartItemId){
//        cartItemRepository.deleteById(cartItemId);
//    }
//
//
//
//    //장바구니 전체삭제
//    public void cartDelete(String userId){
//        List<CartItem> cartItems = cartItemRepository.findAll();
//
//        /*접속유저의 cartItem만 찾아서 삭제*/
//        for(CartItem cartItem : cartItems){
//            if(cartItem.getCart().getUser().getUserId() == userId){
//                cartItem.getCart().setCartCnt(cartItem.getCart().getCartCnt()-1);
//                cartItemRepository.deleteById(cartItem.getCartItemId());
//            }
//        }
//    }
//
//
//    //장바구니 결제
//    @Transactional
//    public void cartPayment(String userId){
//        List<CartItem> cartItems = cartItemRepository.findAll();
//        List<CartItem> userCartItems = new ArrayList<>();
//        User buyer = userRepository.findByUserId(userId);
//
//        /*접속한 유저의 cartItem만 찾아서 저장*/
//        for(CartItem cartItem : cartItems){
//            if(cartItem.getCart().getUser().getUserId()==buyer.getUserId()){
//                userCartItems.add(cartItem);
//            }
//        }
//        /*재고 변경하기*/
//        for(CartItem cartItem : userCartItems){
//            /*현재 재고를 변수에 저장*/
//            int stock =cartItem.getItem().getItemCnt();
//            /*저장된 변수에서 결제한 갯수를 빼준다..*/
//            stock = stock-cartItem.getCount();
//            /*현 재고 변경*/
//            cartItem.getItem().setItemCnt(stock);
//
//        /*금액처리?*/
////            User seller = cartItem.getItem().getUser();
////            int cash =  cartItem.getItem().getItemPrice();
////            buyer.setMoney(cash * -1);
////            seller.setMoney(cash);
//        }
//
//
//
//    }
//
//
//}
