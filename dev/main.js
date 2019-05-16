/* global $ Vue */
import WebTile from './components/WebTile.vue';

$(function () {
    Vue.instantiateEach('.portal', { components: { webTile: WebTile } });
});
