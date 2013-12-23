myApp = angular.module('myApp', ['ngRoute']);

myApp.config(function($routeProvider, $locationProvider){
  $routeProvider.when( '/portfolio', {
    templateUrl: '../assets/angular_templates/portfolio.html',
    controller: 'PortfolioCtrl'
  }),

  $routeProvider.when( '/blog', {
    templateUrl: '../assets/angular_templates/blog.html',
    controller: 'BlogCtrl'
  }),

  $routeProvider.otherwise({
    templateUrl: '../assets/angular_templates/home.html',
    controller: 'HomeCtrl'
  }),
  $locationProvider.html5Mode(true);
})
