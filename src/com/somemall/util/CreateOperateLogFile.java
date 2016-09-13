package com.somemall.util;

import java.io.File;
import java.io.IOException;

public class CreateOperateLogFile {
	public CreateOperateLogFile(File userlogfile) {
		
		if(userlogfile.exists()){
			userlogfile.delete();
		}
		try {
			userlogfile.createNewFile();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}