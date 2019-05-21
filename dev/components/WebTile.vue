<template>
    <div class="columns">
        <div class="wrapper">
            <div
                class="webbox"
                @mouseover="mouseOver()"
                @mouseleave="hover = false">
                <transition
                    name="fade"
                    mode="out-in">
                    <span
                        v-if="!show"
                        class="weblogo">
                        <a :href="weblink+'/Processes'"><img :src="getWebLogo()"></a>
                    </span>
                    <div
                        v-if="show"
                        class="subwebs expanded row medium-up-2 xlarge-up-2 xxxlarge-up-2 xxxxlarge-up-2">
                        <div
                            v-for="(subweb,index) in subwebs"
                            :key="subweb.name"
                            :class="[index%2 == 0 ? 'columns' : 'btnlast columns']">
                            <a
                                class="button small primary sublink"
                                :href="subweb.web">{{ subweb.name }}</a>
                        </div>
                    </div>
                </transition>
                <transition
                    name="fade"
                    ode="out-in"
                    @after-enter="afterEnter">
                    <div
                        v-if="!show && overlay"
                        class="weboverlay">
                        <a @click="overlay = false">
                            <i
                                class="fa fa-times"
                                aria-hidden="true" />
                        </a>
                        <span><strong>{{ globalreqTrans }}:</strong></span>
                        <span>{{ globalreq }}</span>
                    </div>
                    <div
                        v-if="hover && !overlay && !show"
                        class="webhover">
                        <a
                            class=""
                            @click="clickHover();">
                            <i
                                class="fa fa-info-circle"
                                aria-hidden="true" />
                        </a>
                    </div>
                </transition>
            </div>
            <span class="row">
                <span class="small-11 large-11 columns text-center"><h4>{{ web }}</h4></span>
                <span class="small-1 large-1 columns">
                    <a
                        class="btnswitch"
                        @click="show = !show; overlay = false">
                        <i
                            v-if="!show"
                            class="fa fa-th-large"
                            aria-hidden="true" />
                        <i
                            v-if="show"
                            class="fa fa-reply"
                            aria-hidden="true" />
                    </a>
                </span>
            </span>
        </div>
    </div>
</template>

<script>

export default {
    components: {
    },
    props: {
        weblink: {
            type: String,
            default: '',
        },
        sitelogo: {
            type: String,
            default: '',
        },
        globalreq: {
            type: String,
            default: '',
        },
        weblogo: {
            type: String,
            default: '',
        },
        web: {
            type: String,
            default: '',
        },
        subwebs: {
            type: Array,
            default: () => [],
        },
    },
    data: function(){
        return {
            show: false,
            hover: false,
            overlay: false,
            globalreqTrans: jsi18n.get('MultisitePortalAppPlugin', 'Global Requirements from'),
        };
    },
    methods: {
        getWebLogo(){
            if(this.weblogo.indexOf('<Name of logo>') !== -1){
                return this.sitelogo;
            }else{
                return this.weblogo;
            }
        },
        afterEnter(el) {
            el.className += ' afterEnter';
        },
        mouseOver(){
            if(!this.overlay) {
                this.hover = true;
            }
        },
        clickHover(){
            this.hover = false;
            this.overlay = true;
        },
    },
};
</script>

<style lang="scss">
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
            .subwebs {
                margin-left: auto;
                margin-right: auto;
                div {
                    padding: 8px 8px 0px 8px;
                }
                div a.sublink {
                  width: 100%;
                  margin: 0 0 0;
                }
                .btnlast{
                    padding-left: 0px;
                }
            }
            .weboverlay{
                color: #fff;
                width: 100%;
                height: 100%;
                margin-top: -150px;
                background-color: #52cae4;
                z-index: 1000;
                position: relative;
                //opacity: 0.85;
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
            a{
                position: relative;
                z-index: 99;
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
    .afterEnter{
        opacity: 0.85;
    }
    .fade-enter-active,
    .fade-leave-active {
        transition: opacity .25s;
    }
    .fade-enter-to{
        opacity: 0.85 !important;
    }
    .fade-enter,
    .fade-leave-to /* .fade-leave-active in <2.1.8 */ {
        opacity: 0;
    }
    .portal .widgetBlockTitle{
        margin-left: .9375rem;
        margin-bottom: 15px;
    }
    #modacHeading{
        margin-left: .9375rem;
    }
    .localreq {
        margin-top: 100px;
    }
</style>
