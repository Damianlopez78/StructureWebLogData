wlog.controller('homeController', ['$rootScope','$scope', function($rootScope,$scope) {

    $scope.admin=1;
    $scope.books = [{remote_address: 'in24.inetnebr.com', remote_logname:'-', user:'-', time:'01/Aug/1995:00:00:01 -0400', request:'GET /shuttle/missions/sts-68/news/sts-68-mcc-05.txt HTTP/1.0', status:'200', bytes:'1839'},
                    {remote_address: 'ix-esc-ca2-07.ix.netcom.com', remote_logname:'-', user:'-', time:'01/Aug/1995:00:00:09 -0400', request:'GET /images/launch-logo.gif HTTP/1.0', status:'200', bytes:'1713'},
                    {remote_address: 'slppp6.intermind.net', remote_logname:'-', user:'-', time:'01/Aug/1995:00:00:12 -0400', request:'GET /images/ksclogosmall.gif HTTP/1.0', status:'200', bytes:'3635'},
                    {remote_address: 'kgtyk4.kj.yamagata-u.ac.jp', remote_logname:'-', user:'-', time:'01/Aug/1995:00:00:17 -0400', request:'GET / HTTP/1.0', status:'200', bytes:'7280'},
                    {remote_address: 'kgtyk4.kj.yamagata-u.ac.jp', remote_logname:'-', user:'-', time:'01/Aug/1995:00:00:21 -0400', request:'GET /images/NASA-logosmall.gif HTTP/1.0', status:'304', bytes:'0'},
                         ];


}]);