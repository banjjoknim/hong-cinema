package org.gasan.mapper;

import java.util.List;

import org.gasan.domain.PaymentHistoryVO;

public interface HistoryServiceMapper {
	
	public List<PaymentHistoryVO> getPaymentHistory();

}
