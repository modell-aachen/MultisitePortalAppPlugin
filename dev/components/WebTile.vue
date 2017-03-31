<template>
    <div class="columns">
        <div class="wrapper">
            <div @mouseover="hover = true" @mouseleave="hover = false" class="webbox">
                <transition name="fade" mode="out-in" >
                    <span v-if="!show" class="weblogo">
                        <a :href="this.weblink+'/Processes'"><img :src="getWebLogo()" /></a>
                    </span>
                    <div v-if="show" class="subwebs expanded row medium-up-2 xlarge-up-2 xxxlarge-up-2 xxxxlarge-up-2">
                        <div v-for="(subweb,index) in subwebs" v-bind:class="[index%2 == 0 ? 'columns' : 'btnlast columns']" >
                            <a class="button small primary sublink" :href="subweb.web">{{ subweb.name }}</a>
                        </div>
                    </div>
                </transition>
               <transition name="fade"  mode="out-in">
                    <div class="weboverlay" v-if="overlay">
                        <a v-on:click="overlay = false">
                            <i class="fa fa-times" aria-hidden="true"></i>
                        </a>
                        <span><strong>{{globalreqTrans}}:</strong></span>
                        <span>{{globalreq}}</span>
                    </div>
                    <div class="webhover" v-if="hover && !overlay && !show">
                        <a class="" v-on:click="overlay = true">
                            <i class="fa fa-info-circle" aria-hidden="true"></i>
                        </a>
                    </div>
                </transition>
            </div>
            <span class="row">
              <span class="small-11 large-11 columns text-center"><h4>{{ web }}</h4></span>
              <span class="small-1 large-1 columns">
                  <a class="btnswitch" v-on:click="show = !show; overlay = false">
                    <i v-if="!show" class="fa fa-th-large" aria-hidden="true"></i>
                    <i v-if="show" class="fa fa-reply" aria-hidden="true"></i>
                  </a>
              </span>
            </span>
            
        </div>
    </div>
</template>

<script>
import $ from 'jquery'

export default {
    props: ['weblink', 'sitelogo','globalreq', 'weblogo', 'web', 'subwebs'],
    data: function(){
        return {
            show: false,
            hover: false,
            overlay: false,
            globalreqTrans: jsi18n.get('MultisitePortalAppContrib',"Global Requirements from")
        };
    },
    methods: {
        getWebLogo(){
            if(this.weblogo.indexOf("<Name of logo>") != -1){
                return this.sitelogo;
            }else{
                return this.weblogo;
            }
        }
    },
    components: {
    },
}
</script>

<style lang="sass">
    .portal .wrapper {
        .text-center{
            text-align: center;
            h4{
                margin-top: .775rem;
            }
        }
        a{
            cursor: pointer;
        }
        >div{
            padding: 0;
        }
        .webbox {
            height: 160px;
            width: 100%;
            i {
                padding: 8px;
                font-size: 18px;
            }
            .webhover{
                width: 100%;
                height: 100%;
                margin-top: -150px;
                a{
                    position: relative;
                    float: right;
                }
                i{
                    color: #52cae4;
                }
            }
            .subwebs div{
                padding: 8px;
                a.sublink {
                  width: 100%;
                }
            }
            .subwebs .btnlast{
              padding-left: 0px;
            }
            .weboverlay{
                color: #fff;
                width: 100%;
                height: 100%;
                margin-top: -150px;
                background-color: #52cae4;
                opacity: 0.85;
                a{
                    position: relative;
                    float: right;
                }
                 span:last-child{
                    border-top: 1px solid;
                    padding-top: 8px;
                 }
                 span{
                    padding-top: 6%;
                    margin-left: 8%;
                    margin-right: 8%;
                    display: block;
                }
            }
        }
        .weblogo{
            display: block;
            text-align: center;
            max-height: 150px;
            height: 100%;
             img{
                max-height: 160px;
                padding: 30px;
            }
        }
        a.btnswitch{
            color: #7f7b71;
            font-size: 25px;
            padding-top: .9375rem;
            float: right;
        }
        a.btnswitch:hover{
            color: #52cae4;
        }
    }
    .portal .fade-enter-active,
    .portal .fade-leave-active {
      transition: opacity .5s
    }
    .portal .fade-enter,
    .portal .fade-leave-to /* .fade-leave-active in <2.1.8 */ {
      opacity: 0
    }
</style>
