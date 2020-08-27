package org.gasan.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.gasan.domain.PaymentHistoryVO;

public interface HistoryServiceMapper {
	
	public List<PaymentHistoryVO> getPaymentHistory(@Param("userId") String userId);

	public void cancelPayment(@Param("paymentNumber") String paymentNumber);
}
