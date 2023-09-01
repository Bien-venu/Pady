<%
if(session.getAttribute("username") == null){
	response.sendRedirect("Login.jsp");
}
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard</title>
    <link rel="stylesheet" href="css/index.css" />
     <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Rajdhani:wght@300&display=swap" rel="stylesheet" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/datepicker.css">
    <link rel="stylesheet" href="assets/css/style.css">
</head>
<body>
 <div class="container">
 <div class="user-profile-area">
  <div class="task-manager">
    <a href="">
    <img src="./images/IMG_202308215_184154119.jpg" alt="">

    </a>
</div>
  <div class="side-wrapper">
   <div class="user-profile">
    <img src="./images/<%= (session.getAttribute("image") != null) ? session.getAttribute("image") : "profile.webp" %>" alt="" class="user-photo">
    <div class="user-name"><%= session.getAttribute("username") %></div>
        <div class="user-mail" id="user-mai"><%= session.getAttribute("email") %></div>
   </div>
   <div class="user-notification">
    <div class="notify alert" id="message">
      <a href="#">
     <svg viewBox="0 0 33 25" fill="none" xmlns="http://www.w3.org/2000/svg"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <path d="M21.0039 12C21.0039 16.9706 16.9745 21 12.0039 21C9.9675 21 3.00463 21 3.00463 21C3.00463 21 4.56382 17.2561 3.93982 16.0008C3.34076 14.7956 3.00391 13.4372 3.00391 12C3.00391 7.02944 7.03334 3 12.0039 3C16.9745 3 21.0039 7.02944 21.0039 12Z" stroke="#625be8" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path> </g></svg>
     </a>
    </div>
    <div class="notify alert " id="notify" >
      <a href="#">
     <svg id="notifi" viewBox="0 0 33 25" fill="none" xmlns="http://www.w3.org/2000/svg"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <path d="M15 19.25C15 20.0456 14.6839 20.8087 14.1213 21.3713C13.5587 21.9339 12.7956 22.25 12 22.25C11.2044 22.25 10.4413 21.9339 9.87869 21.3713C9.31608 20.8087 9 20.0456 9 19.25" stroke="#625be8" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path> <path d="M5.58096 18.25C5.09151 18.1461 4.65878 17.8626 4.36813 17.4553C4.07748 17.048 3.95005 16.5466 4.01098 16.05L5.01098 7.93998C5.2663 6.27263 6.11508 4.75352 7.40121 3.66215C8.68734 2.57077 10.3243 1.98054 12.011 1.99998V1.99998C13.6977 1.98054 15.3346 2.57077 16.6207 3.66215C17.9069 4.75352 18.7557 6.27263 19.011 7.93998L20.011 16.05C20.0723 16.5452 19.9462 17.0454 19.6576 17.4525C19.369 17.8595 18.9386 18.144 18.451 18.25C14.2186 19.2445 9.81332 19.2445 5.58096 18.25V18.25Z" stroke="#625be8" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path> </g></svg>
                        <div class="notifications-popup scroll-container">
                            <div>
                                <div class="profile-photo">
                                    <img src="./images/profile.png">
                                </div>
                                <div class="notification-body">
                                    <b>Dr Keke Benjamin</b> accepted your appointment
                                    <small class="text-muted">2 Days Ago</small>
                                </div>
                            </div>
                            <div>
                                <div class="profile-photo">
                                    <img src="./images/profile.png">
                                </div>
                                <div class="notification-body">
                                    <b>Dr John Doe</b> commented your appointment
                                    <small class="text-muted">1 Hour Ago</small>
                                </div>
                            </div>
                            <div>
                                <div class="profile-photo">
                                    <img src="./images/profile.png">
                                </div>
                                <div class="notification-body">
                                    <b>Dr Marry Oppong </b> accept your appointment
                                    <small class="text-muted">4 Minutes Ago</small>
                                </div>
                            </div>
                            <div>
                                <div class="profile-photo">
                                    <img src="./images/profile.png">
                                </div>
                                <div class="notification-body">
                                    <b>Dr Doris Y. Lartey</b> send a message
                                    <small class="text-muted">2 Days Ago</small>
                                </div>
                            </div>
                            <div>
                                <div class="profile-photo">
                                    <img src="./images/profile.png">
                                </div>
                                <div class="notification-body">
                                    <b>Dr Keyley Jenner</b> accepted your appointment
                                    <small class="text-muted">1 Hour Ago</small>
                                </div>
                            </div>
                            <div>
                                <div class="profile-photo">
                                    <img src="./images/profile.png">
                                </div>
                                <div class="notification-body">
                                    <b>Jane Doe</b> decline your appointment
                                    <small class="text-muted">1 Hour Ago</small>
                                </div>
                            </div>
                        </div>
    </div>
    
    
    <div class="notify ">
     <a href="Logout">
     <svg viewBox="0 0 33 25" xmlns="http://www.w3.org/2000/svg" fill="none"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <path stroke="#4d76fd" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M20 12h-9.5m7.5 3l3-3-3-3m-5-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2h5a2 2 0 002-2v-1"></path> </g></svg>
     </a>
    </div>
   </div>
   <div class="progress-status">12/34</div>
   <div class="progress">
    <div class="progress-bar"></div>
   </div>
   <div class="task-status">
    <div id="mess" class="task-stat">
     <div class="task-number">6</div>
     <div class="task-tasks">Appointment</div>
    </div>
    <div class="task-stat">
     <div class="task-number">2</div>
     <div class="task-tasks">Messages</div>
    </div>
    <div class="task-stat">
     <div class="task-number alert">8</div>
     <div class="task-tasks">completed</div>
    </div>
   </div>
  </div>
