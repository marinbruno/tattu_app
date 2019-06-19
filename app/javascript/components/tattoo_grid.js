import * as Masonry from 'masonry-layout';

const tattooGridInit = () => {
  const msnry = new Masonry( '.tattoo-cards', {
    itemSelector: '.tattoo-relative',
    gutter: 10
  });
// document.addEventListener('DOMContentLoaded', (event) => {
//   const msnry = new Masonry( '.tattoo-cards', {
//     itemSelector: '.tattoo-relative',
//     gutter: 10
//   });
// })
}

export { tattooGridInit };
