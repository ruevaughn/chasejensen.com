describe('ArticleNewCtrl Function', function(){
  describe('ArticleNewCtrl', function(){
    var $scope;
    beforeEach(module('myApp'));
    beforeEach(inject(function($rootScope, $controller){
       $scope = $rootScope.$new();
       $controller('ArticleNewCtrl', {$scope: $scope});
    }));

    it( 'should setup an article', function(){
      expect($scope.article.tags.length).toBe(3);
    });
  });
});
