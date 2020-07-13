package com.nob.util;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.StringUtils;

import com.nob.controller.BoardController;

public class Hashtag {
	private static ArrayList<String> hashtags;
	
	private static final Logger logger=	LoggerFactory.getLogger(BoardController.class);
	
	public static void extractHashTagTest(String test) {

	 
		Pattern p = Pattern.compile("\\＃([0-9a-zA-Z가-힣]*)");
	    Matcher m = p.matcher(test);
	    String extractHashTag = null;
	   
	    hashtags = new ArrayList<>();
	    
	    while(m.find()) {
	    extractHashTag = sepcialCharacter_replace(m.group());
	 
	    if(extractHashTag != null) {
	        String nosharp =  extractHashTag.replace("＃","");
		     hashtags.add(nosharp);
	 
	    }
	  
	    }
	    
	    Iterator it = hashtags.iterator();
	    while(it.hasNext()){
	       System.out.println(it.next());                   
	    }
	  
	}
	 
	public static ArrayList<String> getHashtags() {
		return hashtags;
	}

	public void setHashtags(ArrayList<String> hashtags) {
		this.hashtags = hashtags;
	}

	public static String sepcialCharacter_replace(String str) {
		str = StringUtils.replace(str, "-_+=!@#$%^&*()[]{}|\\;:'\"<>,.?/~`） ","");
	 
	    if(str.length() < 1) {
	    return null;
	    }
	 
	    return str;
	}
	
}
