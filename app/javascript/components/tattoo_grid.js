// import * as Masonry from 'masonry-layout';
// import InfiniteScroll from 'infinite-scroll';

// const tattooGridInit = () => {
//   const msnry = new Masonry( '.tattoo-cards', {
//     itemSelector: '.tattoo-relative',
//     gutter: 10
//   });
//   window.msnry = msnry

//   const infScroll = new InfiniteScroll( '.tattoo-cards', {
//     // options
//     path: '.pagination__next',
//     append: '.tattoo-relative',
//     history: false,
//   });
// }

import Colcade from 'colcade';

const tattooGridInit = () => {
  const colc = new Colcade( '.tattoo-cards', {
    columns: '.grid-col',
    items: '.tattoo-relative'
  });
  window.colc = colc;

}

export { tattooGridInit };
