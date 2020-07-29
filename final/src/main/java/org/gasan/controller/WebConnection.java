package org.gasan.controller;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import org.springframework.stereotype.Component;

public class WebConnection{
	public String json;
	public WebConnection() throws Exception{
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		Calendar today = Calendar.getInstance();
		today.add(Calendar.DATE, -1);
		String yesterday = sdf.format(today.getTime()); //어제 날짜로 박스오피스 정보 받아오기.
//		System.out.println(today.get(Calendar.DATE));
//		System.out.println(sdf.format(today.getTime()));
		String address = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=09a9ba7f2b8c18c566fb30f6ee83ae4f&targetDt="+yesterday;
		BufferedReader br;
		URL url;
		HttpURLConnection conn;
		String protocol = "GET";

		url = new URL(address);
		conn = (HttpURLConnection)url.openConnection();
		conn.setRequestMethod(protocol);
		br = new BufferedReader(new InputStreamReader(conn.getInputStream()));


		json = br.readLine(); //읽어옴
	}

}

