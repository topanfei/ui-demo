package com.pf.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.pf.entity.Attachment;
import com.pf.util.FileUtil;

@Controller
@RequestMapping("/file")
public class FileController {

	private static Logger logger = LoggerFactory.getLogger(FileController.class);
	
	@RequestMapping("/singleUpload")
	@ResponseBody
	public Attachment singleUpload(HttpServletRequest request,
			@RequestParam("file") MultipartFile file) {
		logger.info("单文件上传...");
		Attachment attachment = FileUtil.uploadSingleFile(request, file);
		return attachment;
	}
}
