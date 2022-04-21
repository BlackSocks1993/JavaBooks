package com.mvcProject.orderPage;

import java.util.List;
import com.mvcProject.product.ProductDTO;
import com.mvcProject.user.MemberDTO;


public interface OrderInterface {

	// 회원 정보 select
	MemberDTO selectMemberInfo(int memberNo); 

	
	// 상품 정보 select
	List<ProductDTO> selectProductList(List<String> product_no); 

	
	// 주문 정보 insert
	int addOrder(OrderDTO dto); 
	
	
	// order테이블의 order_no의 최댓값 받기(select하기)
	int selectOrderNo_max();
	
	
	// 주문상품 테이블 insert
	int addProductOrder(OrderProductDTO ord_pro_dto);
	
	
	
	
	
}
