/*package cot.colabare.approval.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/approval/")
@RestController
@Log4j
@AllArgsConstructor
public class ApprovalController {
	
	// 서비스 입력
	
	*//** * 캡쳐된 화면 서버 저장 * @param request * @return * @throws Exception *//* 
	@RequestMapping(value="/imageCreate.ajax") 
	public ModelAndView createImage (HttpServletRequest request) throws Exception{ 
		String binaryData = request.getParameter("imgSrc"); 
		FileOutputStream stream = null; 
		ModelAndView mav = new ModelAndView(); 
		mav.setViewName("jsonView"); 
		
		try{ 
			
			System.out.println("binary file " + binaryData); 
			if(binaryData == null || binaryData=="") { 
					throw new Exception(); 
					} 
			binaryData = binaryData.replaceAll("data:image/png;base64,", ""); 
			byte[] file = Base64.decodeBase64(binaryData); 
			System.out.println("file :::::::: " + file + " || " + file.length); 
			String fileName= UUID.randomUUID().toString(); 
			stream = new FileOutputStream("d:\\test2\\"+fileName+".png"); 
			stream.write(file); stream.close(); 
			System.out.println("파일 작성 완료"); 
			mav.addObject("msg","ok"); 
			
		}catch(Exception e){ 
			
			System.out.println("파일이 정상적으로 넘어오지 않았습니다"); 
			mav.addObject("msg","no"); 
			
			return mav; 
			
			}finally{ 
				stream.close(); 
				} 
		return mav; 
	}
	
	

}
*/