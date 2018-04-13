wlog.controller('weblogregisterController', ['$rootScope','$scope', function($rootScope,$scope) {

    //HTTP POST method for login.
    $scope.submitLoginForm = function() {
        var method = "";
        var url = "";
        if ($scope.weblogregisterControllerForm.id == -1) {
            method = "POST";
            url = 'RAHLMS/login';
        }
        $http({
            method : method,
            url : url,
            data : angular.toJson($scope.loginForm),
            headers : {
                'Content-Type' : 'application/json'
            }
        }).then(_success, _error);
    };
}]);