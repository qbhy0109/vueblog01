package com.markerhub.util;

import java.util.Date;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.Message.RecipientType;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeUtility;


public class MailUtil {

    // 发件人的 邮箱 和 密码（替换为自己的邮箱和密码）
    private static String ACCOUNT = "qbhy_2021@163.com";
    private static String PASSWORD = "DKWVJTNLTLPPANAX";

    // 发件人邮箱的 SMTP 服务器地址, 必须准确, 不同邮件服务器地址不同, 一般格式为: smtp.xxx.com
    // 网易163邮箱的 SMTP 服务器地址为: smtp.163.com
    private static String STMP_HOST = "smtp.163.com";

    public static void sendMail(String receiveMailAccount, String subject, String content) throws Exception{

        // 1. 创建参数配置, 用于连接邮件服务器的参数配置
        Properties props = new Properties();                     // 参数配置
        props.setProperty("mail.transport.protocol","smtp");     // 使用的协议（JavaMail规范要求）
        props.setProperty("mail.smtp.host",STMP_HOST);           // 发件人的邮箱的 SMTP 服务器地址
        props.setProperty("mail.smtp.auth","true");              // 需要请求认证

        // 2. 根据配置创建会话对象, 用于和邮件服务器交互
        Session session = Session.getInstance(props);
        session.setDebug(true);                                 // 设置为debug模式, 可以查看详细的发送 log
        // 3. 创建一封邮件
        MimeMessage message = createMimeMessage(session, ACCOUNT, receiveMailAccount, subject, content);
        // 4. 根据 Session 获取邮件传输对象
        Transport transport = session.getTransport();
        transport.connect(ACCOUNT, PASSWORD);
        // 6. 发送邮件, 发到所有的收件地址, message.getAllRecipients() 获取到的是在创建邮件对象时添加的所有收件人, 抄送人, 密送人
        transport.sendMessage(message, message.getAllRecipients());
        // 7. 关闭连接
        transport.close();

    }

    /**
     * 创建一封复杂邮件（文本+图片+附件）
     */
    public static MimeMessage createMimeMessage(Session session, String sendMail
            , String receiveMailAccount,String subject, String content) throws Exception {
        // 1. 创建邮件对象
        MimeMessage message = new MimeMessage(session);

        // 2. From: 发件人
        message.setFrom(new InternetAddress(sendMail, "qbhy", "UTF-8"));
        // 3. To: 收件人（可以增加多个收件人、抄送、密送）
        message.addRecipient(RecipientType.TO, new InternetAddress(receiveMailAccount, "靓仔/靓女", "UTF-8"));
        // 4. Subject: 邮件主题
        message.setSubject(subject, "UTF-8");

        message.setContent(content,"text/html;charset=UTF-8");
        // 12. 设置发件时间
        message.setSentDate(new Date());

        // 13. 保存上面的所有设置
        message.saveChanges();

        return message;

/*
        // 5. 创建图片“节点”
        MimeBodyPart image = new MimeBodyPart();
        DataHandler dh = new DataHandler(new FileDataSource("C:\\Users\\borui\\Desktop\\temp\\1.jpg")); // 读取本地文件
        image.setDataHandler(dh);                    // 将图片数据添加到“节点”
        image.setContentID("image_fairy_tail");        // 为“节点”设置一个唯一编号（在文本“节点”将引用该ID）

        // 6. 创建文本“节点”
        MimeBodyPart text = new MimeBodyPart();
        //    这里添加图片的方式是将整个图片包含到邮件内容中, 实际上也可以以 http 链接的形式添加网络图片
        text.setContent("这是一张图片<br/><img src='cid:image_fairy_tail'/>", "text/html;charset=UTF-8");

        // 7. （文本+图片）设置 文本 和 图片 “节点”的关系（将 文本 和 图片 “节点”合成一个混合“节点”）
        MimeMultipart mm_text_image = new MimeMultipart();
        mm_text_image.addBodyPart(text);
        mm_text_image.addBodyPart(image);
        mm_text_image.setSubType("related");    // 关联关系

        // 8. 将 文本+图片 的混合“节点”封装成一个普通“节点”
        //    最终添加到邮件的 Content 是由多个 BodyPart 组成的 Multipart, 所以我们需要的是 BodyPart,
        //    上面的 mm_text_image 并非 BodyPart, 所有要把 mm_text_image 封装成一个 BodyPart
        MimeBodyPart text_image = new MimeBodyPart();
        text_image.setContent(mm_text_image);

        // 9. 创建附件“节点”
        MimeBodyPart attachment = new MimeBodyPart();
        DataHandler dh2 = new DataHandler(new FileDataSource("D:\\Course\\English\\article\\研究生基础综合英语(邱东林版)中英对照(1).doc"));  // 读取本地文件
        attachment.setDataHandler(dh2);                                                // 将附件数据添加到“节点”
        attachment.setFileName(MimeUtility.encodeText(dh2.getName()));                // 设置附件的文件名（需要编码）

        // 10. 设置（文本+图片）和 附件 的关系（合成一个大的混合“节点” / Multipart ）
        MimeMultipart mm = new MimeMultipart();
        mm.addBodyPart(text_image);
        mm.addBodyPart(attachment);        // 如果有多个附件，可以创建多个多次添加
        mm.setSubType("mixed");            // 混合关系

        // 11. 设置整个邮件的关系（将最终的混合“节点”作为邮件的内容添加到邮件对象）
        message.setContent(mm);

 */


    }

}

