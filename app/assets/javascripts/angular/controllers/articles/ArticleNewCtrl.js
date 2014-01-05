myApp.controller('ArticleNewCtrl', ['$scope', function($scope) {
  $scope.article = { tags: [] };
  $scope.addTag = function(articleTag){
    $scope.article.tags.push(articleTag)
  }
}]);
