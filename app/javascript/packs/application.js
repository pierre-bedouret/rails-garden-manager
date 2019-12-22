import "bootstrap";
import { animCreateGarden } from '../components/anim_create_garden';
import { initSweetalert } from '../components/init_sweetalert';


animCreateGarden();

// Active sweetAlert before to delete an plant in show page
initSweetalert('#delete-plant-btn', {
  title: "Are you sure to want to delete this plant?",
  text: "This action cannot be reversed",
  icon: "warning",
  buttons: true
}, (value) => {
  if (value) {
    const link = document.querySelector('#delete-plant');
    link.click();
  }
});
