package cot.colabare.profile.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import cot.colabare.profile.domain.ProfileAttachDto;
import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@Log4j
public class UploadController {
   
	// 특정 파일이 이미지 타입인지 검사하는 메서드
	private boolean checkImageType(File file){
		try {
			String contentType = Files.probeContentType(file.toPath());
			
			return contentType.startsWith("image");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}
	
	
   private String getFolder(){
      SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
      Date date = new Date();
      String str = sdf.format(date);
      return str.replace("-", File.separator);
   }
   
   
   // 서버에서 첨부파일의 삭제
   @PostMapping("/deleteFile")
   @ResponseBody
   public ResponseEntity<String> deleteFile(String fileName, String type) {
	
	   log.info("deleteFile: " + fileName);
	
		File file;
	
		try {
			
			file = new File("c:\\upload\\profile\\" + URLDecoder.decode(fileName, "UTF-8"));
	
			file.delete();
	
			if (type.equals("image")) {
	
				// 이미지의 경우 섬네일 존재. 파일 이름 중간에 s_가 들어있다. 이 부분 변경해서 원본 이미지 파일도 삭제하도록 처리
				String largeFileName = file.getAbsolutePath().replace("s_", "");
	
				log.info("largeFileName: " + largeFileName);
	
				file = new File(largeFileName);
	
				file.delete();
			}
	
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
	
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	
	}
   
   // 다운로드 이름 지정 메소드
   @GetMapping(value="/download", produces=MediaType.APPLICATION_OCTET_STREAM_VALUE)
   @ResponseBody
   public ResponseEntity<Resource> downloadFile( @RequestHeader("User-Agent") String userAgent, String fileName){
	   
	   log.info("download file : " + fileName);
	   
	   Resource resource = new FileSystemResource("c:\\upload\\profile\\" + fileName);
	   
	   log.info("resource : " + resource );
	   
	   if(resource.exists() == false){
		   
		   return new ResponseEntity<>(HttpStatus.NOT_FOUND);
	   }
	   
	   String resourceName = resource.getFilename(); 	// 전체 경로
	   
	   // remove UUID
	   String resourceOriginalName = resourceName.substring(resourceName.indexOf("_") + 1);
	   
	   HttpHeaders headers = new HttpHeaders();
	   
	   try {
		   
		   String downloadName = null;
		   
		   if(userAgent.contains("Trident")){
			   
			   log.info("IE brower");
			   downloadName = URLEncoder.encode(resourceOriginalName, "UTF-8").replaceAll("\\+", " "); 
		   
		   }else if(userAgent.contains("Edge")){
			
			   log.info("Edge browser");
			   downloadName = URLEncoder.encode(resourceOriginalName, "UTF-8").replaceAll("\\+", " "); 
			   
		   }else{
			   
			   log.info("Chrome browser");
			   downloadName = new String(resourceOriginalName.getBytes("UTF-8"), "ISO-8859-1");
			}
		   
		   log.info("downloadName : " + downloadName);

			headers.add("Content-Disposition", "attachment; filename=" + downloadName);

		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);
	}
   
   
   @GetMapping("/uploadForm")
   public void uploadForm() {
      log.info("uploadForm");
   }

  
   
   @GetMapping("/display")
   @ResponseBody
   public ResponseEntity<byte[]> getFile(String fileName){
	   
	   log.info("fileName : " + fileName);
	   File file = new File("c:\\upload\\profile\\" + fileName);
	   
	   log.info("file : " + file);
	   
	   ResponseEntity<byte[]> result = null;
	   
	   try {
		HttpHeaders header = new HttpHeaders();
		
		header.add("Content-Type", Files.probeContentType(file.toPath()));
		result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	   return result;
   }

   @GetMapping("/uploadAjax")
   public void uploadAjax() {
      log.info("upload ajax");
   }
   
   
   

}