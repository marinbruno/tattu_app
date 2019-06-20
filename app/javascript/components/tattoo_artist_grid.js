// import * as Masonry from 'masonry-layout';

// const tattooArtistGridInit = () => {
//   const msnry = new Masonry( '.tattoo-cards', {
//     itemSelector: '.tattoo-artist-relative',
//     gutter: 10
//   });
//   // document.addEventListener('DOMContentLoaded', (event) => {
//   //   const msnry = new Masonry( '.tattoo-cards', {
//   //     itemSelector: '.tattoo-artist-relative',
//   //     gutter: 10
//   //   });
//   // })
// }

import Colcade from 'colcade';

const tattooArtistGridInit = () => {
  const card = document.querySelector(".tattoo-artist-cards");

  if (card) {
    const colc2 = new Colcade( '.tattoo-artist-cards', {
      columns: '.grid-col',
      items: '.tattoo-artist-relative'
    });
    window.colc2 = colc2;
  }

}

export { tattooArtistGridInit };
