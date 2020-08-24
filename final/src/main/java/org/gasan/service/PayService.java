package org.gasan.service;

import org.gasan.domain.SeatReservationVO;
import org.gasan.domain.SelectedScheduleVO;

public interface PayService {

    public void pay(SelectedScheduleVO selectedScheduleVO, SeatReservationVO seatReservationVO, String seatList,
            String merchant_uid, String userId);

    public String createPaymentNumber();
}
