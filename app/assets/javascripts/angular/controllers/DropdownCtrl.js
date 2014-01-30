myApp.controller('DropdownCtrl', ['$scope', function($scope){
  $scope.internalDrop = [
    { name: 'Project Samples', href: '/samples' },
    { name: 'Resume', href: '/resume' }
  ];

  $scope.externalDrop = [
    { name: 'Github', href: 'https://github.com/ruevaughn' },
    { name: 'Stack Overflow', href: 'https://stackoverflow.com/users/972040/ruevaughn' }
  ];
}])
