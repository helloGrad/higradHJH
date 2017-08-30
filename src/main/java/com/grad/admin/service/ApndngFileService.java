package com.grad.admin.service;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.grad.admin.repository.ApndngFileDao;
import com.grad.admin.vo.ApndngFileVo;

@Service
public class ApndngFileService {
	
	@Autowired 
	ApndngFileDao apndngFileDao;
	
	ApndngFileVo vo=null;
	private static final String SAVE_PATH = "/uploads";
	private static final String PREFIX_URL = "/uploads/";
	
	public String restore(MultipartFile multipartFile) {

		String url = "";


		try{
			if(multipartFile.isEmpty()==true){
				return url;
			}

			String orginalFileName = multipartFile.getOriginalFilename();
			String extName = orginalFileName.substring(orginalFileName.lastIndexOf('.'), orginalFileName.length());
			Long fileSize = multipartFile.getSize();
			String saveFileName = genSaveFileName(extName);

//			System.out.println("##########");
//			System.out.println("fileName = "+ orginalFileName + ", fileSzie = "+fileSize + ", extName = " + extName + ", saveFileName = " + saveFileName);
//			System.out.println("##########");

			wrtieFile(multipartFile, saveFileName);
			
			url = PREFIX_URL + saveFileName;
			
			setFileVo(orginalFileName, fileSize, extName, url);
		} catch (IOException e) {
			throw new RuntimeException(e); 
		}
		return url;
	}

	private void wrtieFile(MultipartFile multipartFile, String saveFileName) throws IOException {
		byte[] fileDate = multipartFile.getBytes();
		
		FileOutputStream fos = new FileOutputStream(SAVE_PATH+"/"+saveFileName);
		fos.write(fileDate);
		fos.close();
	}

	private String genSaveFileName(String extName) {
		// TODO Auto-generated method stub
		String fileName = "";

		Calendar calendar = Calendar.getInstance();

		fileName = fileName + calendar.get(Calendar.YEAR);
		fileName = fileName + calendar.get(Calendar.MONTH);
		fileName = fileName + calendar.get(Calendar.DATE);
		fileName = fileName + calendar.get(Calendar.HOUR);
		fileName = fileName + calendar.get(Calendar.MINUTE);
		fileName = fileName + calendar.get(Calendar.SECOND);
		fileName = fileName + calendar.get(Calendar.MILLISECOND);
		fileName = fileName + extName;

		return fileName;
	}

	public boolean insert(ApndngFileVo vo) {
		
		return apndngFileDao.insert(vo);
		
	}
	
	public void setFileVo(String orginalFileName, Long fileSize, String extName, String url) {
		vo = new ApndngFileVo();
		
		vo.setApndngFileNm(orginalFileName);
		vo.setApndngFileSize(fileSize);
		vo.setApndngFileEtsionNm(extName);
		vo.setStorgPath(url);
		
		
	}
	public ApndngFileVo getFileVo() {
		return vo;
	}

	public ApndngFileVo getFileInfo(Long id) {
		// TODO Auto-generated method stub
		return apndngFileDao.getFileInfo(id);
	}

	public List<ApndngFileVo> getFileList(int no, String type) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("no", no);
		map.put("type", type);
		return apndngFileDao.getFileList(map);
	}
	
	

}