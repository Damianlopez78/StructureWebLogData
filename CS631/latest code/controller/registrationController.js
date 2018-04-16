wlog.controller('registrationController', ['$rootScope','$scope', function($rootScope,$scope) {

    $scope.valid_id = 0
    $scope.register = function(){

        $http({
            method : 'POST',
            url : 'cgi-bin/register.py',
            data : angular.toJson($scope.registerForm),
            headers: {'Content-Type': 'application/json'}
            }).then(function (response) {
             console.log($scope.registerForm);
             console.log(response);
		});
        $scope.valid_id = 1;
        $scope.message = "Thanks for signing up"
    };

}]);