<div class="side-wrapper">
   <div class="project-title">Hospitals</div>
   <div class="project-name">
    <div class="project-department">King Faisal</div>
    <div class="project-department">Muhima</div>
    <div class="project-department">Kanombe Military</div>
    <div class="project-department">Ndera</div>
   </div>
  </div>
 </div>
 <div class="main-area">
  <div class="header">
   <div class="search-bar">
    <input type="text" placeholder="Search...">
   </div>
   <div class="inbox-calendar" id="inbox-calend slar">
    <input type="checkbox" class="inbox-calendar-checkbox" id="inbox-calendar-checkbox">
    <div class="toggle-page">
     <span>Inbox</span>
    </div>
    <div class="layer"></div>
   </div>
   <div class="color-menu">
    <s xmlns="http://www.w3.org/2000/svg" viewBox="0 0 464.7 464.7"><path d="M446.6 18.1a62 62 0 00-87.6 0L342.3 35a23 23 0 10-32.5 32.5l5.4 5.4-180.6 180.6L71.9 316c-5 5-8 11.6-8.2 18.7l-.2 3.3-2.5 56.7a9.4 9.4 0 009.4 9.8h.4l30-1.3 18.4-.8 8.3-.4a37 37 0 0024.5-10.8l240.9-240.9 4.5 4.6a23 23 0 0032.5 0c9-9 9-23.6 0-32.6l16.7-16.7a62 62 0 000-87.6zm-174 209.2l-84.6 16 138-138 34.4 34.3-87.8 87.7zM64.5 423.9C28.9 423.9 0 433 0 444.3c0 11.3 28.9 20.4 64.5 20.4s64.5-9.1 64.5-20.4C129 433 100 424 64.5 424z"/></s slvg>
     <input type="color" value="#4d76fd" class="colorpicker" id="colorpicker"></input>
   </div>
  </div>
  <div class="main-container ">
   <div class="inbox-container" id="inbox-container">
        <div class="apo">
      <h2>Appointment </h2>
    </div>
   <div id="right-bar " class="right-bar scroll-container">
  <div id="right-content" class="right-content">
    <div class="task-box yellow tablinks" id="defaultOpen" onclick="openCity(event, 'ups')">
      <div class="description-task">
        <div class="time">02 Jan 2024, Monday</div>
        <div class="task-name">General check-ups</div>
      </div>
      <div class="more-button"></div>
      <p class="wth">With Dr Keke Benjamin</p>
    </div>
    <div class="task-box blue tablinks" onclick="openCity(event, 'consul')">
      <div class="description-task">
        <div class="time">02 Feb 2024, Tuesday</div>
        <div class="task-name">Specialist consultation</div>
      </div>
      <div class="more-button"></div>
      <p class="wth">With Dr John Doe</p>
    </div>
    <div class="task-box red tablinks" onclick="openCity(event, 'tests')">
      <div class="description-task">
        <div class="time">02 Jan 2023</div>
        <div class="task-name">Diagnostic tests</div>
      </div>
      <div class="more-button"></div>
      <p class="wth">With Dr Mary Oppong</p>
      
    </div>
    <div class="task-box green tablinks" onclick="openCity(event, 'Vacc')">
      <div class="description-task">
        <div class="time">12 Jul 2024</div>
        <div class="task-name">Vaccinations</div>
      </div>
      <div class="more-button"></div>
      <p class="wth">With Dr Doris Y. Larley</p>
     
    </div>
    <div class="task-box blue tablinks" onclick="openCity(event, 'ther')">
      <div class="description-task">
        <div class="time">02 Aug 2024</div>
        <div class="task-name">Physical therapy</div>
      </div>
      <div class="more-button"></div>
     <p class="wth">With Dr Keyley Jenner</p>
    </div>
    <div class="task-box yellow tablinks" onclick="openCity(event, 'Prac')">
      <div class="description-task">
        <div class="time">28 Oct 2024</div>
        <div class="task-name">Practise</div>
      </div>
      <div class="more-button"></div>
