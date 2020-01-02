package cot.colabare.profile.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import cot.colabare.master.domain.UserDto;
import cot.colabare.profile.domain.EmployeeDto;
import cot.colabare.profile.domain.ModifyRequestDto;
import cot.colabare.profile.domain.ProfileAttachDto;
import cot.colabare.profile.domain.ProfileDto;
import cot.colabare.profile.service.ProfileService;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@Log4j
@RequestMapping(value="/profile/*", method=RequestMethod.POST)
@AllArgsConstructor
public class ProfileController {
	private ProfileService service;
	
	@Setter(onMethod_=@Autowired)
	private PasswordEncoder pwencoder;
	
	@GetMapping("/profile")
	public void detailProfile(HttpServletRequest request){
		
		
		HttpSession session=request.getSession();
		EmployeeDto employee=(EmployeeDto)session.getAttribute("employee");
		int employee_no=employee.getEmployee_no();
		
		ProfileDto profile=service.profileDetailService(employee_no);
		
		System.out.println(profile.getEmployee_img());
		request.setAttribute("profilepic", null);
		if(profile==null){
			service.insertProfileService(employee_no);
			profile=service.profileDetailService(employee_no);
		}
		if(profile.getEmployee_greeting()==null) {
			profile.setEmployee_greeting("안녕하세요! "+employee.getName()+"입니다.");
		}
		
		if(profile.getEmployee_img()!=null){
			ProfileAttachDto profilepic=service.selectProfilePicService(profile.getEmployee_img());
			String fileCallPath =  profilepic.getP_uploadPath()+ "/s_"+profilepic.getP_uuid() +"_"+profilepic.getP_fileName();
			request.setAttribute("profilepic", fileCallPath);
			session.setAttribute("profilepic",fileCallPath);
		}else{
			request.setAttribute("profilepic", null);
			session.setAttribute("profilepic",null);
		}
		request.setAttribute("profile", profile);
	}
	
	@GetMapping("/profilemodifyform")
	public void profileModifyForm(HttpServletRequest request){
		HttpSession session=request.getSession();
		ProfileDto profile=(ProfileDto)request.getAttribute("profile");
		request.setAttribute("profile", profile);
	}
	
	
	@GetMapping("/modifypass")
	public ResponseEntity<String> modifyPassword(HttpServletRequest request){
		HttpSession session=request.getSession();
		EmployeeDto employee=(EmployeeDto)session.getAttribute("employee");
		String password=request.getParameter("password");
		UserDto user=new UserDto();
		user.setEmployee_no(employee.getEmployee_no());
		user.setUserpw(pwencoder.encode(password));
		int success=service.modifyPassService(user);
		if(success>0){
			return new ResponseEntity<String>("success",HttpStatus.OK);
		}
		return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	@GetMapping("/modifygreeting")
	public ResponseEntity<String> modifyGreeting(HttpServletRequest request){
		HttpSession session=request.getSession();
		EmployeeDto employee=(EmployeeDto)session.getAttribute("employee");
		ProfileDto profile=new ProfileDto();
		profile.setEmployee_no(employee.getEmployee_no());
		profile.setEmployee_greeting((String)request.getParameter("employee_greeting"));
		
		int success=service.modifyGreetingService(profile);
		if(success>0){
			return new ResponseEntity<String>("success",HttpStatus.OK);
		}
		return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		
	}
	
	@GetMapping("/modifyreq")
	public ResponseEntity<String> sendModifyRequest(HttpServletRequest request){
		HttpSession session=request.getSession();
		
		EmployeeDto employee=(EmployeeDto)session.getAttribute("employee");
		
		ModifyRequestDto modifyreq=new ModifyRequestDto();
		modifyreq.setEmployee_no(employee.getEmployee_no());
		modifyreq.setModify_info((String)request.getParameter("modify_info"));
		
		int success=service.sendModifyReqService(modifyreq);
		if(success>0){
			return new ResponseEntity<String>("success",HttpStatus.OK);
		}
		return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	private String getFolder(){
	      SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	      Date date = new Date();
	      String str = sdf.format(date);
	      return str.replace("-", File.separator);
	   }
	
	 @PostMapping(value = "/uploadprofilepic", produces= MediaType.APPLICATION_JSON_UTF8_VALUE)
	   public String uploadAjaxPost(MultipartFile uploadFile, HttpServletRequest request) {

		  ProfileAttachDto profileimg = new ProfileAttachDto();
	      String uploadFolder = "c:\\upload\\profile";
	      String uploadFolderPath = getFolder();
	      int success_2=0;
	      
	      //make folder
	      File uploadPath = new File(uploadFolder, uploadFolderPath);
	      log.info("upload path: " + uploadPath);
	      
	      if(uploadPath.exists() == false){
	         uploadPath.mkdirs();
	      }
	      
	      // make yyyy/MM/dd folder
	      HttpSession session=request.getSession();
	      EmployeeDto emp=(EmployeeDto) session.getAttribute("employee");
	      profileimg.setEmployee_no(emp.getEmployee_no());
	     
	    	  
	         String uploadFileName = uploadFile.getOriginalFilename();	// 파일 원본 이름
	         
	         uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);
	         log.info("only file name :" + uploadFileName);
	         profileimg.setP_fileName(uploadFileName);
	         
	         UUID uuid = UUID.randomUUID();
	         
	         uploadFileName = uuid.toString() + "_" + uploadFileName;
	         

	         try {
	        	 File saveFile = new File(uploadPath, uploadFileName);
	        	 
	        	 uploadFile.transferTo(saveFile);
	        	 
	        	 profileimg.setP_uuid(uuid.toString());
	        	 profileimg.setP_uploadPath(uploadFolderPath);
	        	 
	        	 
	        		 FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));
	        		 
	        		 Thumbnailator.createThumbnail(uploadFile.getInputStream(), thumbnail, 300, 300);
	        		 
	        		 thumbnail.close();
	        	int success=service.insertProfilePicService(profileimg);
	        	if(success>0){
	        		success_2=service.updateProfilePicInfoService(profileimg);
	        	}
	        	 
	         } catch (Exception e) {
	            log.error(e.getMessage());
	         }
	      
	      return "redirect:/profile/profile";
	   }
	 
	 @GetMapping("/displayprofile")
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
}
