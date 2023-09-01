/**
 * 
 */
const colorInput = document.getElementById("colorpicker");
const inboxcalendar = document.getElementById("inbox-calendar-checkbox");
const calendarcontainer = document.getElementById("calendar-container");
const inboxcontainer = document.getElementById("inbox-container");
const maildetail = document.getElementById("mail-detail");
const mailchoice = document.querySelectorAll(".mail-choice");
const sl = document.querySelectorAll(".sl");
const messages = document.getElementById("mess");
const messageicon = document.getElementById("message");
const message = document.querySelectorAll(".task-box");
const chatInput = document.getElementById("textarea");
const sendbtm = document.getElementById("sendbtn");
const chatBox = document.getElementById("chatbox");
const settings = document.getElementById("settings");



const removeNoti = () => {
  document.querySelector(".notifications-popup").style.display = "none";
};
const addNoti = () => {
  document.querySelector(".notifications-popup").style.display = "block";
  document.getElementById("notify").classList.remove("alert");
};
document
  .querySelector(".notifications-popup")
  .addEventListener("mouseenter", addNoti);
document
  .querySelector(".notifications-popup")
  .addEventListener("mouseleave", removeNoti);
document.getElementById("notifi").addEventListener("click", addNoti);
document.getElementById("notifi").addEventListener("mouseleave", removeNoti);
sl.forEach((e) => {
  mailchoice.forEach((element) => {
    element.addEventListener("change", () => {
      if (element.checked) {
        element.parentElement.classList.add("selected-bg");
      } else {
        element.parentElement.classList.remove("selected-bg");
      }
    });
  });
});
colorInput.addEventListener("input", (e) => {
  document.body.style.setProperty("--button-color", e.target.value);
});
settings.addEventListener("click", () => {
  calendarcontainer.classList.toggle("calendar-show");
  inboxcontainer.classList.toggle("hide");
  maildetail.classList.toggle("hide");
  inboxcalendar.checked = true;
});
inboxcalendar.addEventListener("click", function () {
  calendarcontainer.classList.toggle("calendar-show");
  inboxcontainer.classList.toggle("hide");
  maildetail.classList.toggle("hide");
});
messageicon.addEventListener("click", () => {
  inboxcalendar.checked = false;
  calendarcontainer.classList.remove("calendar-show");
  inboxcontainer.classList.remove("hide");
  maildetail.classList.remove("hide");
  messages.classList.remove("alert");
  maildetail.style.background = "none";
   setTimeout(() => {
  maildetail.style.background = "";
   }, 1000);
});

messages.addEventListener("click", () => {
  inboxcalendar.checked = false;
  calendarcontainer.classList.remove("calendar-show");
  inboxcontainer.classList.remove("hide");
  maildetail.classList.remove("hide");
  messages.classList.remove("alert");
  message.forEach((e) => {
    e.style.boxShadow = "0 0 1rem #bababa";
  });
  setTimeout(() => {
    message.forEach((i) => {
      i.style.boxShadow = "none";
    });
  }, 2000);
});

// const section = document.querySelector("section"),
//   overlay = document.querySelector(".overlay"),
//   showBtn = document.querySelector(".show-modal"),
//   closeBtn = document.querySelector(".close-btn");
// showBtn.addEventListener("click", () => section.classList.add("active"));
// overlay.addEventListener("click", () => section.classList.remove("active"));
// closeBtn.addEventListener("click", () => section.classList.remove("active"));
