import "bootstrap";
import { initAutocomplete } from '../plugins/init_autocomplete';
initAutocomplete();
import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
import { initMapbox } from '../plugins/init_mapbox';
initMapbox();
import { tattooGridInit } from '../components/tattoo_grid';
window.onload = tattooGridInit();
import { tattooArtistGridInit } from '../components/tattoo_artist_grid';
tattooArtistGridInit();
import { infScrollInit } from '../components/infitine_scroll';
infScrollInit();

