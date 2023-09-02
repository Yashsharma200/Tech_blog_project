package com.tech.blog.helper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

public class PicHelper {
	public static boolean deletePic(String path) {
		boolean flag = false;
		try {
			File f= new File(path);
			flag = f.delete();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return flag;
	}
	
	public static boolean savePic(InputStream in, String path) {
		boolean flag = false;
		try {
			
			byte [] b = new byte[in.available()];
			in.read(b);
			
			FileOutputStream fos = new FileOutputStream(path);
			fos.write(b);
			fos.flush();
			fos.close();
			flag = true;
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return flag;
	}
}

