package com.pf.entity;

/**
 * 文件对象
 * @author panfei
 *
 */
public class Attachment {
	private Integer id;
	private String fileName;//文件名称
	private String fileRealPath;//文件相对路径
	private String fileType;//文件类型
	private long fileSize;//文件大小
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFileRealPath() {
		return fileRealPath;
	}
	public void setFileRealPath(String fileRealPath) {
		this.fileRealPath = fileRealPath;
	}
	public String getFileType() {
		return fileType;
	}
	public void setFileType(String fileType) {
		this.fileType = fileType;
	}
	public long getFileSize() {
		return fileSize;
	}
	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}
	
}
