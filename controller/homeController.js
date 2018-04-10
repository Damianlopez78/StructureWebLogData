wlog.controller('homeController', ['$rootScope','$scope', function($rootScope,$scope) {

    $scope.admin=1;
    $scope.books = [{doc_id: '112', title:'How to cook', info:'John', random_no:'1'},
                         {doc_id: '221', title:'Driving', info:'Mary', random_no:'4'},
                         {doc_id: '123', title:'Exams', info:'Mike', random_no:'7'},
                         {doc_id: '465', title:'Car Magazine', info:'Adam', random_no:'11'},
                         {doc_id: '545', title:'PC Magazine', info:'Julie', random_no:'3'},
                         {doc_id: '645', title:'How to not be Trump', info:'Donald', random_no:'76'}];


}]);