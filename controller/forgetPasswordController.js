wlog.controller('forgetPasswordController', ['$rootScope','$scope', function($rootScope,$scope) {

    $scope.valid_id = 0
    $scope.checkId = function(){

        $http({
            method : 'POST',
            url : 'cgi-bin/forget_password.py',
            data : angular.toJson($scope.email_id),
            headers: {'Content-Type': 'application/json'}
        }).then(function (response) {
             console.log($scope.email_id);
             console.log(response);
		});
        $scope.valid_id = 1;
        $scope.message = "A reset link has been sent to the above ID"
    }



}]);