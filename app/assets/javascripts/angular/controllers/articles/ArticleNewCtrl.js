myApp.controller('ArticleNewCtrl', ['$scope', '$resource', 'Restangular', function($scope, $resource, Restangular) {
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

  $scope.createArticle = function(form){
    articles = Restangular.all('api/articles');
    article = {title: form.title, body: form.body}
    articles.post({article: article})

  }
}]);
