// Function that open and close the new_garden form in the index page
const a = (height) => {
  console.log(height);
  window.scrollBy(0, height);
}

const changeSymbole = (el) => {
  el.classList.toggle('open-symbole');
  el.classList.toggle('close-symbole');
}

const animCreateGarden = () => {
  const form = document.querySelector('#create-garden #new_garden_form')
  const button = document.querySelector('#create-garden button.btn-flat');
  if (button && form) {
    button.addEventListener('click', (e) => {
      if (form.style.maxHeight) {
        changeSymbole(button);
        form.style.maxHeight = null;
        form.classList.remove('p-30');
      } else {
        changeSymbole(button)
        form.classList.add('p-30');
        form.style.maxHeight = form.scrollHeight + "px";
        setTimeout( a.bind(null, form.scrollHeight), 90 );
      }
    });
  }
}

export { animCreateGarden };
