myApp.controller('ArticleNewCtrl', ['$scope','$window', '$location', '$resource', 'Articles', function($scope, $window, $location, $resource, Articles) {
  $scope.article = {
    publishedAt: new Date(),
    tags: []
  };
  $scope.showPreview = function(articleBody, articleTitle){
     $resource('/api/generate/preview').get({body: articleBody}, function(resource){
       $scope.preview = {}
       $scope.preview.title = "<h1>" + articleTitle + "</h1>"
       $scope.preview.body = resource.preview;
    })
  }
  $scope.addTag = function(articleTag){
    $scope.article.tags.push(articleTag);
  }
}]);
