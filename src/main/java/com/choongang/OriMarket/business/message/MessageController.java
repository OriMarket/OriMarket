package com.choongang.OriMarket.business.message;

import com.choongang.OriMarket.business.user.BusinessUser;
import com.choongang.OriMarket.business.user.BusinessUserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequiredArgsConstructor
@Slf4j
public class MessageController {

    @Autowired
    private final MessageService messageService;

    //메세지 목록 입장 및 출력
    @GetMapping("/messageInsert")
    public String messageInsert(@ModelAttribute Message message, Model model,HttpSession session, BusinessUser businessUser){
            businessUser.setBuUserNumber(Long.valueOf(session.getAttribute("buUserNumber").toString()));
            List<Message> resultMessage = messageService.getMessages(businessUser,model);
            model.addAttribute("resultMessage",resultMessage);
        System.out.println(resultMessage);
        return "business/businessMessage/business_message";
    }
    @GetMapping("/businessInsertMessage")
    public String businessInsertMessage(){
        return "business/businessMessage/message_insert";
    }

    //메세지 상세 조회
    @GetMapping("/message_detail/{messageId}")
    public String businessDetailMessage(@PathVariable("messageId")String messageId,Model model){

      Long editMessageId = Long.valueOf(messageId);
      Message getmessage = messageService.getDetailMessage(editMessageId);
      model.addAttribute("getmessages",getmessage);

      return "business/businessMessage/business_detail_message";
    }

    //수정 이동
    @GetMapping("/message_edit/{messageId}")
    public String businessEditPage(@PathVariable("messageId")String messageId,Model model){

      Long editMessageId = Long.valueOf(messageId);
      Message getmessage = messageService.getDetailMessage(editMessageId);
      model.addAttribute("getmessages",getmessage);

      return "business/businessMessage/business_edit_message";
    }

    //삭제
    @GetMapping("/message_delete/{messageId}")
    public  String messageDelete(@PathVariable("messageId")String messageId){
        Long editMessageId = Long.valueOf(messageId);
        messageService.getDeleteMessage(editMessageId);

        return "redirect:/messageInsert";
    }

    //수정
    @PostMapping("message_edit/{messageId}")
    public String businessEditMessage(@PathVariable("messageId")String messageId,@ModelAttribute Message messages, Model model,BusinessUser businessUser,HttpSession session){

        Date date = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String today = dateFormat.format(date);

        Long editMessageId = Long.valueOf(messageId);
        businessUser.setBuUserNumber(Long.valueOf(session.getAttribute("buUserNumber").toString()));

        messages.setMessageId(editMessageId);
        messages.setBuUserNumber(businessUser);
        messages.setMessageInsertDate(today);

        boolean m = messageService.getEditMessage(messages);
        if(m){
            return "redirect:/messageInsert";
        }else{
            return "message_edit/"+messageId;
        }
    }

   //메세지 등록
    @PostMapping("/messageInsert")
    public String messageInsertNew(@ModelAttribute Message messages,BusinessUser businessUser, HttpSession session){

        System.out.println("메세지:"+messages.getTotalMessage());
        System.out.println("사업자번호:"+session.getAttribute("buUserNumber").toString());
        Long buUserNumber = Long.parseLong(session.getAttribute("buUserNumber").toString());
        businessUser.setBuUserNumber(buUserNumber);
        messages.setBuUserNumber(businessUser);

        messageService.insertMessage(messages);
        return "redirect:/messageInsert";
    }


}