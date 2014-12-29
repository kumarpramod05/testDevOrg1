angular.module('meyouthere').run(['$templateCache', function($templateCache) {
  'use strict';

  $templateCache.put('events/directives/event-relation-update.tmpl.html',
    "<div class=\"modal-header\">\n" +
    "    <h3 class=\"modal-title\">{{event.subject}}</h3>\n" +
    "</div>\n" +
    "\n" +
    "<div class=\"modal-body\" ng-show=\"!errors\">\n" +
    "    <span ng-hide=\"errors\">\n" +
    "        <textarea ng-model=\"event.confirmationResponse\" placeholder=\"Enter optional response\" style=\"width:100%;\" rows=\"8\"></textarea>\n" +
    "    </span>\n" +
    "</div>\n" +
    "<div class=\"modal-body\" ng-show=\"errors\">\n" +
    "    <mut-messages mut-data=\"errors\" />\n" +
    "</div>\n" +
    "<div class=\"modal-footer\">\n" +
    "    <span ng-show=\"processing\"> {{processingMessage}} <mut-loading mut-size=\"s\" mut-mode=\"i\"/> </span>\n" +
    "    <span>\n" +
    "        <button class=\"btn btn-success\"  ng-class=\"{'btn-success':confirmationStatus == 'Accepted', 'btn-warning':confirmationStatus == 'Maybe', 'btn-danger':confirmationStatus == 'Declined'}\" \n" +
    "                ng-click=\"updateConfirmation()\" ng-hide=\"processing\">{{submitButtonLabel}}</button>\n" +
    "    </span>\n" +
    "    <button class=\"btn btn-default\" ng-click=\"$close()\" ng-hide=\"processing\">Close</button>\n" +
    "</div>\n"
  );


  $templateCache.put('shared-components/directives/distance.tmpl.html',
    "{{getDistanceFromLatLon(mutFromLat, mutFromLong, mutToLat, mutToLong, mutUom) | number:2}} {{mutUom == 'm' ? 'm' : 'km'}}"
  );


  $templateCache.put('shared-components/directives/loading.tmpl.html',
    "<div class=\"forceInlineSpinner indicator oneCenterStage\"  ng-show=\"mutMode == 'c'\">\n" +
    "   <img class=\"loading\" ng-class=\"{'large':mutSize == 'l', 'medium':mutSize == 'm', 'small':mutSize == 's'}\" alt=\"Loading\" src=\"/auraFW/resources/aura/s.gif\"  >\n" +
    "</div>\n" +
    "\n" +
    "<div class=\"forceModalSpinner oneStyle oneOne\" ng-show=\"mutMode == 'm'\">\n" +
    "    <div class=\"modal-glass\">&nbsp;</div>\n" +
    "    <div class=\"indicatorContainer forceInlineSpinner\" role=\"alert\" >\n" +
    "        <img class=\"loading icon\" ng-class=\"{'large':mutSize == 'l', 'medium':mutSize == 'm', 'small':mutSize == 's'}\"  alt=\"Loading\" src=\"/auraFW/resources/aura/s.gif\">\n" +
    "        <div class=\"message\" id=\"_gModal_Message\">{{mutMessage}}</div>\n" +
    "    </div>\n" +
    "</div>\n" +
    "\n" +
    "\n" +
    "<span class=\"forceInlineSpinner\"  ng-show=\"mutMode == 'i'\">\n" +
    "   <img class=\"loading\" ng-class=\"{'large':mutSize == 'l', 'medium':mutSize == 'm', 'small':mutSize == 's'}\" alt=\"Loading\" src=\"/auraFW/resources/aura/s.gif\"  >\n" +
    "</span>"
  );


  $templateCache.put('shared-components/directives/meet-or-cancel.tmpl.html',
    "<div class=\"modal-header\">\n" +
    "    <h3 class=\"modal-title\">{{event.subject}}</h3>\n" +
    "</div> \n" +
    "<div class=\"modal-body\" ng-show=\"action == 'meet' && !errors\">\n" +
    "    Meet <span ng-show=\"event.whom.length >= 1\">&nbsp;{{event.whom[0]}}</span>\n" +
    "    <span ng-show=\"event.whom.length > 1\">&nbsp; + {{event.whom.length-1}}</span> at \"{{place.name}}\" ?\n" +
    "</div>\n" +
    "<div class=\"modal-body\" ng-show=\"action != 'meet' && !errors\">\n" +
    "    <span ng-hide=\"errors\">Are you sure you wish to remove this place from your meeting?</span>\n" +
    "</div>\n" +
    "<div class=\"modal-body\" ng-show=\"errors\">\n" +
    "    <!-- TODO: Directive on its own-->\n" +
    "    <mut-messages mut-data=\"errors\" />\n" +
    "</div>\n" +
    "<div class=\"modal-footer\">\n" +
    "    <span ng-show=\"processing\"> {{processingMessage}} <mut-loading mut-size=\"s\" mut-mode=\"i\"/> </span>\n" +
    "    <span ng-show=\"action == 'meet'\">\n" +
    "        <button class=\"btn btn-success\" ng-click=\"confirmMeet()\" ng-hide=\"processing\">Confirm</button>\n" +
    "    </span>\n" +
    "    <span ng-show=\"action != 'meet'\">\n" +
    "        <button class=\"btn btn-danger\" ng-click=\"removeMeet()\" ng-hide=\"processing\">Remove</button>\n" +
    "    </span>\n" +
    "    <button class=\"btn btn-default\" ng-click=\"$close()\" ng-hide=\"processing\">Close</button>\n" +
    "</div>\n"
  );


  $templateCache.put('shared-components/directives/messages.tmpl.html',
    "<alert ng-repeat=\"alert in mutData\" type=\"{{alertTypeForSeverity(alert.severity)}}\">{{alert.summary}}</alert>"
  );


  $templateCache.put('shared-components/directives/modal-confirm.tmpl.html',
    "\n" +
    "<div class=\"modal-header\">\n" +
    "    <h3 class=\"modal-title\">{{attrs.mutTitle}}</h3>\n" +
    "</div>\n" +
    "\n" +
    "<div class=\"modal-body\" ng-show=\"!errors\">\n" +
    "    {{attrs.mutMessage}}\n" +
    "</div>\n" +
    "\n" +
    "<div class=\"modal-body\" ng-show=\"errors\">\n" +
    "    <mut-messages mut-data=\"errors\" />\n" +
    "</div>\n" +
    "<div class=\"modal-footer\">\n" +
    "    <span ng-show=\"processing\"> {{processingMessage}} <mut-loading mut-size=\"s\" mut-mode=\"i\"/> </span>\n" +
    "    <span ng-show=\"attrs.mutButton1Label\">\n" +
    "        <button class=\"btn btn-success\"  ng-class=\"{'btn-success': attrs.mutButton1Type == 'success', 'btn-warning': attrs.mutButton1Type == 'warning', 'btn-danger': attrs.mutButton1Type == 'danger'}\" \n" +
    "                ng-click=\"onButton1Click()\" ng-hide=\"processing\">{{attrs.mutButton1Label}}</button>\n" +
    "    </span>\n" +
    "    <button class=\"btn btn-default\" ng-click=\"$close()\" ng-hide=\"processing || mutButtonDismissHide\">Close</button>\n" +
    "</div>\n"
  );


  $templateCache.put('shared-components/directives/rating.tmpl.html',
    "<span class=\"text-warning\" ng-repeat=\"prc in createIntArray(mutVal)\">{{mutChar}}</span><span class=\"text-muted\" ng-repeat=\"prc in createIntArray(mutMax - mutVal)\">{{mutChar}}</span>"
  );


  $templateCache.put('shared-components/directives/search-filters-item.tmpl.html',
    "<span class=\"pull-right\">\n" +
    "    <span ng-if=\"filterOb.Type=='PicklistText'\">\n" +
    "        <div class=\"btn-group\" style=\"margin-bottom:5px\">\n" +
    "            <button class=\"btn btn-sm btn-default\" ng-repeat=\"o in filterOb.Options\" type=\"button\" \n" +
    "                    ng-click=\"setValue(o.Value)\" ng-class=\"{'active' : o.Value == filterOb.Value }\">{{o.Label}}</button>\n" +
    "            \n" +
    "        </div>\n" +
    "         <input class=\"form-control\" ng-model=\"filterOb.Value\" placeholder=\"{{o.Label}}\"/>\n" +
    "    </span>\n" +
    "    <span ng-if=\"filterOb.Type=='Text'\">\n" +
    "        <input class=\"form-control \" type=\"text\" ng-model=\"filterOb.Value\"/>\n" +
    "    </span>\n" +
    "    <span ng-if=\"filterOb.Type=='Number'\">\n" +
    "        <input class=\"form-control \" type=\"number\" ng-model=\"filterOb.Value\"/>\n" +
    "    </span>\n" +
    "    <span ng-if=\"filterOb.Type=='Time'\">\n" +
    "        <input class=\"form-control \" type=\"time\" ng-model=\"filterOb.Value\"/>\n" +
    "    </span>\n" +
    "    <span ng-if=\"filterOb.Type=='Date'\">\n" +
    "        <input type=\"date\" class=\"form-control \" ng-model=\"filterOb.Value\"/>\n" +
    "    </span>\n" +
    "    <span ng-if=\"filterOb.Type=='Picklist'\">\n" +
    "        <select ng-model=\"filterOb.Value\" ng-options=\"o.Value as o.Label for o in filterOb.Options\"></select>\n" +
    "    </span>     \n" +
    "    <span ng-if=\"filterOb.Type=='MultiSelectPicklist'\">\n" +
    "        <select multiple ng-required=\"filterOb.Validation.isRequired\"  ng-model=\"filterOb.Value\" ng-options=\"o.Value as o.Label for o in filterOb.Options\"></select>\n" +
    "    </span>\n" +
    "</span>     \n" +
    "\n"
  );


  $templateCache.put('shared-components/directives/search-filters.tmpl.html',
    "<div class=\"container\">\n" +
    "    <ul class=\"list-group filterOptions\">\n" +
    "        <li ng-repeat=\"filteritem in filterObs.metadata | filter:{isVisible:true}\" class=\"list-group-item row\">\n" +
    "            <span class=\"col-xs-5\">\n" +
    "                <span ng-show=\"!filteritem.isSortable\">{{filteritem.Label}}</span><a href=\"#\" ng-show=\"filteritem.isSortable\" ng-click=\"updateSortOrder(filteritem.Label)\"> {{filteritem.Label}} <small ng-show=\"filteritem.isSortable\" ng-class=\"{'text-muted' : filterObs.SortBy != filteritem.Label, 'text-primary' : filterObs.SortBy == filteritem.Label}\"><i class=\"glyphicon glyphicon-sort-by-attributes\"/></small></a>\n" +
    "            </span>\n" +
    "            <span class=\"col-xs-7\" filteritem=\"#\" filter-ob=\"filteritem\"></span>\n" +
    "        </li>\n" +
    "    </ul>\n" +
    "    <div class=\"bar bar-standard bar-footer\" style=\"padding-top:6px;\">\n" +
    "        <div class=\"col-xs-6\">\n" +
    "            <button class=\"btn btn-default btn-sm btn-block\" ng-click=\"onCloseFilters()\">Close</button>\n" +
    "        </div>\n" +
    "        <div class=\"col-xs-6\">\n" +
    "            <button class=\"btn btn-primary btn-sm btn-block\" ng-click=\"onUpdateFilters()\">Save Filters</button>\n" +
    "        </div>\n" +
    "    </div>\n" +
    "</div>\n"
  );


  $templateCache.put('shared-components/directives/view-footer.tmpl.html',
    "<div class=\"bar bar-standard bar-footer\">\n" +
    "  <div>\n" +
    "  <span ng-repeat=\"btn in modal.leftButtons\">\n" +
    "  \t\n" +
    "  \t<a mut-loading-click=\"onButtonClick(btn)\" ng-show=\"btn.useLoadingClick\"\t  \t\n" +
    "\t  \tclass=\"icon pull-left\" ng-class=\"btn.cssClass\">  {{btn.label}}\n" +
    "   \t</a>\n" +
    "\n" +
    "   \t<a ng-click=\"onButtonClick(btn)\" ng-show=\"!btn.useLoadingClick\"\t  \t\n" +
    "\t  \tclass=\"icon pull-left\" ng-class=\"btn.cssClass\">  {{btn.label}}\n" +
    "   \t</a>\n" +
    "   \t\n" +
    "  </span>\n" +
    "\n" +
    "  <small class=\"updated-text\">{{modal.statusText}}</small>\n" +
    "\n" +
    "  <span ng-transclude></span>\n" +
    "\n" +
    "\t<span ng-repeat=\"btn in modal.rightButtons\">\n" +
    "  \t\n" +
    "  \t\t<a mut-loading-click=\"onButtonClick(btn)\" ng-show=\"btn.useLoadingClick\"\t\t  \t\n" +
    "\t\t  \tclass=\"icon pull-right\" ng-class=\"btn.cssClass\">  {{btn.label}}\n" +
    "\t   \t</a>\n" +
    "\n" +
    "\t   \t<a ng-click=\"onButtonClick(btn)\" ng-show=\"!btn.useLoadingClick\"\t  \t\n" +
    "\t\t  \tclass=\"icon pull-right\" ng-class=\"btn.cssClass\">  {{btn.label}}\n" +
    "\t   \t</a>\n" +
    "\t   \t\n" +
    "\t</span>\n" +
    "  </div>  \n" +
    "</div>\n" +
    "\n"
  );

}]);

