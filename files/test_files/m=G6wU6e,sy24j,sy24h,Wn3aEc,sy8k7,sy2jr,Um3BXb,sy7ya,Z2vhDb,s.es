loaded_h_0(function(_){var window=this;
_.t("G6wU6e");
_.AtF=new _.Ke(_.q0a);
_.u();
_.AG=class extends _.m{constructor(a){super(a)}DOb(){return _.wd(this,_.rG,2)}};_.AG.prototype.ob="X2sNs";
_.Noe=_.x("Wn3aEc",[]);
_.t("Wn3aEc");
var Poe;Poe=function(a){if((0,_.Jle)(a))return a;if((0,_.mLc)(a)){let c,d;a=(c=a.Ca())==null?void 0:(d=c.ze())==null?void 0:d.getExtension(_.sG);if(!a)return null}let b;return a.getType()===1?(b=a.getImage())!=null?b:null:null};
_.Qoe=class extends _.kh{static Sa(){return{Ef:{wqc:_.AG}}}constructor(a){super();this.oa=a.Ef.wqc;this.Aa=_.qe();this.Ba=_.qe();this.results=new Map;a:{if(this.getData("vnora").Lb()){a=_.Pl("WA6vPb",this.Ca());if(a.length===1){a=Number(_.Te(a[0],"count"));break a}a=_.Pl("LgL7He",this.Ca());if(a.length===1){a=Number(_.Te(a[0],"count"));break a}}a=_.ad(this.getData("count"),-1)}this.Da=a}Nca(){if(this.Da<0){const a=this.oa?_.p(this.oa,_.rG,2):null;return a?_.sf(a.xu()):_.sf([])}return this.Aa.promise}xu(){return this.Nca().then(a=>
a.map(Poe).filter(b=>b!=null))}TGc(){return this.Ba.promise}gje(){return this.TGc().then(a=>{const b=new Map;for(const [c,d]of a){a=c;const e=Poe(d);e&&b.set(a,e)}return b})}iA(a,b){b&&_.Ooe(b)&&this.results.set(a,b);if(--this.Da===0){this.Aa.resolve(Array.from(this.results.entries()).sort((c,d)=>_.lHa(c[0],d[0])).map(c=>c[1]));a=new Map;for(const [c,d]of this.results.entries()){b=c;const e=d;e&&a.set(b,e)}this.Ba.resolve(a)}}};_.Jr(_.Noe,_.Qoe);
_.u();
_.ygC=_.x("Um3BXb",[_.Noe]);
_.cUe=!!(_.xh[38]>>27&1);_.dUe=!!(_.xh[39]&2);_.eUe=!!(_.xh[39]&8);_.fUe=!!(_.xh[39]&128);_.gUe=!!(_.xh[39]&2048);
_.t("Um3BXb");
var EtF,CtF,FtF;_.DtF=function({construct:a}){CtF.push({construct:a})};EtF=_.Ob(_.qG);CtF=[];
FtF=class extends _.Wr{static Sa(){return{model:{iaa:_.Qoe},Ef:{iWc:_.qG}}}constructor(a){super(a.Oa);this.oa=!this.getData("ni").Lb();this.Ds=a.Ef.iWc;if((this.Ba=this.getData("au").Lb())&&this.Ds){var b=(b=this.getRoot().closest(_.fo("jsname","uK8Ylc")).el())?_.Te(b,"ved"):null;const e=EtF(this.Ds.serialize());if(b&&e&&e.Pj()){var c;(c=e.getImage())!=null&&_.Uf(c,5,b)}this.Ds=e}a.model.iaa.iA(this.getRoot().el(),this.Ds);_.nz(this);let d;(c=(d=this.Ds)==null?void 0:d.getImage())&&this.trigger("cEfxe",
c==null?void 0:c.getUniqueId());this.P2(a)}g5a(){let a,b;return(b=(a=this.Ds)==null?void 0:a.getImage())!=null?b:null}Ca(a){var b=a.targetElement.parent();a=_.Ql("srrRv",this.getRoot().el());b=_.cs(this,b.eq(0),"YsWoif").el();_.Uv([new _.On(b,"show")],{triggerElement:b,userAction:9});_.Nf(b,"BUYwVb");a==null&&_.tm(b,"display","inline-block")}Da(a){const b=a.targetElement;a=a.targetElement.parent();a=_.cs(this,a.eq(0),"YsWoif").el();_.Uv([new _.On(a,"hide")],{triggerElement:b.eq(0).el(),userAction:9});
_.tm(a,"display","none")}Oc(a){if(this.Ds&&this.Ds.getId()){var b,c;(c=(b=a.event).preventDefault)==null||c.call(b);var d,e;(e=(d=a.event).stopPropagation)==null||e.call(d);this.trigger("PdWSXe",{rv:a.event});var f;(a=(f=this.Ds)==null?void 0:f.getImage())&&this.trigger("Kc2lDe",a==null?void 0:a.getUniqueId())}}Ff(){this.notify("BUYwVb")}hf(){this.oa||(_.Uv([new _.On(this.getRoot().el(),"show")]),this.oa=!0)}hidden(){}P2(a){for(const b of CtF)b.construct(this,a)}Aa(){this.notify("BUYwVb");const a=
!_.ntv;this.getRoot().setStyle("display",a?"inline-flex":"unset");this.getRoot().removeAttr("aria-hidden");this.hf()}};FtF.prototype.$wa$bNsLWe=function(){return this.Aa};FtF.prototype.$wa$L6cTce=function(){return this.hidden};FtF.prototype.$wa$TSZdd=function(){return this.hf};FtF.prototype.$wa$AwdEqd=function(){return this.Ff};FtF.prototype.$wa$h5M12e=function(){return this.Oc};FtF.prototype.$wa$XEuVS=function(){return this.Da};FtF.prototype.$wa$RrAr1=function(){return this.Ca};
FtF.prototype.$wa$TsqBdc=function(){return this.g5a};_.Yr(_.ygC,FtF);
var GtF=function(a,b,c,d){const e=a.Ya("tdeeNb");e.isEmpty()||(d=new _.En(_.$k(d.url)),c=d.get("imgrc")===c&&!d.get("imgdii")||d.get("vhid")===c,c||(a=a.getRoot(),e.hasClass("srrRv")&&(d=e.prev(),b.eAe(a,d))),e.toggleClass("srrRv",c))},ItF=function(a,b){if(!a.closest(g=>HtF.some(h=>g.classList.contains(h))).isEmpty()){var c=a.el().getBoundingClientRect();a=a.parent();a.hasClass("dECn0b")&&(a=a.closest(".T62xob"));var d=a.el().getBoundingClientRect();a=c.top===d.top;var e=Math.abs(d.bottom-c.bottom)<
8,f=Math.abs(d.left-c.left)<8;c=Math.abs(d.right-c.right)<8;b.toggleClass("Xn9Tkc",a&&f);b.toggleClass("oGwWse",a&&c);b.toggleClass("y0jvId",e&&c);b.toggleClass("lM9tvf",e&&f)}},HtF=["DhGrzc","l5X1Ye","o6uAG","OXEsB","T62xob"];
_.DtF({construct(a){const b=_.ll(a.getData("docid"));b&&(_.gUe?(document.addEventListener("viewerUpdated",f=>{f=f.detail.vhid.replace("e-","")===b;a.Ya("tdeeNb").toggleClass("srrRv",f)}),document.addEventListener("viewerClosed",()=>{a.Ya("tdeeNb").toggleClass("srrRv",!1)})):_.jg(a,{service:{wJc:_.CG,focus:_.AtF}}).then(f=>{const g=f.service.focus;f=f.service.wJc;f.addListener(h=>{GtF(a,g,b,h)});GtF(a,g,b,f.getState())},f=>void _.Wd(f)));const c=a.getRoot();_.Ef(c.el(),"qWWJ8e",()=>{ItF(c,a.Ya("tdeeNb"))});
ItF(c,a.Ya("tdeeNb"));let d=null;const e=a.Ya("qQjpJ").el();e&&(e.addEventListener("mouseenter",()=>{d===null&&(d=(0,_.Un)(()=>{c.toggleClass("dB3j8",!0);d=null},50))}),e.addEventListener("mouseleave",()=>{d&&((0,_.Vn)(d),d=null);c.toggleClass("dB3j8",!1)}))}});
_.u();
_.G2B=_.x("Z2vhDb",[]);
_.t("Z2vhDb");
var iLC=_.KB("xg558"),jLC=_.KB("wCwf3e");var kLC=class extends _.Wr{static Sa(){return{vk:{edc:iLC,Qnc:jLC}}}constructor(a){super(a.Oa);this.edc=a.vk.edc;this.Qnc=a.vk.Qnc}oa(a){this.edc&&this.edc(a)}Aa(a){this.Qnc&&this.Qnc(a)}};kLC.prototype.$wa$RAHB1d=function(){return this.Aa};kLC.prototype.$wa$rN5So=function(){return this.oa};_.Yr(_.G2B,kLC);
_.u();
_.AgC=_.x("XN4wKf",[_.hr]);
_.t("XN4wKf");
var suF=class extends _.Wr{static Sa(){return{service:{Af:_.tw}}}constructor(a){super(a.Oa);this.Af=a.service.Af}oa(){var a=this.getRoot().closest(_.eo("Lv2Cle"));_.Rg(this.getData("irtcp"),!1)&&a.find(".ZGKPYc").setStyle("max-height","unset");const b=_.mo(a,"[data-ni]");_.Nf(a.el(),"XGRTMd");_.Nf(a.el(),"DdQV6c");this.getRoot().hide();_.Uv([new _.On(this.getRoot().el(),"hide")]);_.Vv(this.getRoot().el());a=_.mo(a,".aQ9ZH");a.show();_.Uv([new _.On(a.el(),"show")]);this.Af.hU(b);return!1}};
suF.prototype.$wa$in3Ghc=function(){return this.oa};_.Yr(_.AgC,suF);
_.u();
});
// Google Inc.
