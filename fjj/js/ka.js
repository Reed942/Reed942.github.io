!function(){function B(a,b){var c,d;b=b||"&";c=[];for(d in a)c.push(encodeURIComponent(d)+"="+encodeURIComponent(a[d]));return c.join(b)}function I(a,b){var c,d,e,g=new Image;c=b.__a;var f=Math.floor(b._/100);if(c&&f){c+=f;for(e=d=0;e<c.length;e++)d+=c.charCodeAt(e);b._=100*f+d%100}g.src=J?"https://"+m+a+"?"+B(b):"http://"+m+a+"?"+B(b)}function n(a,b,c,d){var e,g="";c&&(e=new Date,e.setTime(e.getTime()+864E5*c),g="; expires="+e.toGMTString());c&&d&&K(a);a=a+"="+b+g+"; path=/";d&&(a+=";domain="+d);
document.cookie=a}function K(a){var b=a+"=; expires=Thu, 01 Jan 1970 00:00:01 GMT;",c=".kanzhun.com www.kanzhun.com .www.kanzhun.com bosszhipin.kanzhun.com .bosszhipin.kanzhun.com m.kanzhun.com .m.kanzhun.com t.kanzhun.com .t.kanzhun.com wx.kanzhun.com .wx.kanzhun.com t.bosszhipin.com .t.bosszhipin.com yushanapp.com zdzhushou.cc".split(" ");for(a=0;a<c.length;a++)document.cookie=b+"domain="+c[a],document.cookie=b+"domain="+c[a]+"; path=/";document.cookie=b;document.cookie=b+"; path=/"}function r(a){var b,
c=a+"=",d=document.cookie.split(";");for(a=0;a<d.length;a++){for(b=d[a];" "==b.charAt(0);)b=b.substring(1,b.length);if(0==b.indexOf(c))return b.substring(c.length,b.length)}return null}function C(a){if(0==a.indexOf("http")){var b=a.indexOf("/",7);0<b&&(a=a.substr(b))}return a}function L(a,b){var c,d,e,g,f,h,l,n=[u,z,v,"t","ab_t","wt"],k={};for(c=0;c<n.length;c++)d=n[c],(e=r(d))&&(k[d]=e);if(g=document.referrer,g&&location.hostname==M(g)&&(g=C(g,location.hostname)),b?k.e=(new Date).getTime()-D:window.performance&&
window.performance.timing&&(f=window.performance.timing,f.fetchStart&&(k.e=D-f.fetchStart)),k.r=g,k._=Math.round((new Date).getTime()/1E3),h = (typeof _PK != 'undefined' ? _PK : document.getElementById("page_key_name") && document.getElementById("page_key_name").getAttribute("value")),h && (k.pk = h), a) for (l in a) k[l] = a[l];return k}function N(){var a,b,c,d,e,g,f,h,l,m,k,w,p,q;if(!E){E=!0;a=r(u);b=r(F);c=r(z);var t,x={};if(c)for(0===c.indexOf("%22")&&(c=c.substr(3,c.length-6)),c=c.split("&"),e=0;e<c.length;e++)t=c[e].split("="),2==t.length&&(x[decodeURIComponent(t[0])]=decodeURIComponent(t[1]));c=Math.round((new Date).getTime()/1E3);b&&x.l||(x.l=C(location.href));b||(x.r=document.referrer);b||(n(F,c),b=c+"");a:{t=window.location.search.substring(1).split("&");for(e=0;e<t.length;e++)if(d=t[e].split("="),2==d.length&&"sid"==decodeURIComponent(d[0])){d=decodeURIComponent(d[1]);break a}d=""}e=!1;d?(d!==r(v)&&(e=!0),n(v,d),x.g=C(location.href)):(d=r(v),d||(d="-",n(v,d)));n(z,B(x,"&"));a&&8==a.split(".").length?(q=a.split("."),g=q[0],f=q[1],h=q[2],l=q[3],m=+q[4],k=+q[5],w=+q[6],p=+q[7],m+=1,l!=
b?(h=l,l=b,k+=1,w=1):w+=1):(g=Math.floor(1E8*Math.random()),f=c,h="",l=b,m=1,k=1,w=1,p=0);e&&(p=0);a=[g,f,h,l,m,k,w,p+1].join(".");A?0<=location.hostname.indexOf("kanzhun.com")?n(u,a,3650,".kanzhun.com"):n(u,a,3650):n(u,a,3650)}}function O(){N();I("/_.gif",L())}function G(a){return a&&0!==a.indexOf("javascript")?a:""}function p(a,b,c,d){if(!a)throw"event track's label params is required";N();a={ca:a};(b=G(b))&&(a.p1=b);(c=G(c))&&(a.p2=c);(d=G(d))&&(a.p3=d);d=L(a,!0);I("/e.gif",d)}var M,D,u,F,z,v,
E,H,A=0<=location.hostname.indexOf("kanzhun.com")||0<=location.hostname.indexOf("bosszhipin")||0<=location.hostname.indexOf("nnhfg.com")||0<=location.hostname.indexOf(".zhipin.com")||0<=location.hostname.indexOf("dianzhangzhipin")||0<=location.hostname.indexOf("qqchx.com")||0<=location.hostname.indexOf("yushanapp.com")||0<=location.hostname.indexOf("zdzhushou.cc"),y=location.hostname.toLowerCase(),J=!1,m="";0<=y.indexOf("bosszhipin")||0<=y.indexOf("weizhipin")||0<=y.indexOf(".zhipin")||0<=y.indexOf(".yushanapp")||
0<=y.indexOf(".zdzhushou")?(J=!0,m=A?"t.bosszhipin.com":"t.weizhipin.com"):m=A?"t.kanzhun.com":"192.168.1.251";M=function(){var a=document.createElement("a");return function(b){return b?(a.href=b,a.hostname):""}}();D=(new Date).getTime();u="__a";F="__c";z="__l";v="__g";E=!1;window._T;window._T={config:function(a){a=a||{};m=a.domain||m},sendPageView:O,sendEvent:p};O();(function(){var a,b,c=document.getElementsByTagName("impression");if(c.length){a=[];for(b=0;b<c.length;)a.push(c[b].getAttribute("value")),
b+=1;1==a.length?p("impression",a[0]):2==a.length?p("impression",a[0],a[1]):3==a.length&&p("impression",a[0],a[1],a[2])}})();window.onerror=function(a,b,c,d,e){return"Script error."==a||b?(setTimeout(function(){var a,f,h,l;if(d=d||window.event&&window.event.errorCharacter||0,l=d,e&&e.stack)a=e.stack.toString();else if(arguments.callee){a=[];f=arguments.callee.caller;for(h=3;f&&0<--h&&(a.push(f.toString()),f!==f.caller);)f=f.caller;a=a.join(",")}p("errorjs",b+":"+c+":"+l,a)},0),void 0):!0};A&&(H=r("t"),
H&&location.hostname&&0<=location.hostname.indexOf("kanzhun.com")&&(K("t"),n("t",H,3650)))}();

