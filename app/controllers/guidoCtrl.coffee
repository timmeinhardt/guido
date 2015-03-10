class GuidoCtrl

  #
  #
  #
  constructor: (@$scope) ->
    @title = "Guido"
    @_initScope()
    
    @

  #
  #
  #
  _initScope: ->
    @$scope.title       = @title

GuidoCtrl.dependencies = ['$scope']

module.exports = GuidoCtrl