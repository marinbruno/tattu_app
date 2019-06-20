import "bootstrap";
import { initAutocomplete } from '../plugins/init_autocomplete';
import { initMapbox } from '../plugins/init_mapbox';
import { tattooGridInit } from '../components/tattoo_grid';
import { tattooArtistGridInit } from '../components/tattoo_artist_grid';
import { infScrollInit } from '../components/infitine_scroll';

initAutocomplete();
initMapbox();
tattooGridInit();
tattooArtistGridInit();
infScrollInit();
