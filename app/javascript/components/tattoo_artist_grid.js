import * as Masonry from 'masonry-layout';

const tattooArtistGridInit = () => {
  const msnry = new Masonry( '.tattoo-cards', {
    itemSelector: '.tattoo-artist-relative',
    gutter: 10
  });
}

export { tattooArtistGridInit };
