package org.gasan.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;

import javax.mail.Multipart;
import javax.servlet.http.HttpServletRequest;

import org.gasan.domain.MovieVO;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class UploadController {
	
	@GetMapping("/uploadAjax")
	public void uploadAjax() {
		
		log.info("upload ajax");
	}
	
	@PostMapping(value = "/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public void uploadAjaxPost(MultipartFile[] poster) {
		
		log.info("update ajax post...");
		
		String uploadFolder = "C:\\WorkSpace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\final\\resources\\upload";
	
		
		for (MultipartFile multipartFile : poster) {
			
			log.info("-------------------------");
			log.info("Upload File Name: " +multipartFile.getOriginalFilename());
			log.info("Upload file Size: " +multipartFile.getSize());
			
			String uploadFileName = multipartFile.getOriginalFilename();
			
			log.info("only file name: " + uploadFileName);
			
			File saveFile = new File(uploadFolder, uploadFileName);

			try {
				multipartFile.transferTo(saveFile);
			
			} catch (Exception e) {
				
				e.printStackTrace();
			
			}//end catch
			
		}//end for
		
	}
	
	@PostMapping(value = "/uploadAjaxActionModify", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public void uploadAjaxPostModify(MovieVO mo, @RequestParam(name="poster") MultipartFile[] poster, HttpServletRequest req) {
		
		log.info("update ajax post...");
		
		String uploadFolder = "C:\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\final(total)2\\resources\\upload";
		
		for (MultipartFile multipartFile : poster) {
			
			log.info("-------------------------");
			log.info("Upload File Name: " +multipartFile.getOriginalFilename());
			log.info("Upload file Size: " +multipartFile.getSize());
			
			
			
			 // 새로운 파일이 등록되었는지 확인
			 if(multipartFile.getOriginalFilename() != null && multipartFile.getOriginalFilename() != "") {
			  // 기존 파일을 삭제
			  new File(uploadFolder + req.getParameter("poster")).delete();
			  // 새로 첨부한 파일을 등록
			  
			  String uploadFileName = multipartFile.getOriginalFilename();
			  log.info("only file name: " + uploadFileName);
			  File saveFile = new File(uploadFolder, uploadFileName);
			  
			  try {

					multipartFile.transferTo(saveFile);
				
				} catch (Exception e) {
					
					e.printStackTrace();
				
				}//end catch
			 
			 } else {  // 새로운 파일이 등록되지 않았다면
			  // 기존 이미지를 그대로 사용
			  mo.setPoster(req.getParameter("poster"));
			  
			 }
		
			
		}//end for
		
	}
	
	
	@GetMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String fileName) {
		
		log.info("fileName: " + fileName);
		
		File file = new File("c:\\upload\\" + fileName);
		
		log.info("file: " + file);
		
		ResponseEntity<byte[]> result = null;
		
		HttpHeaders header = new HttpHeaders();
		
		try {
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
		
	}
}