(function(win) {
    win.upp = function(url) {
        this._url = url;
        this._init();
    };
    upp.prototype = {
        _init:function() {
            var addressPair = this._url.split("?"), i = 0, keypairs = [];
            this.host = addressPair[0];
            this._params = {};
            if (addressPair.length > 1) {
                keypairs = addressPair[1].split("&");
                for (;i < keypairs.length; i++) {
                    var keypair = keypairs[i].split("=");
                    this.add(keypair[0], keypair[1]);
                }
            }
        },
        add:function(_key, _value) {
            this._params[_key] = _value;
            return this;
        },
        remove:function(key) {
            delete this._params[key];
            return this;
        },
        contains:function(key, value) {
            return this._params[key] !== undefined;
        },
        update:function(key, value) {
            this._params[key] = value;
        },
        get:function(key) {
            return this._params[key];
        },
        all:function() {
            return this._params;
        },
        url:function() {
            var queryStrings = [];
            for (var key in this._params) {
                queryStrings.push(key + "=" + this._params[key]);
            }
            return this.host + (queryStrings.length > 0 ? "?" :"") + queryStrings.join("&");
        }
    };
})(window);

(function() {
    if (window._T) {
        var _body = document.getElementsByTagName("body")[0], addEvent = function(obj, type, fn) {
            if (obj.addEventListener) obj.addEventListener(type, fn, false); else if (obj.attachEvent) {
                //保存指针 供removeEvent时使用
                obj["e" + type + fn] = fn;
                obj.attachEvent("on" + type, function() {
                    obj["e" + type + fn].call(obj, window.event);
                });
            }
        };
        if (_body) {
            addEvent(_body, "click", function(e) {
                var target = e.target || e.srcElement;
                while (target !== document && target !== document.body && target.getAttribute && !target.getAttribute("ka") && target.parentNode) {
                    target = target.parentNode;
                }
                if (!target.getAttribute) return;
                var k = target.getAttribute("ka");
                if (k) {
                    var p = target.getAttribute("href") || "";
                    if (p && p.indexOf("#") !== 0 && p.indexOf("javascript:;") === -1 && !target.getAttribute("noa")) {
                        var u = new window.upp(p);
                        //加白名单判断--start
                        var whiteLlist = [ "bosszhipin.com", "kanzhun.com", "weizhipin.com" ];
                        var len = whiteLlist.length;
                        var flag = false;
                        if (p.indexOf("http://") >= 0 || p.indexOf("https://") >= 0) {
                            for (var i = 0; i < len; i++) {
                                if (p.indexOf(whiteLlist[i]) >= 0) {
                                    flag = true;
                                    break;
                                }
                            }
                        } else {
                            flag = true;
                        }
                        if (flag) {
                            u.add("ka", encodeURIComponent(k));
                            if (!target.getAttribute("xieyi") == "") {
                                target.setAttribute("href", u.url() + "#" + target.getAttribute("xieyi"));
                            } else if(p.indexOf("tel:") == -1 && p.indexOf("mailto:") == -1) {//排除tel和mailto
                                target.setAttribute("href", u.url());
                            }
                        }
                    }
                    _T.sendEvent(k, p);
                }
            });
        }
    }
    if (typeof $ != "undefined") {
        $("[iska]").each(function(index, element) {
            var T = $(this);
            T.click(function(e) {
                $("<i ka=" + T.attr("ka") + " style='display:none'></i>").appendTo("body").click().delay(200).remove();
                e.stopPropagation();
            });
        });
    }
})();