<p class="wth">With Dr Jane Doe</p>
    </div>
  </div>
</div>    
<div class="add-task">
     <button class="add-button"  id="settings">Ask an Appointement</button>
    </div>
    
   </div>
   <div class="mail-detail scroll-container" id="mail-detail">
     <div class="mail-contents tabcontent" id="ups">
     <div class="mail-contents-subject">
      <div class="mail-detail-profile">
        <img src="images/profile.webp" alt="" class="members inbox-detail" />
        <div class="mail-detail-name">Dr Keke Benjamin</div>
       </div>
      <label for="mail20"></label>
    </div>
    <div class="mail-contents-title">General check-ups</div>
     <div class="mail">
      <div class="mail-time">
       <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-clock">
        <circle cx="12" cy="12" r="10" />
        <path d="M12 6v6l4 2" /></svg>
       02 Jan 2023
      </div>
      <div class="mail-inside">
        Dr Keke Benjamin <br>

01 Jan 2023<br>

Bienvenu<br>
Rwanda - Kigali<br>

Dear Bienvenu,<br>

I hope this letter finds you in good health. I am writing to confirm your acceptance of the hospital appointment scheduled on 02 Jan 2023 at King Faisal, located at Kigali.

As discussed during our recent consultation, it is essential for you to undergo further evaluation and treatment to address the medical concerns we have identified. The appointment has been set to ensure a comprehensive assessment of your condition and provide you with the best possible care.

Please ensure you arrive at the hospital on time and bring any relevant medical records, previous test results, and a list of medications you are currently taking. This information will assist us in making an accurate diagnosis and developing a personalized treatment plan for you.

If, for any reason, you are unable to attend the appointment or need to reschedule, kindly notify our clinic at least 48 hours in advance so that we can offer the time slot to another patient in need.

