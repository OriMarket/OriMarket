package com.choongang.OriMarket.order;
import com.choongang.OriMarket.manager.user.ManagerUser;
import com.choongang.OriMarket.rider.Rider;
import com.choongang.OriMarket.user.User;
import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import lombok.*;
import lombok.extern.log4j.Log4j2;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;
import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "new_orders")
@Getter
@Setter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Log4j2
//시간에 대해 자동으로 값을 넣어주는 기능
//해당 클래스에 Auditing 기능을 포함
@EntityListeners(AuditingEntityListener.class)
public class NewOrder {

    @Id
    @Column(name = "new_order_seq")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long newOrderSeq;

    @Column
    private String orderNumber;

    @Column
    private String itemId1;

    @Column
    private  String orderGoodsNum;

    @Column
    private String orderStatus;

    //배송비
    @Column
    private  String orderDeliveryPrice;

    //배달 타입
    @Column
    private String deliveryType;

    //배달기사 요청사항
    @Column
    private String forRider;

    //물건 총 가격
    @Column
    private String orderGoodsTotalPrice;

    //물건 총 가격 + 배송비
    @Column
    private Integer orderTotalPrice;

    @Column
    private String orderMarketName;

    //신용카드 결제 종류
    @Column
    private String orderType;

    //요청사항
    @Column
    private String orderRequests;

    @JsonIgnore
    @OneToOne(fetch =  FetchType.LAZY)
    @JoinColumn(name = "seq")
    private User user;

    //매니저 번호
    @JsonBackReference // 순환 참조 막는 어노테이션
    @ManyToOne(fetch =  FetchType.LAZY)
    @JoinColumn(name="managerSeq")
    private ManagerUser managerUser;

    @JsonIgnore // 순환 참조 안되게! null
    @OneToOne(fetch =  FetchType.LAZY)
    @JoinColumn(name="rider_seq")
    private Rider rider;

    //생성일
    @Column
    private String createdDate;

    //수정일
    @LastModifiedDate
    private LocalDateTime modifiedDate;

    @JsonManagedReference
    @OneToMany(mappedBy = "newOrder")
    private List<NewOrderDetail> newOrderDetails = new ArrayList<>();

    @Column
    private String orderAddress;

    @Transient
    private String calculate_date;

    //끝나는 날짜
    @Transient
    private String calculate_date_last;

}