/*! me-you-there 2014-10-05 */
"use strict";!function(a,angular){var b=angular.module("meyouthere.controllers.events",["ui.router","meyouthere","mAnalytics","meyouthere.factories.vf-page-data","meyouthere.controllers.events","meyouthere.services.remote-actions","meyouthere.directives.view-footer","meyouthere.directives.view-content","meyouthere.directives.loading-click","meyouthere.directives.searchfilter","meyouthere.directives.loading","meyouthere.directives.messages","meyouthere.directives.event-relation-update","meyouthere.directives.modal-confirm","meyouthere.factories.filters"]);b.controller("EventListController",["$scope","$timeout","$q","gaServices","MUTRemoteActions","VFPageData","$rootScope","$state","MUTFilterCache",function(b,c,d,e,f,g,h,i,j){var k=864e5;if(b.processing=!0,b.security=g.security,b.vfPageData=g,e.recordView("EventList"),b.filters=j.get(),!b.filters||"events"!=b.filters.type)b.filters={type:"events",metadata:[{Name:"startDate",Label:"Date",Type:"Date",Value:new Date,isVisible:!0},{Name:"showingEventForHowManyDays",Label:"Number of Days",Type:"Picklist",isVisible:!0,Options:[{Label:"7",Value:"7"},{Label:"14",Value:"14"},{Label:"30",Value:"30"}],Value:"7"}],current:null,apply:function(){var a={};angular.forEach(this.metadata,function(a){this[a.Name]=a.Value},a),this.current=a},showParentPage:function(){i.go("events")},applyAndReloadEvents:function(){this.apply()},calcualteDeltaFromToday:function(){return Math.round((this.current.startDate-new Date)/k)},calculateEndDate:function(){var a=new Date(this.current.startDate.getTime()+this.current.showingEventForHowManyDays*k);return a}},b.filters.apply(),j.put(b.filters);b.deleteEvent=function(a){var c=f.deleteEventById(a.sfdcEventId);return c.then(function(){b.loadEvents()}),c},b.loadEvents=function(){b.processing=!0,b.footerModal.statusText="",b.error=!1,f.loadEvents("",b.filters.calcualteDeltaFromToday(),b.filters.current.showingEventForHowManyDays).then(function(a){b.processing=!1,b.eventResult=a,b.footerModal.statusText="Showing "+a.totalSFDCEvents+" events",e.recordTiming("EventList")},function(a){b.processing=!1,b.error=a,alert("ERROR: "+a.message)})},b.normalisePlaceName=function(a){return a?a.replace("&amp;","&"):a},b.goToToday=function(){b.filters.metadata[0].Value=new Date,b.filters.applyAndReloadEvents(),b.loadEvents()},b.goBackInTime=function(){var a=b.filters.current.startDate.getTime();a-=b.filters.current.showingEventForHowManyDays*k;var c=new Date(a);b.filters.metadata[0].Value=c,b.filters.applyAndReloadEvents(),b.loadEvents()},b.goForwardInTime=function(){var a=b.filters.current.startDate.getTime();a+=b.filters.current.showingEventForHowManyDays*k;var c=new Date(a);b.filters.metadata[0].Value=c,b.filters.applyAndReloadEvents(),b.loadEvents()},b.newEvent=function(){sforce.one.createRecord("Event"),e.recordView("NewItem")},b.editItem=function(b){e.recordView("EditItem");try{sforce.one.editRecord(b)}catch(c){a.location="/"+b+"/e"}},b.locatNav=function(a){if(a.place)i.go("place-detail",{eventId:a.sfdcEventId,gPlaceId:a.place.remoteId});else i.go("places",{eventId:a.sfdcEventId})},b.goTo=function(a){b.processing=!0,sforce.one.navigateToURL(a),b.processing=!1},b.showNextCard=function(c){b.processing=!0;(new Date).getTime();try{sforce.one.navigateToSObject(c)}catch(d){a.location="/"+c}b.processing=!1},b.footerModal={leftButtons:[{cssClass:"",label:"New",useLoadingClick:!0,callback:function(){b.newEvent()}}],statusText:"",rightButtons:[{cssClass:"",label:"Filters",useLoadingClick:!1,callback:function(){i.go("filters")}}]},b.loadEvents()}])}(window,window.angular),function(a,angular){var b=angular.module("meyouthere.controllers.test",["ui.router","meyouthere","mAnalytics","meyouthere.factories.vf-page-data","meyouthere.controllers.events","meyouthere.services.remote-actions","meyouthere.directives.view-footer","meyouthere.directives.view-content","meyouthere.directives.loading-click","meyouthere.directives.searchfilter","meyouthere.directives.loading","meyouthere.directives.messages","meyouthere.directives.event-relation-update","meyouthere.directives.modal-confirm"]);b.controller("TestCtrl",["$scope","$state",function(a,b){a.hello="world",a.showEvents=function(){b.go("events")},a.showEventsViaNavigateToUrl=function(){sforce.one.navigateToURL("/apex/events#/events")},a.items=[],a.push=function(){a.items.push(+new Date)},a.pop=function(){a.items.pop()}}])}(window,window.angular),function(a,angular){var b=angular.module("meyouthere.directives.event-relation-update",["ui.bootstrap","meyouthere.directives.loading","meyouthere.directives.messages","meyouthere.services.remote-actions"]);b.directive("mutEventRelationUpdate",["$modal","$rootScope","$q","MUTRemoteActions",function(a,b,c,d){return{restrict:"A",scope:{mutStatus:"@",mutEvent:"=",mutRefreshEventsCallback:"&"},link:function(b,c){var e=["$scope","$modalInstance","eventStatusInfo",function(a,b,c){if(a.event=c.event,a.confirmationStatus=c.status,a.refreshEventsCallback=c.refreshEventsCallback,a.processing=!1,a.confirmationStatus==a.event.confirmationStatus)a.submitButtonLabel="Update";else{var e={Accepted:"Accept",Declined:"Decline",Maybe:"Not Sure"};a.submitButtonLabel=e[a.confirmationStatus]}a.processingMessage="Updating event ...!",a.errors=null;var f=function(b){if(a.processing=!1,b.result&&b.result.messages)a.errors=b.result.messages;else if(b.message)a.errors=[{severity:"ERROR",summary:b.message}];else a.errors=[{severity:"FATAL",summary:"Unknown error, please try again later !"}]};a.updateConfirmation=function(){a.processing=!0,a.event.confirmationStatus=a.confirmationStatus,d.addInviteeResponse(a.event.parentEventId,a.confirmationStatus,a.event.confirmationResponse||"").then(function(){if(a.refreshEventsCallback)a.refreshEventsCallback();b.dismiss("done")},f)},a.cancel=function(){b.dismiss("cancel")}}],f=function(){var c=a.open({templateUrl:"events/directives/event-relation-update.tmpl.html",controller:e,size:"sm",resolve:{eventStatusInfo:function(){return{event:b.mutEvent,status:b.mutStatus,refreshEventsCallback:b.mutRefreshEventsCallback}}}});c.result.then(function(){},function(){})};c.on("click",function(a){return a.preventDefault(),f(),!1})}}}])}(window,window.angular),function(a,angular){var b=angular.module("meyouthere.controllers.filters",["ui.router","meyouthere.factories.filters","meyouthere.directives.searchfilter","meyouthere.services.route-helper"]);b.controller("FiltersController",["$scope","$state","MUTFilterCache","MUTRouteHelper",function(a,b,c,d){a.filters=c.get(),a.filters.show=!0,a.applyFilters=function(){a.filters.apply(),d.gotoPreviousState(!0)},a.closeFilters=function(){d.gotoPreviousState(!0)}}])}(window,window.angular),function(a,angular){var b=angular.module("meyouthere.controllers.place-detail",["ui.router","meyouthere","ngGPlaces","ui.bootstrap","ngTouch","meyouthere.factories.vf-page-data","meyouthere.services.ggl-places-config","meyouthere.services.globalconfig","meyouthere.services.geolocation","meyouthere.services.remote-actions","meyouthere.directives.view-footer","meyouthere.directives.view-content","meyouthere.directives.meet-or-cancel","meyouthere.directives.distance","meyouthere.directives.rating","meyouthere.directives.messages","meyouthere.directives.loading"]);b.controller("PlaceDetailController",["$scope","VFPageData","$filter","$window","ngGPlacesAPI","MUTGooglePlacesConfig","$location","$anchorScroll","MUTGeoService","$rootScope","MUTRemoteActions","$state","$stateParams",function(a,b,c,d,e,f,g,h,i,j,k,l,m){function n(a,b,c,d,e,f,g){var h=new google.maps.LatLng(b,a),i=document.getElementById("map_canvas"),j={center:h,zoom:16,mapTypeId:google.maps.MapTypeId.ROADMAP},k=new google.maps.Map(i,j),l=new google.maps.Marker({position:h,map:k,title:c,animation:google.maps.Animation.DROP,draggable:!1}),m=new google.maps.InfoWindow;google.maps.event.addListener(l,"click",function(){m.setContent(d+"<br />"+(c||"")+"<br />"+(e||"")+"<br />"+(g||"")),m.open(k,this)})}a.processing=!0,a.gPlaceId=m.gPlaceId,a.distanceUOM=b.personalConfig.distanceUOM||"m";var o=f.defaults();o.placeId=a.gPlaceId,a.footerModal={leftButtons:[{useLoadingClick:!1,cssClass:"font-family-ratchet icon-left-nav",type:"back",label:"Back"}],statusText:"",rightButtons:[]},a.getImgSRC=function(a){return a.getUrl({maxWidth:a.width,maxHeight:a.height})},a.phoneNumber=function(a){if(a)return a.replace(" ","-");else return""},a.scrollToReviews=function(){g.hash("reviews"),h()};var p=function(){i.currentLocation().then(function(b){a.latLong={latitude:b.coords.latitude,longitude:b.coords.longitude}},function(a){}),e.placeDetails(o).then(function(b){a.processing=!1,a.letsMeetDetail=b,a.footerModal.statusText=b.name,n(b.geometry.location.B,b.geometry.location.k,b.formatted_address,b.name,b.website,b.rating,b.formatted_phone_number)})};k.loadEvent(m.eventId).then(function(b){a.event=b,p()},function(a){alert("ERROR: "+a.message)}),a.eventId=m.eventId}])}(window,window.angular),function(a,angular){var b=angular.module("meyouthere.controllers.places",["ui.router","meyouthere","ngGPlaces","ui.bootstrap","geocoder","meyouthere.services.remote-actions","meyouthere.factories.vf-page-data","meyouthere.services.ggl-places-config","meyouthere.services.globalconfig","meyouthere.services.geolocation","meyouthere.directives.view-footer","meyouthere.directives.view-content","meyouthere.directives.searchfilter","meyouthere.directives.meet-or-cancel","meyouthere.directives.distance","meyouthere.directives.loading","meyouthere.directives.messages","meyouthere.directives.rating","meyouthere.factories.filters"]);b.controller("PlaceListController",["$scope","VFPageData","$filter","$window","ngGPlacesAPI","MUTGooglePlacesConfig","$q","MUTGeoService","$rootScope","Geocoder","MUTRemoteActions","$stateParams","$state","MUTFilterCache",function(a,b,c,d,e,f,g,h,i,j,k,l,m,n){var o={};o.bar="Drinks",o.restaurant="Meal",o.cafe="Coffee";var p=function(b){var c=[];if(a.event.address)c.push({Label:"Them",Value:a.event.address});c.push({Label:"Me",Value:"Me"});var d=[];angular.forEach(o,function(a,b){this.push({Label:a,Value:b})},d),a.filters={type:"place-list",SortBy:"Location",metadata:[{Name:"Location",Label:"Location",Type:"PicklistText",Value:c[0].Value,isSortable:!1,isVisible:!0,Options:c},{Name:"Venue",Label:"Venue",Type:"Picklist",Value:b.venueCSV,isSortable:!1,isVisible:!0,Validation:{isRequired:!1},Options:d},{Name:"Radius",Label:"Radius",Type:"Number",Value:b.radius,isSortable:!1,isVisible:!0},{Name:"DistanceUnit",Label:"Distance Unit",Type:"Picklist",Value:b.distanceUOM,isSortable:!1,isVisible:!0,Options:[{Label:"KM",Value:"k"},{Label:"Mile",Value:"m"}]}],current:null,updateCurrent:function(){var a={};angular.forEach(this.metadata,function(a){this[a.Name]=a.Value},a),this.current=a},apply:function(){this.updateCurrent(),t()},showParentPage:function(){m.go("places",{eventId:l.eventId})},toggle:function(){this.show=!this.show},getLocationLabel:function(){return this.current.Location.length>10?this.current.Location.substring(0,11)+"...":this.current.Location},getVenueLabel:function(){return o[this.current.Venue]}},a.filters.updateCurrent()};a.showNextCard=function(a){m.go("place-detail",{eventId:l.eventId,gPlaceId:a})},a.getPlaceAddress=function(a){return a.vicinity?a.vicinity:a.formatted_address},a.footerModal={leftButtons:[{cssClass:"font-family-ratchet icon-left-nav",label:"Back",useLoadingClick:!1,type:"back"}],statusText:"",rightButtons:[{cssClass:"",label:"Filters",useLoadingClick:!1,callback:function(){m.go("filters")}}]};var q=function(){var b=g.defer(),c=a.filters.current.Location;if("Me"==c)h.currentLocation().then(function(c){a.latLong={latitude:c.coords.latitude,longitude:c.coords.longitude},b.resolve(a.latLong)});else if("Them"==c||c){var d="Them"==c?a.event.address:c;j.geocodeAddress(d).then(function(c){a.latLong={latitude:c.lat,longitude:c.lng},b.resolve(a.latLong)})}return b.promise},r=function(){var b=g.defer();return q().then(function(c){var d=angular.copy(c,{}),e=f.defaults();if(e=angular.extend(e,d),a.filters.current.Radius)e.radius=1e3*a.filters.current.Radius;e.minprice=0,e.types=[a.filters.current.Venue],b.resolve(e)}),b.promise},s=function(){var b=g.defer();return q().then(function(){var c=f.defaults();if(a.filters.current.Radius)c.radius=1e3*a.filters.current.Radius;c.minprice=0,c.query=a.filters.current.Venue+" near "+a.filters.current.Location,b.resolve(c)}),b.promise},t=function(){var c=a.filters.current,d={distanceUOM:c.DistanceUnit,venueCSV:c.Venue,radius:c.radius};return b.personalConfig=d,k.updatePlacesConfig(d).then(function(){},function(b){a.error=b,alert("ERROR: "+b.message)})},u=function(){a.isLoadingPlaces=!0,a.footerModal.statusText="";var b,c;if("Me"==a.filters.current.Location)b=r(),c=e.nearbySearch;else b=s(),c=e.textSearch;b.then(function(b){c.call(e,b).then(function(b){a.isLoadingPlaces=!1,a.placeList=b,a.footerModal.statusText="Showing "+b.length+" places"},function(b){a.isLoadingPlaces=!1})})};k.loadEvent(l.eventId).then(function(c){if(a.event=c,a.filters=n.get(),!a.filters||"place-list"!=a.filters.type)p(b.personalConfig),n.put(a.filters);u()},function(a){alert("ERROR: "+a.message)}),a.eventId=l.eventId}])}(window,window.angular),function(a,angular){var b=angular.module("meyouthere.directives.distance",[]);b.directive("mutDistance",function(){return{restrict:"E",scope:{mutFromLat:"=",mutFromLong:"=",mutToLat:"=",mutToLong:"=",mutUom:"="},templateUrl:"shared-components/directives/distance.tmpl.html",link:function(a){function b(a){return a*(Math.PI/180)}a.getDistanceFromLatLon=function(a,c,d,e,f){if(!(a&&d&&c&&e))return"Calculating..!";var g=6371;if(f&&"m"==f)g=.621371*g;var h=b(d-a),i=b(e-c),j=Math.sin(h/2)*Math.sin(h/2)+Math.cos(b(a))*Math.cos(b(d))*Math.sin(i/2)*Math.sin(i/2),k=2*Math.atan2(Math.sqrt(j),Math.sqrt(1-j)),l=g*k;return l}}}})}(window,window.angular),function(a,angular){var b=angular.module("meyouthere.directives.loading-click",["ui.bootstrap","meyouthere.directives.loading"]);b.directive("mutLoadingClick",["$compile","$timeout","$parse",function(a,b,c){return{restrict:"A",compile:function(d,e){var f=c(e.mutLoadingClick);return function(c,d){var e=function(g){d.unbind("click",e);var h=d.html(),i=a('<mut-loading mut-mode="i" mut-size="s"/>')(c);d.html(""),d.append(i),c.$apply(function(){f(c,{$event:g})}),b(function(){d.html(h),d.bind("click",e)},4e3)};d.click(e)}}}}])}(window,window.angular),function(a,angular){var b=angular.module("meyouthere.directives.loading",[]);b.directive("mutLoading",function(){return{restrict:"E",scope:{mutMode:"@",mutSize:"@",mutMessage:"@"},templateUrl:"shared-components/directives/loading.tmpl.html",link:function(a){a.mutSize=a.mutSize||"m",a.mutMode=a.mutMode||"i"}}})}(window,window.angular),function(a,angular){var b=angular.module("meyouthere.directives.meet-or-cancel",["ui.bootstrap","ui.router","meyouthere.directives.loading","meyouthere.directives.messages","meyouthere.services.remote-actions","meyouthere.factories.vf-page-data"]);b.directive("mutMeetOrCancel",["$modal","$rootScope","$q","MUTRemoteActions","VFPageData","$state",function(a,b,c,d,e,f){return{restrict:"A",scope:{mutAction:"@",mutPlace:"=",mutEvent:"="},link:function(b,c){var e=["$scope","$modalInstance","placeEventInfo",function(a,b,c){a.place=c.place,a.event=c.event,a.action=c.action,a.processing=!1,a.processingMessage="Please wait ...!",a.errors=null;var e=function(b){if(a.processing=!1,b.result&&b.result.messages)a.errors=b.result.messages;else if(b.message)a.errors=[{severity:"ERROR",summary:b.message}];else a.errors=[{severity:"FATAL",summary:"Unknown error, please try again later !"}]};a.isActionMeet=function(){return"meet"==a.action},a.confirmMeet=function(){a.processing=!0;var c={eventId:a.event.sfdcEventId,place:{name:a.place.name,remoteId:a.place.place_id,address:a.place.formatted_address?a.place.formatted_address:a.place.vicinity,geoLat:a.place.geometry.location.k,geoLng:a.place.geometry.location.B,iconURL:a.place.icon,priceLevel:a.place.price_level,rating:a.place.rating,typeCSV:a.place.types.join(",")}};d.confirmMeetingPlace(c).then(function(){a.processingMessage="Confirmed, loading events ...!",f.go("events"),b.dismiss("cancel")},e)},a.removeMeet=function(){a.processing=!0,d.removeConfirmedMeetingPlace(a.event.sfdcEventId,a.place.place_id).then(function(){a.processingMessage="Removed, loading events ...!",f.go("events"),b.dismiss("cancel")},e)},a.cancel=function(){b.dismiss("cancel")}}],g=function(){var c=a.open({templateUrl:"shared-components/directives/meet-or-cancel.tmpl.html",controller:e,size:"sm",backdrop:"static",resolve:{placeEventInfo:function(){return{place:b.mutPlace,event:b.mutEvent,action:b.mutAction}}}});c.result.then(function(){},function(){})};c.on("click",function(a){return a.preventDefault(),g(),!1})}}}])}(window,window.angular),function(a,angular){var b=angular.module("meyouthere.directives.messages",["ui.bootstrap"]);b.directive("mutMessages",function(){return{restrict:"E",scope:{mutData:"="},templateUrl:"shared-components/directives/messages.tmpl.html",link:function(a){a.alertTypeForSeverity=function(a){if("CONFIRM"==a)return"success";else if("ERROR"==a||"FATAL"==a)return"danger";else if("INFO"==a)return"info";else if("WARNING"==a)return"warning";return"info"}}}})}(window,window.angular),function(a,angular){var b=angular.module("meyouthere.directives.modal-confirm",["ui.bootstrap","meyouthere.directives.loading","meyouthere.directives.messages"]);b.directive("mutModalConfirm",["$modal","$rootScope","$q",function(a){return{restrict:"A",scope:{mutTitle:"@",mutMessage:"@",mutUseStaticBackdrop:"@",mutButton1Label:"@",mutButton1Type:"@",mutButton1Callback:"&",mutButton1ProcessingMessage:"@",mutButton1CallbackIsPromise:"@",mutButton2Label:"@",mutButton2Type:"@",mutButton2Callback:"&",mutButton2CallbackIsPromise:"@",mutButtonDismissHide:"@",mutButtonDismissLabel:"@",mutButtonDismissType:"@",mutButtonDismissCallback:"&"},link:function(b,c){var d=["$scope","$modalInstance","elementAttributes",function(a,b,c){a.attrs=c,a.processing=!1,a.processingMessage="Processing ...!",a.errors=null,a.cancel=function(){b.dismiss("cancel")};var d=function(b){if(a.processing=!1,b.result&&b.result.messages)a.errors=b.result.messages;else if(b.message)a.errors=[{severity:"ERROR",summary:b.message}];else a.errors=[{severity:"FATAL",summary:"Unknown error, please try again later !"}]};a.onButton1Click=function(){if(this.processing=!0,this.processingMessage=this.attrs.mutButton1ProcessingMessage||"Processing","true"==this.attrs.mutButton1CallbackIsPromise)this.attrs.mutButton1Callback().then(function(){b.dismiss("done")},d);else this.attrs.mutButton1Callback(),b.dismiss("done")}}],e=function(){var c=[];angular.forEach(b,function(a,b){if(0==b.indexOf("mut"))this[b]=a},c);var e=a.open({templateUrl:"shared-components/directives/modal-confirm.tmpl.html",controller:d,size:"sm",backdrop:"true"==b.mutUseStaticBackdrop,resolve:{elementAttributes:function(){return c}}});e.result.then(function(){},function(){})};c.on("click",function(a){return a.preventDefault(),e(),!1})}}}])}(window,window.angular),function(a,angular){var b=angular.module("meyouthere.directives.rating",[]);b.directive("mutRating",function(){return{restrict:"E",scope:{mutChar:"@",mutMax:"@",mutVal:"@"},templateUrl:"shared-components/directives/rating.tmpl.html",link:function(a){a.createIntArray=function(a){for(var b=new Array,c=1;a>=c;c++)b.push(c);return b}}}})}(window,window.angular),function(){var a=angular.module("meyouthere.directives.searchfilter",[]);a.directive("filteritem",function(){return{scope:{filterOb:"="},templateUrl:"shared-components/directives/search-filters-item.tmpl.html",link:function(a){a.setValue=function(b){a.filterOb.Value=b},a.updateSortOrder=function(b){a.filterOb.SortBy=b}}}}),a.directive("searchfilter",function(){return{replace:!0,scope:{filterObs:"=",onUpdateFilters:"&",onCloseFilters:"&"},templateUrl:"shared-components/directives/search-filters.tmpl.html"}})}(),function(a,angular){var b=angular.module("meyouthere.directives.view-content",[]);b.directive("mutViewContent",function(){return{restrict:"C",link:function(b,c){var d=a.innerHeight-43,e="";e+=" heightVal"+d,e+=" \n docHeightVal"+$(document).height(),e+=" \n outerHeight"+a.outerHeight,e+=" \n innerHeight"+a.innerHeight,c.height(d),c.css("max-height",d+"px"),c.css("overflow","scroll"),c.css("-webkit-overflow-scrolling","touch")}}})}(window,window.angular),function(a,angular){var b=angular.module("meyouthere.directives.view-footer",["meyouthere.directives.loading-click","ui.router","ui.bootstrap","meyouthere.services.route-helper"]);b.directive("mutViewFooter",[function(){return{restrict:"E",transclude:!0,scope:{modal:"="},templateUrl:"shared-components/directives/view-footer.tmpl.html",controller:["$scope","MUTRouteHelper",function(a,b){a.onButtonClick=function(a){if("back"==a.type)b.gotoPreviousState(!1);else a.callback()}}]}}])}(window,window.angular,$),function(a,angular){var b=angular.module("meyouthere.factories.filters",[]);b.factory("MUTFilterCache",["$cacheFactory",function(a){return{cache:a("MUTFilterCache"),get:function(){return this.cache.get("filters")},put:function(a){this.cache.put("filters",a)}}}])}(window,window.angular),function(a,angular){var b=angular.module("meyouthere.services.geolocation",[]);b.factory("MUTGeoCache",["$cacheFactory",function(a){return a("MUTGeoCache")}]),b.service("MUTGeoService",["$q","$window","$rootScope","MUTGeoCache",function(a,b,c,d){return{currentLocation:function(){var e="cords",f=a.defer();if(d.get(e))f.resolve(d.get(e));else if(!b.navigator)c.$apply(function(){f.reject(new Error("Geolocation is not supported"))});else b.navigator.geolocation.getCurrentPosition(function(a){d.put(e,a),c.$apply(function(){f.resolve(a)})},function(a){d.removeAll(),c.$apply(function(){f.reject(a)})});return f.promise}}}])}(window,window.angular);var mutAnalytics=angular.module("mAnalytics",[]);mutAnalytics.factory("gaServices",["$window",function(){return{recordView:function(a){ga("send",{hitType:"pageview",title:a})},recordTiming:function(a){var b=(new Date).getTime(),c=pageStartTime-b;ga("send","timing",a,"PageLoad",c,"Loaded")},recordEvent:function(a,b){ga("send",{hitType:"event",eventCategory:a,eventAction:b})}}}]),mutAnalytics.directive("gaClickEvent",["gaServices",function(a){return{link:function(b,c,d){c.bind("click",function(){a.recordEvent(d.gacat,d.gaClickEvent)})}}}]),function(a,angular,b){angular.module("geocoder",["ngStorage"]).factory("Geocoder",["$localStorage","$q","$timeout","$rootScope",function(a,c,d,e){var f=a.locations?JSON.parse(a.locations):{},g=[],h=250,i=function(){var b=g[0],c=new google.maps.Geocoder;c.geocode({address:b.address},function(c,j){if(j===google.maps.GeocoderStatus.OK){var k={lat:c[0].geometry.location.lat(),lng:c[0].geometry.location.lng(),formattedAddress:c[0].formatted_address};f[b.address]=k,a.locations=JSON.stringify(f),g.shift(),b.d.resolve(k)}else if(j===google.maps.GeocoderStatus.ZERO_RESULTS)g.shift(),b.d.reject({type:"zero",message:"Zero results for geocoding address "+b.address});else if(j===google.maps.GeocoderStatus.OVER_QUERY_LIMIT){if(b.executedAfterPause)g.shift(),b.d.reject({type:"busy",message:"Geocoding server is busy can not process address "+b.address})}else if(j===google.maps.GeocoderStatus.REQUEST_DENIED)g.shift(),b.d.reject({type:"denied",message:"Request denied for geocoding address "+b.address});else g.shift(),b.d.reject({type:"invalid",message:"Invalid request for geocoding: status="+j+", address="+b.address});if(g.length)if(j===google.maps.GeocoderStatus.OVER_QUERY_LIMIT){var l=g[0];l.executedAfterPause=!0,d(i,h)}else d(i,0);if(!e.$$phase)e.$apply()})};return{geocodeAddress:function(a){var d=c.defer();if(b.has(f,a))d.resolve(f[a]);else if(g.push({address:a,d:d}),1===g.length)i();return d.promise}}}])}(window,window.angular,_),function(a,angular){var b=angular.module("meyouthere.services.ggl-places-config",["meyouthere.services.globalconfig"]);b.service("MUTGooglePlacesConfig",["MUTGlobalConfigService","$window",function(a,b){return{defaults:function(){return angular.copy({radius:1e3,sensor:!1,key:b.atob(a.pak)},{})}}}])}(window,window.angular),angular.module("ngGPlaces",[]),angular.module("ngGPlaces").value("gPlaces",google.maps.places),angular.module("ngGPlaces").value("gMaps",google.maps),angular.module("ngGPlaces").provider("ngGPlacesAPI",function(){var a={radius:1e3,sensor:!1,latitude:null,longitude:null,photos:[],map:null,elem:null,nearbySearchErr:"Unable to find nearby places",placeDetailsErr:"Unable to find place details",textSearchErr:"Unable to find by text",_textSearchApiFnCall:"textSearch",_nearbySearchApiFnCall:"nearbySearch",_placeDetailsApiFnCall:"getDetails"};this.$get=function(b,c,d,e,f){function g(g){function h(a,c){if(c==e.PlacesServiceStatus.OK)b.$apply(function(){return l.resolve(a)});else b.$apply(function(){l.reject(i._errorMsg)})}var i=angular.copy(a,{});angular.extend(i,g);var j,k,l=c.defer();if(i._genLocation)i.location=new d.LatLng(i.latitude,i.longitude);if(i.map)j=i.map;else if(i.elem)j=i.elem;else j=f.document.createElement("div");return k=new e.PlacesService(j),k[i._apiFnCall](i,h),l.promise}return{getDefaults:function(){return a},nearbySearch:function(b){return b._genLocation=!0,b._errorMsg=a.nearbySearchErr,b._apiFnCall=a._nearbySearchApiFnCall,g(b)},textSearch:function(b){return b._genLocation=!0,b._errorMsg=a.textSearchErr,b._apiFnCall=a._textSearchApiFnCall,g(b)},placeDetails:function(b){return b._errorMsg=a.placeDetailsErr,b._apiFnCall=a._placeDetailsApiFnCall,g(b)}}},this.$get.$inject=["$rootScope","$q","gMaps","gPlaces","$window"],this.setDefaults=function(b){angular.extend(a,b)}}),function(a,angular){var b=angular.module("meyouthere.services.remote-actions",["meyouthere.factories.vf-page-data"]);b.service("MUTRemoteActions",["$q","$rootScope","VFPageData",function(a,b,c){var d=function(a,c,d){b.$apply(function(){if(c.status&&c.result.success)d.resolve(a.data);else d.reject(c)})},e={buffer:!0,escape:!0,timeout:3e4};return{confirmMeetingPlace:function(b){var f=a.defer();return Visualforce.remoting.Manager.invokeAction(c.remoteActions.confirmMeetingPlace,b,function(a,b){d(a,b,f)},e),f.promise},removeConfirmedMeetingPlace:function(b,f){var g=a.defer();return Visualforce.remoting.Manager.invokeAction(c.remoteActions.removeConfirmedMeetingPlace,b,f,function(a,b){d(a,b,g)},e),g.promise},addInviteeResponse:function(b,f,g){var h=a.defer();return Visualforce.remoting.Manager.invokeAction(c.remoteActions.addInviteeResponse,b,f,g,function(a,b){d(a,b,h)},e),h.promise},deleteEventById:function(b){var f=a.defer();return Visualforce.remoting.Manager.invokeAction(c.remoteActions.deleteEventById,b,function(a,b){d(a,b,f)},e),f.promise},loadEvents:function(b,f,g){var h=a.defer();return Visualforce.remoting.Manager.invokeAction(c.remoteActions.loadEvents,b,f,g,function(a,b){d(a,b,h)},e),h.promise},loadEvent:function(b){var f=a.defer();return Visualforce.remoting.Manager.invokeAction(c.remoteActions.loadEvent,b,function(a,b){d(a,b,f)},e),f.promise},updatePlacesConfig:function(b){var f=a.defer();return Visualforce.remoting.Manager.invokeAction(c.remoteActions.updatePlacesConfig,b,function(a,b){d(a,b,f)},e),f.promise}}}])}(window,window.angular),function(a,angular){var b=function(a){if(a.length>0)return a[a.length-1];else return void 0},c=angular.module("meyouthere.services.route-helper",[]);c.service("MUTRouteHelper",["$rootScope","$state",function(a,c){return{getPreviousState:function(c){var d=null;if(a.mutStateHistory.length){if(c)d=b(a.mutStateHistory);else d=a.mutStateHistory.pop();var e=d.state;e.data=e.data||{}}return d},gotoPreviousState:function(a){var b=this.getPreviousState(a),d={reload:!0,inherit:!1,relative:"^"};if(b&&!b.state.abstract)b.state.data.ignoreThisState=!0,c.go(b.state,angular.copy(b.params),d);else c.go("events",null,d)}}}]),c.run(["$rootScope","$state",function(a){a.$on("$stateChangeSuccess",function(c,d,e,f,g){if(!d.data.ignoreThisState){if(!a.mutStateHistory)a.mutStateHistory=[];var h=b(a.mutStateHistory);if(h&&h.state.name==f.name);else a.mutStateHistory.push({state:f,params:g})}})}])}(window,window.angular);