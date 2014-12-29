meyouthereApp.config(function($stateProvider, $urlRouterProvider) {
    $urlRouterProvider.otherwise('/' + globalPageData.defaultView);
    $stateProvider
        .state('events', {
            url             : '/events',
            templateUrl     : 'eventList.tmpl',
            controller      : 'EventListController'
        })
});



// Light  weight cache for events for access across the views    
meyouthereApp.factory('EventCache', ['$cacheFactory', function($cacheFactory) {
 return $cacheFactory('EventCache');
}]);



 // Factories
meyouthereApp.factory('EventFactory', ['$q', '$rootScope', 'EventCache', '$filter', function($q, $rootScope, EventCache, $filter) {
    return {
        findEventById : function(evtId) {
            var trimmedEventArray = $filter('filter')(EventCache.get('events'), {sfdcEventId : evtId});
            return trimmedEventArray && trimmedEventArray.length >= 1 ? trimmedEventArray[0] : null;  
        },
        loadEvents : function(contactId, howManyDays) {
            var deferred = $q.defer();
            Visualforce.remoting.Manager.invokeAction(
                globalPageData.currentPage.remoteActions.loadEventList,
                contactId, howManyDays,
                function(result, event) {
                    $rootScope.$apply(function() {
                      if (event.status) {
                        EventCache.put('events', result);  
                        deferred.resolve(result);
                      } else {
                        EventCache.removeAll(); 
                        deferred.reject(event);
                      }
                    })
                },
                { buffer: true, escape: true, timeout: 30000 }
            );
            return deferred.promise;
        },
        updateEventByPlace : function(eventId,gPlaceId,Name,formatted_address,icon) {
            var deferred = $q.defer();
            console.log(eventId+'-'+gPlaceId+'-'+Name+'-'+formatted_address+'-'+icon);
            Visualforce.remoting.Manager.invokeAction(globalPageData.currentPage.remoteActions.saveSelectedPlace,
                eventId,gPlaceId,Name,formatted_address,icon, function(result, event){
                    if(event.status) {
                        console.log(event);
                        deferred.resolve(result);
                    } else {
                        deferred.reject(event);
                    }
                }
            );
            return deferred.promise;
        }
    };
}]);



//
// Controllers
//

meyouthereApp.controller('EventListController', ['$scope', 'EventFactory','$state',
    function($scope, EventFactory, $state){
        $scope.security = globalPageData.security;
        $scope.showingEventForHowManyDays = 7;
        
        $scope.loadEvents = function (howManyDays) {
            EventFactory.loadEvents(globalPageData.currentPage.parameters.id, howManyDays).then(
                function (result) {
                    $scope.events = result;
                    if (!result || result.length == 0 ) {
                        $scope.error = {message: 'No events found'};
                    } else {
                        $scope.error = null;
                    }
                },
                function (error)  {
                    $scope.error = error;
                    alert( 'ERROR: ' + error.message);
                }
            );
        }
        
        $scope.newEvent = function() {
            sforce.one.createRecord('Event');
        }
        
        $scope.showNextCard = function (evt) {
             sforce.one.navigateToSObject(evt.sfdcEventId);
        }
        
        $scope.setShowingEventForHowManyDays = function(val) {
		    console.log(event);
			$scope.showingEventForHowManyDays = val;
			$scope.loadEvents(val);
		}
        
        // Load first lot of events
        $scope.loadEvents($scope.showingEventForHowManyDays);
        
    }    
    
]);

