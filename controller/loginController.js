wlog.controller("loginController",['$rootScope','$scope','$http','$window', function($rootScope, $scope, $http, $window) {
    $scope.loginForm = {
        id : -1,
        userName : "",
        password : "",
        checkAdmin : ""
    };

    console.log($scope.loginForm);
    $scope.login = function(){
    $http({
            method : 'POST',
            url : 'cgi-bin/login.py',
            data : angular.toJson($scope.loginForm),
            headers: {
                'Content-Type': 'application/json'
            }
        }).then(function (response) {
             console.log($scope.loginForm);
             console.log(response);
		});
	};

//    //Clear the form
//    function _clearFormData() {
//        $scope.loginForm.id = -1;
//        $scope.loginForm.userName = "";
//        $scope.loginForm.password = "";
//        $scope.loginForm.checkAdmin = "";
//        };
}]);