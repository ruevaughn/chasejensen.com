describe('ArticleNewCtrl', function(){
  var $scope;
  beforeEach(module('myApp'));
  beforeEach(inject(function($rootScope, $controller){
     $scope = $rootScope.$new();
     $controller('ArticleNewCtrl', {$scope: $scope});
  }));

  describe('Article setup to be created', function(){
    it( 'has a default date of today', function(){
      expect($scope.article.publishedAt).toBeDefined();
    });

    it( 'initially has no tags', function(){
      expect($scope.article.tags.length).toBe(0);
    });
  });

  describe('clear', function(){
    it('clears the articles date', function(){
      $scope.clear();
      expect($scope.article.publishedAt).toBeNull();
    });
  });

  describe('opened', function(){
    it('is initially null', function() {
      expect($scope.opened).toBeUndefined();
    });

  });

  describe('open', function(){
    xit('sets toggles true false',function() {
      $scope.open();
      expect($scope.opened).toBe(true);
    })
  });

  describe('Sets the date options', function(){
    it('Sets the default date options', function(){
      expect($scope.dateOptions).not.toBeNull();
    });

    it('Sets the available dates', function(){
      expect($scope.formats).not.toBeNull();
    });

    it('sets the default date', function(){
      expect($scope.format).not.toBeNull();
    });

    it('sets show weeks to true', function(){
      expect($scope.showWeeks).toEqual(true);
    });
  });

  describe('showPreview', function() {

  });

});