Your health and well-being are of utmost importance to us, and we are committed to providing you with the highest level of medical care. If you have any questions or concerns before your appointment, please do not hesitate to contact our office at [Doctor's Contact Number].

Thank you for entrusting me with your healthcare needs. I look forward to seeing you at the hospital on 02 Jan 2023.

Sincerely, <br>

Dr Keke Benjamin <br>
General check-ups <br>
King Faisal hospital <br>     
      </div>
     </div>
    </div>
    <div class="mail-contents tabcontent" id="consul">
     <div class="mail-contents-subject">
      <div class="mail-detail-profile">
        <img src="images/profile.webp" alt="" class="members inbox-detail" />
        <div class="mail-detail-name">Dr John Doe</div>
       </div>
      <label for="mail20"></label>
      <div class="mail-contents-title">Specialist consultation</div>
     </div>
     <div class="mail">
      <div class="mail-time">
       <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-clock">
        <circle cx="12" cy="12" r="10" />
        <path d="M12 6v6l4 2" /></svg>
       02 Feb 2024
      </div>
      <div class="mail-inside">Dr John Doe <br>

18 March 2024<br>

Bienvenu<br>
Rwanda - Kigali<br>

Dear Bienvenu,<br>

I hope this letter finds you in good health. I am writing to confirm your acceptance of the hospital appointment scheduled on 02 Feb 2024 at Muhima hospital, located at Kigali city.

As discussed during our recent consultation, it is essential for you to undergo further evaluation and treatment to address the medical concerns we have identified. The appointment has been set to ensure a comprehensive assessment of your condition and provide you with the best possible care.

Please ensure you arrive at the hospital on time and bring any relevant medical records, previous test results, and a list of medications you are currently taking. This information will assist us in making an accurate diagnosis and developing a personalized treatment plan for you.

If, for any reason, you are unable to attend the appointment or need to reschedule, kindly notify our clinic at least 48 hours in advance so that we can offer the time slot to another patient in need.

Your health and well-being are of utmost importance to us, and we are committed to providing you with the highest level of medical care. If you have any questions or concerns before your appointment, please do not hesitate to contact our office at [Doctor's Contact Number].

Thank you for entrusting me with your healthcare needs. I look forward to seeing you at the hospital on 02 Feb 2024.

Sincerely, <br>

Dr John Doe <br>
Diagnostic tests <br>
Muhima hospital <br>     </div>
     </div>
    </div>
    <div class="mail-contents tabcontent" id="tests">
     <div class="mail-contents-subject">
      <div class="mail-detail-profile">
        <img src="images/profile.webp" alt="" class="members inbox-detail" />
        <div class="mail-detail-name">Dr Mary Oppong</div>
       </div>
      <label for="mail20"></label>
      <div class="mail-contents-title">Diagnostic tests</div>
     </div>
     <div class="mail">
      <div class="mail-time">
       <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-clock">
        <circle cx="12" cy="12" r="10" />
        <path d="M12 6v6l4 2" /></svg>
       02 Jan 2023
      </div>
      <div class="mail-inside">
Dr Mary Oppong <br>

18 March 2024<br>

Bienvenu<br>
Rwanda - Kigali<br>

Dear Bienvenu,<br>

I hope this letter finds you in good health. I am writing to confirm your acceptance of the hospital appointment scheduled on 02 Jan 2023 at Muhima hospital, located at Kigali city.

As discussed during our recent consultation, it is essential for you to undergo further evaluation and treatment to address the medical concerns we have identified. The appointment has been set to ensure a comprehensive assessment of your condition and provide you with the best possible care.

Please ensure you arrive at the hospital on time and bring any relevant medical records, previous test results, and a list of medications you are currently taking. This information will assist us in making an accurate diagnosis and developing a personalized treatment plan for you.

If, for any reason, you are unable to attend the appointment or need to reschedule, kindly notify our clinic at least 48 hours in advance so that we can offer the time slot to another patient in need.

Your health and well-being are of utmost importance to us, and we are committed to providing you with the highest level of medical care. If you have any questions or concerns before your appointment, please do not hesitate to contact our office at [Doctor's Contact Number].

Thank you for entrusting me with your healthcare needs. I look forward to seeing you at the hospital on 02 Jan 2023.

Sincerely, <br>

Dr Mary Oppong <br>
Diagnostic tests <br>
Kanombe Military hospital <br>     
</div>
     </div>
    </div>
    <div class="mail-contents tabcontent" id="Vacc">
     <div class="mail-contents-subject">
      <div class="mail-detail-profile">
        <img src="images/profile.webp" alt="" class="members inbox-detail" />
        <div class="mail-detail-name">Dr Doris Y. Larley</div>
       </div>
      <label for="mail20"></label>
      <div class="mail-contents-title">Vaccinations</div>
     </div>
     <div class="mail">
      <div class="mail-time">
       <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-clock">
        <circle cx="12" cy="12" r="10" />
        <path d="M12 6v6l4 2" /></svg>
       12 Jul 2024
      </div>
      <div class="mail-inside">Dr Doris Y. Larley <br>

10 Jul 2024<br>

Bienvenu<br>
Rwanda - Kigali<br>

Dear Bienvenu,<br>

I hope this letter finds you in good health. I am writing to confirm your acceptance of the hospital appointment scheduled on 12 Jul 2024 at Muhima hospital, located at Kigali city.

As discussed during our recent consultation, it is essential for you to undergo further evaluation and treatment to address the medical concerns we have identified. The appointment has been set to ensure a comprehensive assessment of your condition and provide you with the best possible care.

Please ensure you arrive at the hospital on time and bring any relevant medical records, previous test results, and a list of medications you are currently taking. This information will assist us in making an accurate diagnosis and developing a personalized treatment plan for you.

If, for any reason, you are unable to attend the appointment or need to reschedule, kindly notify our clinic at least 48 hours in advance so that we can offer the time slot to another patient in need.

Your health and well-being are of utmost importance to us, and we are committed to providing you with the highest level of medical care. If you have any questions or concerns before your appointment, please do not hesitate to contact our office at [Doctor's Contact Number].

Thank you for entrusting me with your healthcare needs. I look forward to seeing you at the hospital on 12 Jul 2024.

Sincerely, <br>

Dr Doris Y. Larley <br>
Vaccinations <br>
Ndera hospital <br>     </div>
     </div>
    </div>
     <div class="mail-contents tabcontent" id="ther">
     <div class="mail-contents-subject">
      <div class="mail-detail-profile">
        <img src="images/profile.webp" alt="" class="members inbox-detail" />
        <div class="mail-detail-name">Keyley Jenner</div>
       </div>
      <label for="mail20"></label>
      <div class="mail-contents-title">Physical therapy</div>
     </div>
     <div class="mail">
      <div class="mail-time">
       <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-clock">
        <circle cx="12" cy="12" r="10" />
        <path d="M12 6v6l4 2" /></svg>
       02 Aug 2024
      </div>
      <div class="mail-inside">Keyley Jenner <br>

01 Aug 2024<br>

Bienvenu<br>
Rwanda - Kigali<br>

Dear Bienvenu,<br>

I hope this letter finds you in good health. I am writing to confirm your acceptance of the hospital appointment scheduled on 02 Aug 2024 at Muhima hospital, located at Kigali city.

As discussed during our recent consultation, it is essential for you to undergo further evaluation and treatment to address the medical concerns we have identified. The appointment has been set to ensure a comprehensive assessment of your condition and provide you with the best possible care.

Please ensure you arrive at the hospital on time and bring any relevant medical records, previous test results, and a list of medications you are currently taking. This information will assist us in making an accurate diagnosis and developing a personalized treatment plan for you.

If, for any reason, you are unable to attend the appointment or need to reschedule, kindly notify our clinic at least 48 hours in advance so that we can offer the time slot to another patient in need.

Your health and well-being are of utmost importance to us, and we are committed to providing you with the highest level of medical care. If you have any questions or concerns before your appointment, please do not hesitate to contact our office at [Doctor's Contact Number].

Thank you for entrusting me with your healthcare needs. I look forward to seeing you at the hospital on 02 Aug 2024.

Sincerely, <br>

Keyley Jenner <br>
Physical therapy<br>
Muhima hospital <br>     </div>
     </div>
    </div>
      <div class="mail-contents tabcontent" id="Prac">
     <div class="mail-contents-subject">
      <div class="mail-detail-profile">
        <img src="images/profile.webp" alt="" class="members inbox-detail" />
        <div class="mail-detail-name">Jane Dore</div>
       </div>
      <label for="mail20"></label>
      <div class="mail-contents-title">Practise</div>
     </div>
     <div class="mail">
      <div class="mail-time">
       <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-clock">
        <circle cx="12" cy="12" r="10" />
        <path d="M12 6v6l4 2" /></svg>
       28 Oct 2024
      </div>
      <div class="mail-inside">Jane Dore <br>

25 Oct 2024<br>

Bienvenu<br>
Rwanda - Kigali<br>

Dear Bienvenu,<br>

I hope this letter finds you in good health. I am writing to confirm your acceptance of the hospital appointment scheduled on 28 Oct 2024 at Muhima hospital, located at Kigali city.

As discussed during our recent consultation, it is essential for you to undergo further evaluation and treatment to address the medical concerns we have identified. The appointment has been set to ensure a comprehensive assessment of your condition and provide you with the best possible care.

Please ensure you arrive at the hospital on time and bring any relevant medical records, previous test results, and a list of medications you are currently taking. This information will assist us in making an accurate diagnosis and developing a personalized treatment plan for you.

If, for any reason, you are unable to attend the appointment or need to reschedule, kindly notify our clinic at least 48 hours in advance so that we can offer the time slot to another patient in need.

Your health and well-being are of utmost importance to us, and we are committed to providing you with the highest level of medical care. If you have any questions or concerns before your appointment, please do not hesitate to contact our office at [Doctor's Contact Number].

Thank you for entrusting me with your healthcare needs. I look forward to seeing you at the hospital on 28 Oct 2024.

Sincerely, <br>

Jane Dore <br>
Practise <br>
King Faisal hospital <br>     </div>
     </div>
    </div>
    <div class="mail-textarea">
     <input type="text" placeholder="Write a comment...">
     <div class="textarea-icons">
      <div class="attach">
       <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-paperclip">
        <path d="M21.44 11.05l-9.19 9.19a6 6 0 01-8.49-8.49l9.19-9.19a4 4 0 015.66 5.66l-9.2 9.19a2 2 0 01-2.83-2.83l8.49-8.48" /></svg>
      </div>
      <div class="send">
       <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-send">
        <path d="M22 2L11 13M22 2l-7 20-4-9-9-4 20-7z" /></svg>
      </div>
     </div>
    </div>
   </div>
   <div class="calendar-container scroll-container" id="calendar-container">
    
<div class="inner-layer">
          <div class="container">
            <div class="row no-margin">
               
                <div class="col-sm-5">
                    <div class="form-data">
                        <div class="form-head">
                            <h2>Hospital Appointment</h2>
                        </div>
                        <form action="<%= request.getContextPath()%>/Appointmentservlet" method="post" enctype="multipart/form-data" autocomplete="off">
                                    <div class="form-body">
                            <div class="row form-row">
                              <input type="text" placeholder="Enter Full name" name="name" value="<%= session.getAttribute("username") %>" class="form-control" required>
                            </div>
                            <div class="row form-row">
                              <input type="text" placeholder="Enter Medical ID" name="medicalid" class="form-control" required>
                            </div>
                             <div class="row form-row">
                              <select name="hospitals" class="form-control" id="hospital" required>
                                <option disabled selected>Hospital</option>
                                <option value="Faisal">King Faisal</option>
                                <option value="Kanombe">Kanombe Military</option>
                                <option value="Muhima">Muhima</option>
                                <option value="Ndera">Ndera</option>
                              </select>
                            </div>
                            <div class="row form-row">
                              <input id="dat" type="text" name="date" placeholder="Appointment Date" class="form-control" required>
                            </div>
                             <div class="row form-row">
                              <select name="Appointement" class="form-control" id="Appointement" required>
                                <option disabled selected>Appointement</option>
                                <option value="General check-ups">General check-ups</option>
                                <option value="Specialist consultation">Specialist consultation</option>
                                <option value="Diagnostic tests">Diagnostic tests</option>
                                <option value="Vaccinations">Vaccinations</option>
                                <option value="Physical therapy">Physical therapy</option>
                                <option value="Practise">Practise</option>
                              </select>
                            </div>
                           
                            
                            

                             <div class="row form-row">
                               <button class="btn btn-success btn-appointment" type="submit">
                                 Send
                               </button>
                               
                            </div>

                        </div>
                        </form>
 
                    </div>
                </div>
            </div>
          </div>
      </div>
      
<div class="IDI">
      <div class="headering">
        <header>Consultation Confirmation</header>
        <p>Your consultation confirmation number</p>
      </div>
      <div class="headings">
        <h2>Your unique Medical ID is</h2>
        <h4></h4>
      </div>
    </div>  
   
    
   </div>
  </div>
 </div>
</div>
 <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="assets/js/jquery-3.3.1.min.js"></script>
    <script src="assets/js/popper.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/bootstrap-datepicker.js"></script>

    <script>
      $(document).ready(function(){
          $("#dat").datepicker();
      })
    </script>
<script>
function openCity(evt, cityName) {
  var i, tabcontent, tablinks;
  tabcontent = document.getElementsByClassName("tabcontent");
  for (i = 0; i < tabcontent.length; i++) {
    tabcontent[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablinks");
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" active", "");
  }
  document.getElementById(cityName).style.display = "block";
  evt.currentTarget.className += " active";
}

// Get the element with id="defaultOpen" and click on it
document.getElementById("defaultOpen").click();
</script>
    <script src="js/index.js"></script>
    <script src="js/id.js"></script>
    

</body>
</html>