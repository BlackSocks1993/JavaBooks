package com.mvcProject.orderPage;

import java.util.List;
import com.mvcProject.product.ProductDTO;
import com.mvcProject.user.MemberDTO;


public interface OrderInterface {

	MemberDTO selectMemberInfo(int memberNo); // 회원 정보 select

	List<ProductDTO> selectProductList(List<String> product_no); // 상품 정보 select

	int addOrder(OrderDTO dto); // 주문 정보 insert
	
}
