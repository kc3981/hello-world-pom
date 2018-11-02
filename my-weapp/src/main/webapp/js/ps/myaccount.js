 angular.module('myaccount', [])
      .controller('MyAccountController', ['$scope', function ($scope) {
        $scope.greetMe = 'Hello World';
      }]);

    angular.element(function() {
      angular.bootstrap(document, ['myaccount']);
    });