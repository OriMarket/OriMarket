package com.choongang.OriMarket.rider;

import com.choongang.OriMarket.business.market.Market;
import com.choongang.OriMarket.business.market.MarketRepository;
import com.choongang.OriMarket.order.NewOrder;
import com.choongang.OriMarket.utill.ImageService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.List;


@Controller
@RequiredArgsConstructor
@Slf4j //log.error("Error occurred while deleting riders: {}", e.getMessage()); 이거쓸라고하는거임
public class RiderController {

    @Autowired
    private final RiderService riderService;
    private final ImageService imageService;
    private final MarketRepository marketRepository;
    private final RiderRepository riderRepository;

    @GetMapping("/rider_list")
    public String riderlist(Model model) {
        List<Rider> riders = riderService.getAllRiders();
        model.addAttribute("riders", riders);
        return "admin/admin_rider";
    }

    @DeleteMapping("/delete_riders")
    public ResponseEntity<String> deleteSelectedRiders(@RequestBody List<String> riderIds) {
        try {
            riderService.deleteRiders(riderIds); // RiderService의 deleteRiders 메서드 호출
            return ResponseEntity.ok("success");
        } catch (Exception e) {
            log.error("Error occurred while deleting riders: {}", e.getMessage());
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error occurred while deleting riders.");
        }
    }

    @GetMapping("/rider_detail")
    public String rider_Detail() {
        return "rider/rider_detail";
    }

    @GetMapping("/rider_login")
    public String riderLogin() {
        return "rider/rider_login";
    }

    @PostMapping("/rider_login")
    public String riderLogin1(@ModelAttribute Rider rider, HttpSession session, Model model) {
        if (riderService.riderLogin(rider, session, model)) {
            return "rider/rider_main";
        } else {
            return "rider/rider_login";
        }
    }

    @GetMapping("/rider_join")
    public String riderJoin() {
        return "rider/rider_join";
    }

    @PostMapping("/rider_join")
    public String riderJoin1(@ModelAttribute Rider rider, HttpSession session, @RequestParam("pictureUrl") MultipartFile file) throws IOException {
        String s = imageService.saveRiderImage(file);
        if (riderService.riderJoin(rider, session, s)) {

            return "rider/rider_login";
        } else {
            return "rider/rider_join";
        }
    }

    @GetMapping("/riderId/{riderId}/exists")
    @ResponseBody
    public ResponseEntity<Boolean> checkUserIdDuplicate(@PathVariable String riderId) {
        return ResponseEntity.ok(riderService.checkRiderId(riderId));
    }

    @GetMapping("/rider_order_search")
    public String riderOrderSearch(Model model, HttpSession session) {
        List<NewOrder> orders = riderService.riderOrderSearch();
        model.addAttribute("orders", orders);

        Rider riderSeq = riderRepository.findById((Long) session.getAttribute("riderSeq")).orElseThrow();

        int pageNumber = 0;
        int pageSize = 4;
        Pageable pageable = PageRequest.of(pageNumber, pageSize);
        String orderStatus = "배달완료";
        String orderStatusNo = "주문거절";
        Page<NewOrder> resultPage = riderService.pageList(riderSeq, orderStatus, orderStatusNo, pageable);
        model.addAttribute("resultPage", resultPage);
        return "rider/rider_main";
    }

    @GetMapping("/rider_order_accept")
    public String riderOrderAccept(@RequestParam("orderNumber") String orderNumber, Model model, HttpSession session) {
        NewOrder newOrder = riderService.riderOrderAccept(orderNumber, session);
        model.addAttribute("orderaccept", newOrder);

        Rider riderSeq = riderRepository.findById((Long) session.getAttribute("riderSeq")).orElseThrow();

        int pageNumber = 0;
        int pageSize = 4;
        Pageable pageable = PageRequest.of(pageNumber, pageSize);
        String orderStatus = "배달완료";
        String orderStatusNo = "주문거절";
        Page<NewOrder> resultPage = riderService.pageList(riderSeq, orderStatus, orderStatusNo, pageable);
        model.addAttribute("resultPage", resultPage);
        return "rider/rider_main";
    }

