package com.test;

import org.apache.maven.plugin.AbstractMojo;
import org.apache.maven.plugin.MojoExecutionException;
import org.apache.maven.plugins.annotations.Mojo;

import java.io.IOException;

/**
 * Says "Hi" to the user.
 */
@Mojo(name = "sayhi")
public class GreetingMojo extends AbstractMojo {
    public void execute() throws MojoExecutionException {


        String checkoutDir = System.getProperty("user.dir");
        String repoDir = checkoutDir + "/../../../.m2/repository/com/wix/maven-fake-module/1.0.0-SNAPSHOT/fake-maven-module-1.0.1-SNAPSHOT.jar";
        String projDir = checkoutDir + "/maven-fake-module/target/fake-maven-module-1.0.1-SNAPSHOT.jar";
        String command = "cp " + projDir +  " " + repoDir;

        getLog().info("Working Directory = " + checkoutDir);
        getLog().info("Repo Directory = " + repoDir);
        getLog().info("proj Directory = " + projDir);
        getLog().info("command = " + command);


        getLog().info("Copying...");
        Runtime rt = Runtime.getRuntime();
        try {
        Process pr = rt.exec(command);
        } catch (IOException e) {
            e.printStackTrace();
            throw new RuntimeException("Error!!!");
        }
        getLog().info("Finished Copying. value: " + pr.exitValue());

        getLog().info("Installing /home/builduser/agent14/work/204184abec719f44/maven-fake-module/1.0.0-SNAPSHOT/maven-fake-module-1.0.0-SNAPSHOT.jar to /home/builduser/.m2/repository/com/wix/maven-fake-module/1.0.0-SNAPSHOT/maven-fake-module-1.0.0-SNAPSHOT.jar");
    }
}