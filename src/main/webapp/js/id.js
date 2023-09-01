/**
 * 
 */
const id = document.querySelector(".headings h4");

const getId = () => {
  const id1 = Math.floor(Math.random() * 400);
  const id2 = Math.floor(Math.random() * 400);
  const id3 = Math.floor(Math.random() * 400);
  console.log(id1);
  id.innerHTML = `PDM ${id1} - ${id2} - ${id3}`;
};
getId();
