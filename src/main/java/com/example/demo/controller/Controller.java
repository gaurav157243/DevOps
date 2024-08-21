package com.example.demo;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.net.InetAddress;
import java.net.UnknownHostException;

@RestController
@RequestMapping("/api")
public class Controller {

    @GetMapping("/hello")
    public String helloWorld() {
        return "Hello World, how are you doing today?";
    }

    @GetMapping("/ip")
    public String getContainerIp() {
        try {
            // Get the IP address of the container
            InetAddress inetAddress = InetAddress.getLocalHost();
            String ip = inetAddress.getHostAddress();
            return "The IP address of the container is: " + ip;
        } catch (UnknownHostException e) {
            return "An error occurred: " + e.getMessage();
        }
    }
}
