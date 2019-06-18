import * as Masonry from 'masonry-layout';

const tattooGridInit = () => {
  const msnry = new Masonry( '.tattoo-cards', {
    itemSelector: '.tattoo-relative',
    columnWidth: 350,
    gutter: 10
  });
}

export { tattooGridInit };
