package com.choongang.OriMarket.manager.user;

import com.choongang.OriMarket.business.market.Market;
import com.choongang.OriMarket.order.NewOrder;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import lombok.*;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name="manager_user")
@Getter
@Setter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class ManagerUser {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private Long managerSeq;

    @Column
    private String managerId;

    @Column
    private String managerPassword;

    @Column
    private String managerName;

    @Column
    private String managerPhone;

    @Column
    private String managerEmail;

    //시장 seq
    @ManyToOne
    @JoinColumn(name = "marketSeq")
    private Market market;

    @JsonManagedReference
    @OneToMany(mappedBy = "managerUser")
    private List<NewOrder> orders = new ArrayList();
}

