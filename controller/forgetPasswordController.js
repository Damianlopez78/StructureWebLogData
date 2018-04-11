wlog.controller('forgetPasswordController', ['$rootScope','$scope', function($rootScope,$scope) {

    $scope.valid_id = 0
    $scope.checkId = function(){

        $scope.valid_id = 1;
        $scope.message = "A reset link has been sent to the above ID"
    }


}]);