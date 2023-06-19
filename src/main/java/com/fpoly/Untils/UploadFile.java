package com.fpoly.Untils;

import java.io.File;
import java.io.IOException;

import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class UploadFile implements Converter<MultipartFile[], String[]> {
	public File handleUploadFile(MultipartFile[] multipleFile) {
		String pathSys = System.getProperty("user.dir");
		File pathSave = new File(pathSys + "\\src\\main\\webapp\\img");
		if (!pathSave.exists()) {
			pathSave.mkdirs();
		}
		File saveFile = null;
		if(multipleFile == null) {
			return saveFile;
		}
			for (int i = 0; i < multipleFile.length; i++) {
				try {
					String fileName = multipleFile[i].getOriginalFilename();
					saveFile = new File(pathSave, fileName);
					multipleFile[i].transferTo(saveFile);
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
			}
			return saveFile;
	}

	@Override
	public String[] convert(MultipartFile[] multipartFiles) {
		String[] fileNames = new String[multipartFiles.length];
		for (int i = 0; i < multipartFiles.length; i++) {
			fileNames[i] = multipartFiles[i].getOriginalFilename();
		}
		return fileNames;
	}

}
