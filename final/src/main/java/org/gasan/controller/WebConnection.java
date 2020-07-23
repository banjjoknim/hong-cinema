package org.gasan.controller;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import org.json.simple.JSONObject;
import org.json.simple.JSONArray;
import org.json.simple.parser.JSONParser;

class WebConnection{
	String json;
	WebConnection() throws Exception{
		String address = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=09a9ba7f2b8c18c566fb30f6ee83ae4f&targetDt=20200722";
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

	public static void main(String[] args) throws Exception {
		WebConnection wc = new WebConnection();
//		System.out.println(wc.json);
		JSONParser parser = new JSONParser();
		JSONObject obj = new JSONObject();
		obj = (JSONObject) parser.parse(wc.json);
		System.out.println(obj.get("boxOfficeResult"));
		JSONObject boxOfficeResult = (JSONObject) obj.get("boxOfficeResult");
//		System.out.println(boxOfficeResult.get("dailyBoxOfficeList"));
		JSONArray array = (JSONArray) boxOfficeResult.get("dailyBoxOfficeList");
		
		for(int i = 0; i< array.size(); i++) {
			JSONObject movie = (JSONObject) array.get(i);
			System.out.println(i+1+"번째 영화 : "+movie.get("movieNm"));
		}
		
		
		
	}
}