    @GetMapping("/rider_order_accept1")
    public String riderOrderAccept1(@RequestParam("orderNumber") String orderNumber, Model model, HttpSession session) {
        NewOrder newOrder = riderService.riderOrderAccept1(orderNumber);
        model.addAttribute("orderaccept1", newOrder);

        Rider riderSeq = riderRepository.findById((Long) session.getAttribute("riderSeq")).orElseThrow();

        int pageNumber = 0;
        int pageSize = 4;
        Pageable pageable = PageRequest.of(pageNumber, pageSize);
        String orderStatus = "배달완료";
        String orderStatusNo = "주문거절";
        Page<NewOrder> resultPage = riderService.pageList(riderSeq, orderStatus, orderStatusNo, pageable);
        model.addAttribute("resultPage", resultPage);
        return "rider/rider_main";
    }

    @GetMapping("/rider_order_accept2")
    public String riderOrderAccept2(@RequestParam("orderNumber") String orderNumber, Model model, HttpSession session) {
        List<NewOrder> newOrders = riderService.riderOrderAccept2(orderNumber);
        model.addAttribute("orderaccept2", newOrders);

        Rider riderSeq = riderRepository.findById((Long) session.getAttribute("riderSeq")).orElseThrow();

        int pageNumber = 0;
        int pageSize = 4;
        Pageable pageable = PageRequest.of(pageNumber, pageSize);
        String orderStatus = "배달완료";
        String orderStatusNo = "주문거절";
        Page<NewOrder> resultPage = riderService.pageList(riderSeq, orderStatus, orderStatusNo, pageable);
        model.addAttribute("resultPage", resultPage);

        return "rider/rider_main";
    }

    @GetMapping("/deliveryLocation")
    public String deliveryLocation(@RequestParam("orderAddress") String orderAddress, Model model) {
        model.addAttribute("userAddress1", orderAddress);
        return "rider/rider_mylocation";
    }

    @GetMapping("/MarketLocation")
    public String MarketLocation(@RequestParam("marketName") String marketName, Model model) {
        Market byMarketName = marketRepository.findByMarketName(marketName);
        // 가정: 위도와 경도 값을 변수에 저장한 상태라고 가정합니다.
        double latitude = byMarketName.getMarketLatitude();
        double longitude = byMarketName.getMarketLongitude();

        // 원하는 포맷 패턴으로 DecimalFormat 인스턴스 생성
        DecimalFormat df = new DecimalFormat("#.######"); // 여섯 자리까지

        // DecimalFormat을 사용하여 위도와 경도를 포맷
        String formattedLatitude = df.format(latitude);
        String formattedLongitude = df.format(longitude);

        model.addAttribute("marketName", byMarketName.getMarketName());
        model.addAttribute("formattedLatitude", formattedLatitude);
        model.addAttribute("formattedLongitude", formattedLongitude);
        return "rider/rider_mylocation1";
    }

    @PostMapping("/riderResult")
    @ResponseBody
    public ResponseEntity<Page<NewOrder>> orderListResult(@RequestParam("page") int pageNumberReuslt, Model model, HttpSession session) {
        Rider riderSeq = riderRepository.findById((Long) session.getAttribute("riderSeq")).orElseThrow();
        int pageNumber = pageNumberReuslt;
        int pageSize = 4;
        Pageable pageable = PageRequest.of(pageNumber, pageSize);
        String orderStatus = "배달완료";
        String orderStatusNo = "주문거절";
        Page<NewOrder> resultPage = riderService.pageList(riderSeq, orderStatus, orderStatusNo, pageable);
        return ResponseEntity.ok(resultPage);
    }

}
