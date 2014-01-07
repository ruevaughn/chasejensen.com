myApp.factory('Articles', ['$resource', function($resource){
  return $resource( '/:articleId', { articleId: '@articleId' } );
}]);
