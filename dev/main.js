/* global $ Vue */
import WebTile from './components/WebTile.vue'
import $ from 'jquery'

$( function () {
    new Vue({
        el: '.portal',
        components: {
            webTile: WebTile
        }
    })
})
