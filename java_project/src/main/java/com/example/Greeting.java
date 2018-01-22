package com.example;

public class Greeting {
    public static void sayHi() {
    	    	String jar = System.getProperty("plugin.jar.location");
		System.out.println("jar: " + jar);
        System.out.println("Hi!");
    }
}
