package com.choongang.OriMarket.store;

import com.choongang.OriMarket.business.store.BusinessStore;
import com.choongang.OriMarket.business.user.BusinessUser;
import com.choongang.OriMarket.review.Review;
import com.choongang.OriMarket.user.CartItem;
import com.choongang.OriMarket.user.User;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import javax.print.attribute.standard.MediaSize;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "goods")
@Getter
@Setter
public class Item {

    @Id
    @Column(name = "item_id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long itemId;

    @Column
    private String itemName;

    @Column
    private Integer itemCnt;

    @Column
    private Integer itemCost;

    @Column
    private Integer itemPrice;

    @Column
    private Integer itemG;

    @Column
    private String itemFrom;

    @Column
    private String itemRegDate;

    @Column
    private String itemInfo;

    @Column
    private String itemCategory;

    @ManyToOne(fetch = FetchType.LAZY) //lazy가 성능최적화
    @JoinColumn(name ="bu_store_number")
    private BusinessStore businessStore;

    @OneToMany(mappedBy = "item")
    private List<Review> reviews = new ArrayList<>();

    @OneToMany(mappedBy = "item")
    private List<CartItem> cartItems = new ArrayList<>();


}

