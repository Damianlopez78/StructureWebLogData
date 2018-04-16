var wlog = angular.module('wlog', ['ngRoute']);

wlog.config(['$routeProvider',
function ($routeProvider) {

    $routeProvider.when('/login', {
        templateUrl: 'login.html',
        controller: 'loginController'
    }).when('/home', {
        templateUrl: 'home.html',
        controller: 'homeController'
    }).when('/transactions', {
        templateUrl: 'transactions.html',
        controller: 'transactionsController'
    }).when('/graphs', {
        templateUrl: 'graphs.html',
        controller: 'graphsController'
    }).when('/forgetPassword', {
        templateUrl: 'forgetPassword.html',
        controller: 'forgetPasswordController'
    }).when('/registration', {
        templateUrl: 'registration.html',
        controller: 'registrationController'
    }).otherwise({
        redirectTo: '/login'
    });

}]);

