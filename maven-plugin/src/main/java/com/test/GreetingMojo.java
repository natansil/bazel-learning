package com.test;

import org.apache.maven.plugin.AbstractMojo;
import org.apache.maven.plugin.MojoExecutionException;
import org.apache.maven.plugins.annotations.Mojo;

/**
 * Says "Hi" to the user.
 *
 */
@Mojo( name = "sayhi")
public class GreetingMojo extends AbstractMojo
{
    public void execute() throws MojoExecutionException
    {
        getLog().info( "Installing /home/builduser/agent14/work/204184abec719f44/payment-framework/target/payment-framework-1.90.0-SNAPSHOT.jar to /home/builduser/.m2/repository/com/wixpress/payment/payment-framework/1.90.0-SNAPSHOT/payment-framework-1.90.0-SNAPSHOT.jar" );
    }
}