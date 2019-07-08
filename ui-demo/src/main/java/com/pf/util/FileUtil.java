package com.pf.util;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

import com.pf.entity.Attachment;

public class FileUtil {
	
	private static Logger logger = LoggerFactory.getLogger(FileUtil.class);

	/**
	 * 上传单文件
	 * @param request
	 * @param file
	 * @return
	 */
	public static Attachment uploadSingleFile(HttpServletRequest request,MultipartFile file) {
		String realPath = request.getServletContext().getRealPath("/upload");
		String originalFileName = file.getOriginalFilename();
		String fileType = originalFileName.substring(originalFileName.indexOf(".")+1);
		File tempFile = new File(realPath+"/"+UUID.randomUUID()+"."+fileType);
		File parentPath = new File(tempFile.getParent());
		if(!parentPath.exists()) {
			parentPath.mkdirs();
		}
		try {
			//上传文件
			file.transferTo(tempFile);
			//组装文件数据
			Attachment attachment = new Attachment();
			attachment.setFileName(originalFileName);
			attachment.setFileRealPath(tempFile.getPath().substring(tempFile.getPath().indexOf("upload")));
			attachment.setFileSize(file.getSize());
			attachment.setFileType(fileType);
			return attachment;
		} catch (IllegalStateException e) {
			e.printStackTrace();
			logger.error(e.getMessage());
		} catch (IOException e) {
			e.printStackTrace();
			logger.error(e.getMessage());
		}
		return null;
	}
	
}
