import Vue from 'vue/dist/vue.js'
import WebTile from './components/WebTile.vue'
import $ from 'jquery'

window.Vue = Vue;

$( function () {
    new Vue({
        el: '.portal',
        components: {
            webTile: WebTile
        }
    })
})
