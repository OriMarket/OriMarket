package com.choongang.OriMarket.business.store;

import com.choongang.OriMarket.business.user.BusinessUser;
import com.choongang.OriMarket.business.user.BusinessUserRepository;
import com.choongang.OriMarket.store.Store;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import javax.persistence.EntityManager;
import javax.servlet.http.HttpSession;
import java.util.Collection;
import java.util.List;
import java.util.Map;

@Service
//필드 생성자 자동 생성
@RequiredArgsConstructor
//추상화 역할 라이브러리
@Slf4j
public class BusinessStoreService {

    @Autowired
    private final BusinessStoreRepository businessStoreRepository;
    private final BusinessUserRepository businessUserRepository;

    public void save(BusinessStore businessStore, HttpSession session){
        Object buUserNumber = session.getAttribute("buUserNumber");
        BusinessUser businessUser = businessUserRepository.findById((Long)buUserNumber).orElseThrow();
        businessStore.setBusinessUser(businessUser);
        BusinessStore save = businessStoreRepository.save(businessStore);

        //사업자가 가지고있는 가게들 출력해본거
        List<BusinessStore> businessStores = save.getBusinessUser().getBusinessStores();

        for(BusinessStore businessStores1:businessStores){
            System.out.println("가게이름:"+businessStores1.getBuStoreName());
        }

    }



}
