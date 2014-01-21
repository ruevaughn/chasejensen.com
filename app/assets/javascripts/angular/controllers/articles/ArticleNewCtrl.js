myApp.controller('ArticleNewCtrl', ['$scope', '$resource', 'Restangular', function($scope, $resource, Restangular) {

  $scope.article = {
    publishedAt: new Date(),
    tags: []
  };

  $scope.clear = function(){
    $scope.article.publishedAt = null;
  };

  $scope.open = function($event){
    $event.preventDefault();
    $event.stopPropagation();
    $scope.opened = !$scope.opened

  };

  $scope.dateOptions = {
    'year-format': "'yy'",
    'starting-day': 1
  };

  $scope.formats = ['dd-MMMM-yyyy', 'yyyy/MM/dd', 'shortDate']
  $scope.format = $scope.formats[0];

  $scope.showWeeks = true;
  $scope.toggleWeeks = function() {
    $scope.showWeeks = ! $scope.showWeeks;
  };






  $scope.showPreview = function(articleBody, articleTitle){
     $resource('/api/generate/preview').get({body: articleBody}, function(resource){
       $scope.preview = {}
       $scope.preview.title = "<h1>" + articleTitle + "</h1>"
       $scope.preview.body = resource.preview;
    })
  };

  $scope.addTag = function(articleTag){
    $scope.article.tags.push(articleTag);
    $scope.articleTag = '';
  };

  $scope.removeTag = function(tagIndex){
    $scope.article.tags.splice(tagIndex, 1);
  };

  $scope.createArticle = function(form){
    articles = Restangular.all('api/articles');
    article = {title: form.title, body: form.body}
    articles.post({article: article, tags: form.tags}).then(function(resource){
      $scope.article = {};
    })

  }
}]);
