package com.ruoyi.torque.websocket;

import java.io.IOException;
import java.util.concurrent.ConcurrentHashMap;
import java.util.Date;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.alibaba.fastjson2.JSON;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.torque.domain.TorqueData;
import com.ruoyi.torque.service.ITorqueDataService;

/**
 * WebSocket服务端点
 * 
 * @author ruoyi
 */
@ServerEndpoint("/websocket/torque/{clientId}")
@Component
public class TorqueWebSocketServer {
    
    private static final Logger log = LoggerFactory.getLogger(TorqueWebSocketServer.class);
    
    // 用于存储客户端会话信息
    private static final ConcurrentHashMap<String, Session> CLIENTS = new ConcurrentHashMap<>();
    
    // 注意：这种方式注入的是代理对象而不是实际实例
    private static ITorqueDataService torqueDataService;
    
    // 解决WebSocket中无法自动注入的问题
    @Autowired
    public void setTorqueDataService(ITorqueDataService torqueDataService) {
        TorqueWebSocketServer.torqueDataService = torqueDataService;
    }
    
    /**
     * 连接建立成功调用的方法
     */
    @OnOpen
    public void onOpen(Session session, @PathParam("clientId") String clientId) {
        CLIENTS.put(clientId, session);
        log.info("新的客户端连接，ID: {}, 当前在线数量: {}", clientId, CLIENTS.size());
    }
    
    /**
     * 连接关闭调用的方法
     */
    @OnClose
    public void onClose(@PathParam("clientId") String clientId) {
        CLIENTS.remove(clientId);
        log.info("客户端断开连接，ID: {}, 当前在线数量: {}", clientId, CLIENTS.size());
    }
    
    /**
     * 收到客户端消息后调用的方法
     */
    @OnMessage
    public void onMessage(String message, Session session, @PathParam("clientId") String clientId) {
        log.info("收到客户端 {} 的消息: {}", clientId, message);
        
        try {
            // 解析JSON数据
            TorqueData torqueData = JSON.parseObject(message, TorqueData.class);
            
            // 设置数据时间，如果客户端未提供则使用当前时间
            if (torqueData.getDataTime() == null) {
                torqueData.setDataTime(new Date());
            }
            
            // 保存扭矩数据
            if (torqueDataService != null) {
                int result = torqueDataService.insertTorqueData(torqueData);
                
                // 发送处理结果给客户端
                AjaxResult ajaxResult;
                if (result > 0) {
                    ajaxResult = AjaxResult.success("数据接收成功");
                } else {
                    ajaxResult = AjaxResult.error("数据保存失败");
                }
                sendMessage(session, JSON.toJSONString(ajaxResult));
            } else {
                log.error("torqueDataService未注入");
                sendMessage(session, JSON.toJSONString(AjaxResult.error("服务器内部错误")));
            }
        } catch (Exception e) {
            log.error("处理扭矩数据出错", e);
            sendMessage(session, JSON.toJSONString(AjaxResult.error("数据格式错误或处理失败")));
        }
    }
    
    /**
     * 发生错误时调用
     */
    @OnError
    public void onError(Session session, Throwable error) {
        log.error("WebSocket发生错误", error);
    }
    
    /**
     * 发送消息
     */
    private void sendMessage(Session session, String message) {
        try {
            session.getBasicRemote().sendText(message);
        } catch (IOException e) {
            log.error("发送消息出错", e);
        }
    }
    
    /**
     * 群发消息
     */
    public static void sendMessageToAll(String message) {
        CLIENTS.forEach((clientId, session) -> {
            try {
                session.getBasicRemote().sendText(message);
            } catch (IOException e) {
                log.error("群发消息出错", e);
            }
        });
    }
} 