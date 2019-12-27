package cot.colabare.video.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j

public class VIdeoChatController {

	@RequestMapping(value = "/video/videochat", method = RequestMethod.GET)
	public String Video(Model model) {
		log.info("video");

		return "video/videochat";
	}

}
