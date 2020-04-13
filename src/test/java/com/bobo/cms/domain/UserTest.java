package com.bobo.cms.domain;

import static org.junit.Assert.*;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;

import org.junit.Test;

public class UserTest {

	@Test
	public void testGetId() throws FileNotFoundException, IOException {

		File file = new File("E:\\user\\user.txt");

		// new 创建了对象
		User user = new User();
		user.setUsername("lucy");
		user.setId(100);
		// 对user对象进行序列化 即 把内存的对象，写入硬盘上
		ObjectOutputStream oout = new ObjectOutputStream(new FileOutputStream(file));
		  oout.writeObject(user);
		  oout.close();
		  
		  
	}

	
	@Test//反序列化。从硬盘读取文件生成 对象
	public void test2() throws FileNotFoundException, IOException, ClassNotFoundException {

		File file = new File("E:\\user\\user.txt");

		   ObjectInputStream oin = new ObjectInputStream(new FileInputStream(file));
		    Object newUser = oin.readObject();
		    oin.close();
		    System.out.println(newUser);
		  
		  
	}
	
	@Test
	public void test3() {
		String str="abc";
		String str2=new String("abc");
		
		System.out.println(str==str2);
		System.out.println(str.equals(str2));
		
	}
}
