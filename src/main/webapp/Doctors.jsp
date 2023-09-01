<%
if(session.getAttribute("username") == null){
	response.sendRedirect("Login.jsp");
}
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Doctors</title>
    <link rel="stylesheet" href="style.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Rajdhani:wght@300&display=swap"
      rel="stylesheet"
    />
  </head>
  <body>
    <style>
      * {
        box-sizing: border-box;
        outline: none;
        font-family: "Rajdhani", sans-serif;
      }
      :root {
        --bg-color: #f5f8ff;
        --main-color: #353536;
        --secondary-color: #8e92a4;
        --main-text-color: #5d606b;
        --secondary-dark-color: #9496a5;
        --tag-color-one: #e0fbf6;
        --tag-color-text-one: #58c2a9;
        --tag-color-two: #ece7fe;
        --tag-color-text-two: #8972f3;
        --tag-color-three: #fde7ea;
        --tag-color-text-three: #e77f89;
        --tag-color-four: #f7f8fc;
        --tag-color-text-four: #a0a6b5;
        --checkbox-color: #009e90;
        --button-color: #49beb7;
        --box-color: #fff1d6;
        --box-color-2: #d3e6ff;
        --box-color-3: #ffd9d9;
        --box-color-4: #daffe5;
        --task-color: #777982;
      }

      body {
        margin: 0;
        justify-content: center;
        flex-direction: column;
        overflow: auto;
        width: 100%;
        height: 100vh;
        font-size: 12px;
         background-size: cover;
        background-repeat: no-repeat;
        background-position: center;
        background-image: url("./images/Background.png");
        background-attachment: fixed;
        background-blend-mode: overlay, multiply, color, normal;
      }

      ul {
        list-style-type: none;
        padding: 0;
      }

      .task-manager {
        display: flex;
        justify-content: space-between;
        width: 100%;
        max-width: 1200px;
        height: 90vh;
        max-height: 900px;
        background: #fff;
        border-radius: 4px;
        box-shadow: 0 0.3px 2.2px rgba(0, 0, 0, 0.011),
          0 0.7px 5.3px rgba(0, 0, 0, 0.016), 0 1.3px 10px rgba(0, 0, 0, 0.02),
          0 2.2px 17.9px rgba(0, 0, 0, 0.024),
          0 4.2px 33.4px rgba(0, 0, 0, 0.029), 0 10px 80px rgba(0, 0, 0, 0.04);
        overflow: hidden;
      }
      .item {
        color: var(--main-color);
        margin-bottom: 14px;
        font-weight: 500;
      }
      .item img {
        width: 14px;
        height: 14px;
        color: currentcolor;
        margin-right: 10px;
      }

      .category-list {
        margin-top: 50px;
      }
      .category-list .item {
        color: var(--secondary-color);
      }
      .actions {
        padding: 12px;
        display: flex;
        justify-content: space-between;
      }
      .circle {
        border-radius: 50%;
        width: 10px;
        height: 10px;
        background-color: #fe4d46;
        box-shadow: 14px 0 0 0 #fbc023, 28px 0 0 0 #7dd21f;
      }
      .circle-2 {
        border-radius: 50%;
        width: 4px;
        height: 4px;
        background-color: #d5d7e3;
        box-shadow: -6px 0 0 0 #d5d7e3, 6px 0 0 0 #d5d7e3;
      }

      /*  */

      .page-content {
        display: flex;
        flex-direction: column;
        flex: 1;
        padding: 40px 20px 0 20px;
      }

      .page-content .header {
        font-size: 26px;
        color: var(--main-color);
        margin-top: 30px;
      }

      .content-categories {
        display: flex;
        justify-content: space-evenly;
        width: 100%;
        border-bottom: 1px solid #ddd;
        padding: 20px 0;
      }

      .nav-item {
        display: none;
      }

      .category {
        font-weight: 500;
        color: var(--secondary-color);
        border-bottom: 1px solid #ddd;
        transition: 0.4s ease-in;
        padding: 20px 30px;
        cursor: pointer;
      }

      #opt-1:checked + label,
      #opt-2:checked + label,
      #opt-3:checked + label,
      #opt-4:checked + label {
        color: var(--checkbox-color);
        border-bottom: 2px solid var(--checkbox-color);
      }

      /*  */

      .task-item {
        display: none;
      }
      .tasks-wrapper {
        padding: 30px 0;
        flex: 1;
        overflow-y: auto;
        height: 100%;
        padding-right: 8px;
      }

      .task {
        display: flex;
        justify-content: space-between;
        position: relative;
        margin-bottom: 16px;
        padding-left: 30px;
        color: var(--task-color);
        font-size: 13px;
        font-weight: 500;
      }
      .task:hover {
        transform: translatex(2px);
      }
      .task label {
        cursor: pointer;
      }
      label .label-text {
        position: relative;
      }
      label .label-text:before {
        content: "";
        position: absolute;
        width: 14px;
        height: 14px;
        border: 1px solid #ddd;
        border-radius: 2px;
        left: -24px;
        transition: 0.2s ease;
      }

      .task-item:checked + label .label-text:before {
        background-color: var(--checkbox-color);
        border: none;
        background-image: url("svg/check.svg");
        background-repeat: no-repeat;
        background-size: 10px;
        background-position: center;
        border: 1px solid var(--checkbox-color);
      }
      .tag {
        font-size: 10px;
        padding: 4px 8px;
        border-radius: 20px;
      }
      .tag.approved {
        background-color: var(--tag-color-one);
        color: var(--tag-color-text-one);
      }
      .tag.progress {
        background-color: var(--tag-color-two);
        color: var(--tag-color-text-two);
      }
      .tag.review {
        background-color: var(--tag-color-three);
        color: var(--tag-color-text-three);
      }
      .tag.waiting {
        background-color: var(--tag-color-four);
        color: var(--tag-color-text-four);
      }

      .upcoming {
        border-bottom: 1px solid #ddd;
        padding-bottom: 30px;
        margin-bottom: 30px;
      }
      /*  */

      .members {
        display: flex;
        margin-top: 14px;
      }
      .members img {
        border-radius: 50%;
        width: 30px;
        height: 30px;
        margin-right: 4px;
        object-fit: cover;
      }

      .right-bar {
        width: 320px;
        border-left: 1px solid #e3e7f7;
        display: flex;
        flex-direction: column;
        background-color: var(--bg-color);
      }

      .right-bar .header {
        font-size: 20px;
        color: var(--main-text-color);
        margin-left: 30px;
      }
      .top-part {
        padding: 30px;
        align-self: flex-end;
      }
      .top-part img {
        width: 14px;
        height: 14px;
        color: var(--main-color);
        margin-right: 14px;
      }

      .top-part .count {
        font-size: 12px;
        border-radius: 50%;
        width: 24px;
        height: 24px;
        background-color: #623ce8;
        color: #fff;
        justify-content: center;
      }
      .right-content {
        padding: 10px 40px;
        overflow-y: auto;
        flex: 1;
      }
      .task-box {
        position: relative;
        border-radius: 12px;
        width: 100%;
        margin: 20px 0;
        padding: 16px;
        cursor: pointer;
        box-shadow: 2px 2px 4px 0px rgba(235, 235, 235, 1);
      }
      .task-box:hover {
        transform: scale(1.02);
      }
      .time {
        margin-bottom: 6px;
        opacity: 0.4;
        font-size: 10px;
      }

      body,
      .item,
      .top-part,
      .top-part .count {
        display: flex;
        align-items: center;
      }

      .task-name {
        font-size: 14px;
        font-weight: 500;
        opacity: 0.6;
      }
      .yellow {
        background-color: var(--box-color);
      }
      .blue {
        background-color: var(--box-color-2);
      }
      .red {
        background-color: var(--box-color-3);
      }
      .green {
        background-color: var(--box-color-4);
      }
      .more-button {
        position: absolute;
        width: 3px;
        height: 3px;
        border-radius: 50%;
        background-color: #8e92a4;
        box-shadow: 0 -4px 0 0 #8e92a4, 0 4px 0 0 #8e92a4;
        opacity: 0.4;
        right: 20px;
        top: 30px;
        cursor: pointer;
      }
      /*  */

      @media screen and (max-width: 900px) {
        .left-bar {
          display: none;
        }
      }
      @media screen and (max-width: 700px) {
        .task-manager {
          flex-direction: column;
          overflow-y: auto;
        }
        .right-bar,
        .page-content {
          width: 100%;
          display: block;
        }
        .tasks-wrapper {
          height: auto;
        }
      }
      @media screen and (max-width: 520px) {
        .page-content {
          padding: 40px 10px 0 10px;
        }
        .right-content {
          padding: 10px 16px;
        }
        .category {
          padding: 20px;
        }
      }
      .dropbtn {
        background-color: var(--box-color-2);
        color: white;
        padding: 3px;
        padding-left: 10px;
        padding-right: 10px;
        border: none;
        cursor: pointer;
        border-radius: 2rem;
        display: flex;
        align-items: center;
        color: #5d606b;
      }
      .dropbtn img {
        border-radius: 50%;
        width: 30px;
        height: 30px;
        margin-right: 4px;
        object-fit: cover;
      }
      .dropbtn:hover,
      .dropbtn:focus {
        background-color: #abcefc;
      }

      .dropdown {
        position: relative;
        display: inline-block;
      }

      .dropdown-content {
        display: none;
        position: absolute;
        background-color: #f1f1f1;
        min-width: 110px;
        overflow: auto;
        box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
        z-index: 1;
        margin-top: 0.5rem;
      }

      .dropdown-content a {
        color: black;
        padding: 12px 16px;
        text-decoration: none;
        display: block;
      }

      .dropdown a:hover {
        background-color: #ddd;
      }

      .show {
        display: block;
      }
      .side-wrapper {
        margin-top: 2rem;
      }
      .project-name {
        padding-left: 10px;
        color: var(--task-color);
        font-size: 13px;
        font-weight: 500;
      }
      .project-title {
        text-transform: uppercase;
        margin-bottom: 18px;
      }
      .project-department {
        position: relative;
        vertical-align: middle;
        padding: 0 30px;
        margin-top: 15px;
      }

      .project-department:before {
        position: absolute;
        content: "";
        width: 8px;
        height: 8px;
        border-radius: 50%;
        top: 10;
        left: 0;
      }

      .project-department:nth-child(1):before {
        border: 3px solid #fcdb99;
      }
      .project-department:nth-child(2):before {
        border: 3px solid #9bc6fd;
      }
      .project-department:nth-child(3):before {
        border: 3px solid #fd9a9a;
      }
      .project-department:nth-child(4):before {
        border: 3px solid #97fab5;
      }

      .active {
        background-color: #ccc;
      }
      .apointments {
        border: 1px solid transparent;
        border-radius: 1rem;
        width: 100%;
        height: 16rem;
        display: flex;
        justify-content: center;
        align-items: center;
        padding-left: 3rem;
        padding-right: 3rem;
        background-color: #eeeff5;
      }
      .mail-detail-profile {
        display: flex;
        align-items: center;
      }
      .mail-detail-profile img {
        border-radius: 50%;
      }
      .mail-detail-header {
        border-bottom: 1px solid var(--border-color);
        padding: 16px 30px;
        display: flex;
        align-items: center;
        justify-content: space-between;
      }
      .mail-detail-name {
        font-size: 14px;
        font-weight: 600;
        margin-left: 10px;
        white-space: nowrap;
      }
      .mail-contents-subject {
        display: flex;
        align-items: start;
        flex-direction: column;
        margin-left: 5px;
      }
      .inbox-detail {
        width: 44px;
        height: 44px;
      }
      .apointments .header {
        display: flex;
        align-items: center;
        gap: 0.6rem;
        height: 4rem;
      }
      .apointments .header img {
        border-radius: 50%;
        width: 50px;
        height: 50px;
        margin-right: 4px;
        object-fit: cover;
      }
      .apointments h4 {
        font-weight: 700;
      }
      .appointment{
      margin-top: 2rem;
      }
    </style>
    <div class="task-manager">
      <!-- page content starts -->
      <div class="page-content">
        <div class="header">ChatBox</div>
        <!--  -->
        <!-- contemt categories ends -->
        <!-- tasks wrapper starts -->
        <div class="tasks-wrapper">
          <div id="yellow" class="apointments tabcontent">
            <div class="header">
              <img src="./images/profile.webp" alt="" />
              <h6>King Faisal</h6>
            </div>
            <h4>
              Hello doctor Bienvenu! <br />
              <br />
               I hope this letter finds you in good health, We would like to
              inform you that on 28 oct 2023, You have an appointment with a
              patient called Bienaimee with Medical ID 22/17605 on Physical therapy <br />
              Thank you for your contribution! <br />
              <br />
              King Faisal <br />
            </h4>
          </div>
          <div id="blue" class="apointments tabcontent">
            <div class="header">
              <img src="./images/profile.webp" alt="" />
              <h6>Ndera</h6>
            </div>
            <h4>
              Hello doctor Bienvenu! <br />
              <br />
              I hope this letter finds you in good health, We would like to
              inform you that on 28 oct 2023, You have an appointment with a
              patient called Bienaimee with Medical ID 22/17605 on Physical therapy <br />
              Thank you for your contribution! <br />
              <br />
              Ndera <br />
            </h4>
          </div>
          <div id="green" class="apointments tabcontent">
            <div class="header">
              <img src="./images/profile.webp" alt="" />
              <h6>Kanombe Military</h6>
            </div>
            <h4>
              Hello doctor Bienvenu! <br />
              <br />
              I hope this letter finds you in good health, We would like to
              inform you that on 28 oct 2023, You have an appointment with a
              patient called Bienaimee with Medical ID 22/17605 on Physical therapy <br />
              Thank you for your contribution! <br />
              <br />
              Kanombe Military <br />
            </h4>
          </div>
          <div id="red" class="apointments tabcontent">
            <div class="header">
              <img src="./images/profile.webp" alt="" />
              <h6>Muhima</h6>
            </div>
            <h4>
              Hello doctor Bienvenu! <br />
              <br />
              I hope this letter finds you in good health, We would like to
              inform you that on 28 oct 2023, You have an appointment with a
              patient called Bienaimee with Medical ID 22/17605 on Physical therapy <br />
              Thank you for your contribution! <br />
              <br />
              Muhima <br />
            </h4>
          </div>

          <!-- <span class="tag progress">In Progress</span> -->
          <!-- <span class="tag approved">Approved</span> -->
          <!-- <span class="tag review">In Review</span> -->
          <!-- <span class="tag waiting">Waiting</span> -->

          <div class="side-wrapper">
            <div class="header">Hospitals</div>
            <div class="project-name">
              <div class="project-department">King Faisal</div>
              <div class="project-department">Muhima</div>
              <div class="project-department">Kanombe Military</div>
              <div class="project-department">Ndera</div>
            </div>
          </div>
              <div class="appointment"><a href='Appointments'>Show all appointments</a></div>
        </div>
        <!-- tasks wrapper ends -->
      </div>
      <!--  -->
      <!-- page content ends -->

      <!-- right bar starts -->
      <div class="right-bar">
        <div class="top-part">
          <div class="dropdown">
            <button onclick="myFunction()" class="dropbtn">
              <img src="./images/<%= (session.getAttribute("image") != null) ? session.getAttribute("image") : "profile.webp" %>" alt="" /> <%= session.getAttribute("username") %>
            </button>
            <div id="myDropdown" class="dropdown-content">
              <a href="Logout" class="task-name">Log out</a>
            </div>
          </div>
        </div>
        <div class="header">Schedules</div>
        
        <div class="right-content">
          <div
            class="task-box yellow tablinks"
            onclick="openCity(event, 'yellow')"
            id="defaultOpen"
          >
            <div class="description-task">
              <div class="time">08:00 - 09:00 AM</div>
              <div class="task-name">Blood transfer Training</div>
            </div>
          </div>
          <div class="task-box blue tablinks" onclick="openCity(event, 'blue')">
            <div class="description-task">
              <div class="time">10:00 - 11:00 AM</div>
              <div class="task-name">Hospital Meeting</div>
            </div>
          </div>
          <div class="task-box red tablinks" onclick="openCity(event, 'red')">
            <div class="description-task">
              <div class="time">01:00 - 02:00 PM</div>
              <div class="task-name">Team Meeting</div>
            </div>
          </div>
          <div
            class="task-box green tablinks"
            onclick="openCity(event, 'green')"
          >
            <div class="description-task">
              <div class="time">03:00 - 04:00 PM</div>
              <div class="task-name">Release Event</div>
            </div>
          </div>
          <div class="task-box blue tablinks" onclick="openCity(event, 'blue')">
            <div class="description-task">
              <div class="time">08:00 - 09:00 PM</div>
              <div class="task-name">Release Event</div>
            </div>
          </div>
          <div
            class="task-box yellow tablinks"
            onclick="openCity(event, 'yellow')"
          >
            <div class="description-task">
              <div class="time">11:00 - 12:00 PM</div>
              <div class="task-name">Practise</div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <script>
      function myFunction() {
        document.getElementById("myDropdown").classList.toggle("show");
      }

      window.onclick = function (event) {
        if (!event.target.matches(".dropbtn")) {
          var dropdowns = document.getElementsByClassName("dropdown-content");
          var i;
          for (i = 0; i < dropdowns.length; i++) {
            var openDropdown = dropdowns[i];
            if (openDropdown.classList.contains("show")) {
              openDropdown.classList.remove("show");
            }
          }
        }
      };
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
  </body>
</html>
