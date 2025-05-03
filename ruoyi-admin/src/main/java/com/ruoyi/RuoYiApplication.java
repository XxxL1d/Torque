package com.ruoyi;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

/**
 * 启动程序
 *
 * @author ruoyi
 */
@SpringBootApplication(exclude = { DataSourceAutoConfiguration.class })
public class RuoYiApplication
{
    public static void main(String[] args)
    {
        // System.setProperty("spring.devtools.restart.enabled", "false");
        SpringApplication.run(RuoYiApplication.class, args);
        System.out.println("Torque监控系统启动成功\n" +
                "___________                                    _____                .__  __                \n" +
                "\\__    ___/__________  ________ __   ____     /     \\   ____   ____ |__|/  |_  ___________ \n" +
                "  |    | /  _ \\_  __ \\/ ____/  |  \\_/ __ \\   /  \\ /  \\ /  _ \\ /    \\|  \\   __\\/  _ \\_  __ \\\n" +
                "  |    |(  <_> )  | \\< <_|  |  |  /\\  ___/  /    Y    (  <_> )   |  \\  ||  | (  <_> )  | \\/\n" +
                "  |____| \\____/|__|   \\__   |____/  \\___  > \\____|__  /\\____/|___|  /__||__|  \\____/|__|   \n" +
                "                         |__|           \\/          \\/            \\/                       ");
    }
}
